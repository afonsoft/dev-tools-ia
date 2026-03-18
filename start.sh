#!/bin/bash

# Cores para melhor visualização
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

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

check_docker() {
    if ! docker info > /dev/null 2>&1; then
        print_error "Docker não está rodando. Por favor, inicie o Docker primeiro."
        exit 1
    fi
}

check_docker_compose() {
    if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
        print_error "docker-compose não encontrado. Por favor, instale docker-compose."
        exit 1
    fi
}

create_directories() {
    print_status "Criando diretórios necessários..."
    mkdir -p workspace openhands
    print_success "Diretórios criados"
}

check_system_resources() {
    print_status "Verificando recursos do sistema..."
    if command -v free &> /dev/null; then
        TOTAL_MEM=$(free -g | awk '/^Mem:/{print $2}')
        print_status "Memória total: ${TOTAL_MEM}GB"
        if [ "$TOTAL_MEM" -lt 8 ]; then
            print_warning "Memória baixa detectada (< 8GB). Considere usar docker-compose.low-resource.yml"
        fi
    fi
    if command -v nproc &> /dev/null; then
        TOTAL_CPU=$(nproc)
        print_status "CPUs disponíveis: ${TOTAL_CPU}"
        if [ "$TOTAL_CPU" -lt 4 ]; then
            print_warning "CPUs limitados (< 4). Performance pode ser reduzida"
        fi
    fi
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

check_containers() {
    print_status "Verificando status dos containers..."
    if command -v docker-compose &> /dev/null; then
        docker-compose ps
    else
        docker compose ps
    fi
}

show_error_logs() {
    print_status "Verificando logs de erro..."
    if command -v docker-compose &> /dev/null; then
        docker-compose logs --tail=20 | grep -i error || print_success "Nenhum erro encontrado nos logs"
    else
        docker compose logs --tail=20 | grep -i error || print_success "Nenhum erro encontrado nos logs"
    fi
}

check_gemini_api_key() {
    print_status "Verificando configuração da API Gemini..."
    
    # Verificar settings.json
    local settings_key=""
    if [ -f "openhands/settings.json" ]; then
        settings_key=$(grep -o '"llm_api_key":[[:space:]]*"[^"]*"' openhands/settings.json | sed 's/.*"llm_api_key":[[:space:]]*"\([^"]*\)".*/\1/')
    fi
    
    # Verificar config.json
    local config_key=""
    if [ -f "openhands/config.json" ]; then
        config_key=$(grep -o '"api_key":[[:space:]]*"[^"]*"' openhands/config.json | sed 's/.*"api_key":[[:space:]]*"\([^"]*\)".*/\1/')
    fi
    
    # Verificar se algum dos arquivos tem a API key configurada
    if [[ "$settings_key" == "YOUR_API_KEY_HERE" || "$settings_key" == "" || "$config_key" == "YOUR_API_KEY_HERE" || "$config_key" == "" ]]; then
        print_error "API Key do Gemini não configurada!"
        echo ""
        echo "Para usar o Dev Tools IA com Gemini API, você precisa:"
        echo "1. Obter uma API Key em: https://aistudio.google.com/app/apikey"
        echo "2. Configurar a API Key nos arquivos:"
        echo "   - openhands/settings.json (campo llm_api_key)"
        echo "   - openhands/config.json (campo api_key)"
        echo ""
        echo -n "Deseja configurar a API Key agora? (s/N): "
        read -r response
        if [[ "$response" =~ ^[Ss]$ ]]; then
            configure_gemini_api_key
        else
            print_error "Configure a API Key antes de executar o script."
            exit 1
        fi
    else
        print_success "API Key do Gemini configurada corretamente!"
    fi
}

configure_gemini_api_key() {
    echo ""
    print_status "Configuração da API Key Gemini"
    echo "Obtenha sua API Key em: https://aistudio.google.com/app/apikey"
    echo ""
    echo -n "Digite sua API Key Gemini: "
    read -r api_key
    
    if [[ "$api_key" == "" ]]; then
        print_error "API Key não pode ser vazia!"
        exit 1
    fi
    
    # Atualizar settings.json
    if [ -f "openhands/settings.json" ]; then
        print_status "Atualizando openhands/settings.json..."
        if command -v jq &> /dev/null; then
            jq --arg api_key "$api_key" '.llm_api_key = $api_key' openhands/settings.json > temp_settings.json && mv temp_settings.json openhands/settings.json
        else
            # Fallback para sed se jq não estiver disponível
            sed -i "s/\"llm_api_key\":[[:space:]]*\"YOUR_API_KEY_HERE\"/\"llm_api_key\": \"$api_key\"/g" openhands/settings.json
            sed -i "s/\"llm_api_key\":[[:space:]]*\"\"/\"llm_api_key\": \"$api_key\"/g" openhands/settings.json
        fi
        print_success "settings.json atualizado!"
    fi
    
    # Atualizar config.json
    if [ -f "openhands/config.json" ]; then
        print_status "Atualizando openhands/config.json..."
        if command -v jq &> /dev/null; then
            jq --arg api_key "$api_key" '.llm.api_key = $api_key' openhands/config.json > temp_config.json && mv temp_config.json openhands/config.json
        else
            # Fallback para sed se jq não estiver disponível
            sed -i "s/\"api_key\":[[:space:]]*\"YOUR_API_KEY_HERE\"/\"api_key\": \"$api_key\"/g" openhands/config.json
            sed -i "s/\"api_key\":[[:space:]]*\"\"/\"api_key\": \"$api_key\"/g" openhands/config.json
        fi
        print_success "config.json atualizado!"
    fi
    
    print_success "API Key configurada com sucesso!"
}

# Detecta o sistema operacional
OS_TYPE="$(uname -s)"

# Início do script
echo "======================================"
echo "🚀 Dev Tools IA - Deploy Inteligente"
echo "======================================"

check_docker
check_docker_compose

# Verificar API Key antes de continuar
check_gemini_api_key

print_status "Encerrando ambiente anterior (se existir)..."
if command -v docker-compose &> /dev/null; then
    docker-compose down --remove-orphans
else
    docker compose down --remove-orphans
fi

print_status "Preparando ambiente..."
create_directories
check_system_resources

COMPOSE_FILE="docker-compose.yml"
if command -v free &> /dev/null; then
    TOTAL_MEM=$(free -g | awk '/^Mem:/{print $2}')
    if [ "$TOTAL_MEM" -lt 8 ]; then
        COMPOSE_FILE="docker-compose.low-resource.yml"
        print_warning "Usando configuração low-resource devido à memória limitada"
    fi
fi

print_status "Usando: $COMPOSE_FILE"
if command -v docker-compose &> /dev/null; then
    docker-compose -f "$COMPOSE_FILE" up --build -d
else
    docker compose -f "$COMPOSE_FILE" up --build -d
fi

if [ $? -ne 0 ]; then
    print_error "Falha no build dos containers"
    show_error_logs
    exit 1
fi

print_success "Containers iniciados com sucesso!"
sleep 10
check_containers

print_status "Aguardando inicialização dos serviços..."
wait_for_service "OpenHands" 3000

print_status "Abrindo serviços no navegador..."
if [[ "$OS_TYPE" == "Linux" ]]; then
    if command -v xdg-open &> /dev/null; then
        xdg-open http://localhost:3000 2>/dev/null &
    fi
elif [[ "$OS_TYPE" == "Darwin" ]]; then
    open http://localhost:3000 2>/dev/null &
elif [[ "$OS_TYPE" == "MINGW"* ]] || [[ "$OS_TYPE" == "CYGWIN"* ]] || [[ -n "$WINDIR" ]]; then
    start http://localhost:3000 2>/dev/null
else
    print_warning "Não foi possível detectar o sistema operacional para abrir URLs automaticamente."
fi

print_success "🎉 Ambiente iniciado com sucesso!"
print_status "Para encerrar o ambiente, execute: docker-compose down"
