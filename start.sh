#!/bin/bash

# Cores para melhor visualização
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Função para imprimir com cores
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Função para verificar se Docker está rodando
check_docker() {
    if ! docker info > /dev/null 2>&1; then
        print_error "Docker não está rodando. Por favor, inicie o Docker primeiro."
        exit 1
    fi
}

# Função para verificar se docker-compose está disponível
check_docker_compose() {
    if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
        print_error "docker-compose não encontrado. Por favor, instale docker-compose."
        exit 1
    fi
}

# Função para criar diretórios necessários
create_directories() {
    print_status "Criando diretórios necessários..."
    mkdir -p workspace ollama open-webui openhands
    print_success "Diretórios criados"
}

# Função para verificar recursos do sistema
check_system_resources() {
    print_status "Verificando recursos do sistema..."
    
    # Verifica memória disponível
    if command -v free &> /dev/null; then
        TOTAL_MEM=$(free -g | awk '/^Mem:/{print $2}')
        print_status "Memória total: ${TOTAL_MEM}GB"
        
        if [ "$TOTAL_MEM" -lt 8 ]; then
            print_warning "Memória baixa detectada (< 8GB). Considere usar docker-compose.low-resource.yml"
        fi
    fi
    
    # Verifica CPUs
    if command -v nproc &> /dev/null; then
        TOTAL_CPU=$(nproc)
        print_status "CPUs disponíveis: ${TOTAL_CPU}"
        
        if [ "$TOTAL_CPU" -lt 4 ]; then
            print_warning "CPUs limitados (< 4). Performance pode ser reduzida"
        fi
    fi
    
    # Verifica GPU NVIDIA
    if command -v nvidia-smi &> /dev/null; then
        GPU_MEMORY=$(nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits | head -1)
        print_status "GPU NVIDIA detectada: ${GPU_MEMORY}MB VRAM"
        
        if [ "$GPU_MEMORY" -lt 8000 ]; then
            print_warning "VRAM limitada (< 8GB). Considere usar modelo menor"
        fi
    else
        print_warning "Nenhuma GPU NVIDIA detectada. Usando CPU-only"
    fi
}

# Função para aguardar serviço ficar pronto
wait_for_service() {
    local service_name=$1
    local port=$2
    local max_attempts=30
    local attempt=1
    
    print_status "Aguardando $service_name ficar pronto (porta $port)..."
    
    while [ $attempt -le $max_attempts ]; do
        if curl -s "http://localhost:$port" > /dev/null 2>&1; then
            print_success "$service_name está pronto!"
            return 0
        fi
        
        echo -n "."
        sleep 2
        attempt=$((attempt + 1))
    done
    
    print_warning "$service_name pode não estar completamente pronto após $((max_attempts * 2)) segundos"
    return 1
}

# Função para verificar status dos containers
check_containers() {
    print_status "Verificando status dos containers..."
    
    if command -v docker-compose &> /dev/null; then
        docker-compose ps
    else
        docker compose ps
    fi
}

# Função para mostrar logs de erro
show_error_logs() {
    print_status "Verificando logs de erro..."
    
    if command -v docker-compose &> /dev/null; then
        docker-compose logs --tail=20 | grep -i error || print_success "Nenhum erro encontrado nos logs"
    else
        docker compose logs --tail=20 | grep -i error || print_success "Nenhum erro encontrado nos logs"
    fi
}

# Início do script
echo "======================================"
echo "🚀 Dev Tools IA - Deploy Inteligente"
echo "======================================"

# Verificações pré-requisitos
check_docker
check_docker_compose

echo ""
print_status "Encerrando ambiente anterior (se existir)..."
if command -v docker-compose &> /dev/null; then
    docker-compose down --remove-orphans
else
    docker compose down --remove-orphans
fi

echo ""
print_status "Preparando ambiente..."
create_directories
check_system_resources

echo ""
echo "======================================"
echo "🔨 Iniciando build dos containers"
echo "======================================"

# Escolhe o compose file baseado nos recursos
COMPOSE_FILE="docker-compose.yml"
if command -v free &> /dev/null; then
    TOTAL_MEM=$(free -g | awk '/^Mem:/{print $2}')
    if [ "$TOTAL_MEM" -lt 8 ]; then
        COMPOSE_FILE="docker-compose.low-resource.yml"
        print_warning "Usando configuração low-resource devido à memória limitada"
    fi
fi

print_status "Usando: $COMPOSE_FILE"

# Build e start
if command -v docker-compose &> /dev/null; then
    docker-compose -f "$COMPOSE_FILE" up --build -d
else
    docker compose -f "$COMPOSE_FILE" up --build -d
fi

# Verifica se o build foi bem sucedido
if [ $? -ne 0 ]; then
    print_error "Falha no build dos containers"
    show_error_logs
    exit 1
fi

print_success "Containers iniciados com sucesso!"

echo ""
print_status "Aguardando inicialização dos serviços..."
sleep 10

# Verifica status dos containers
check_containers

echo ""
echo "======================================"
echo "🌐 URLs dos Serviços"
echo "======================================"
echo "OpenHands:   http://localhost:3000"
echo "Open-WebUI:  http://localhost:8080"
echo "Ollama API:  http://localhost:11434"

# Aguarda serviços ficarem prontos
wait_for_service "Ollama" 11434
wait_for_service "OpenHands" 3000

echo ""
echo "======================================"
echo "📊 Informações Úteis"
echo "======================================"
echo "Para monitorar logs: docker-compose logs -f"
echo "Para parar: docker-compose down"
echo "Para reiniciar: docker-compose restart"

echo ""
print_status "Abrindo serviços no navegador..."

# Detecta o sistema operacional para usar o comando correto
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Comando para Linux
    if command -v xdg-open &> /dev/null; then
        xdg-open http://localhost:3000 2>/dev/null &
        xdg-open http://localhost:8080 2>/dev/null &
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Comando para macOS
    open http://localhost:3000 2>/dev/null &
    open http://localhost:8080 2>/dev/null &
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]] || [[ -n "$WINDIR" ]]; then
    # Comando para Windows
    start http://localhost:3000 2>/dev/null
    start http://localhost:8080 2>/dev/null
else
    print_warning "Não foi possível detectar o sistema operacional para abrir URLs automaticamente."
fi

echo ""
print_success "🎉 Ambiente iniciado com sucesso!"
echo ""
print_status "Para encerrar o ambiente, execute: docker-compose down"
