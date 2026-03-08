#!/bin/bash

# Cores para melhor visualização
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
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

print_header() {
    echo -e "${CYAN}=== $1 ===${NC}"
}

# Função para mostrar ajuda
show_help() {
    echo "Uso: $0 [OPÇÕES] <nome-do-modelo>"
    echo ""
    echo "Opções:"
    echo "  -h, --help              Mostra esta ajuda"
    echo "  -l, --list             Lista modelos disponíveis"
    echo "  -c, --check            Verifica configuração atual"
    echo "  -b, --backup           Faz backup das configurações"
    echo "  -r, --restore          Restaura backup"
    echo "  -t, --temperature N    Define temperatura (0.0-2.0)"
    echo "  -f, --file FILE        Usa arquivo de configuração específico"
    echo "  --low-memory          Configura para sistemas com pouca memória (8GB)"
    echo "  --rtx2050             Configura otimizada para RTX 2050"
    echo "  --check-only          Apenas verifica, não altera nada"
    echo ""
    echo "Opções de Hardware:"
    echo "  --rtx3050              Configura para RTX 3050 (8GB VRAM)"
    echo "  --rtx4050              Configura para RTX 4050 (6GB VRAM)"
    echo "  --rtx4060              Configura para RTX 4060 (8GB VRAM, otimizado)"
    echo "  --rtx4070              Configura para RTX 4070 (12GB VRAM)"
    echo "  --cpu-only             Configura para CPU-only (sem GPU)"
    echo ""
    echo "Modelos disponíveis:"
    echo "  • qwen2.5-coder:7b-instruct-q4_K_M    (RTX 2050 - Ideal)"
    echo "  • qwen2.5-coder:7b-instruct-q4_K_M    (RTX 3050/4050)"
    echo "  • qwen2.5-coder:7b-instruct-q4_K_M    (Geral)"
    echo "  • qwen2.5-coder:1.5b                       (Ultra leve)"
    echo "  • qwen2.5-coder:3b                        (Mínimo)"
    echo "  • qwen2.5:7b-instruct                    (Alternativo)"
    echo "  • qwen2.5:14b                           (Alta performance)"
    echo "  • deepseek-coder:6.7b                   (Alternativo)"
    echo "  • deepseek-coder:33b                       (Alta performance)"
    echo "  • llama3.2:3b                           (Ultra leve)"
    echo "  • llama3.2:1b                           (Mínimo)"
    echo "  • codellama:7b                           (Alternativo)"
    echo "  • codellama:13b                          (Alta performance)"
    echo "  • codellama:34b                          (Máxima performance)"
    echo "  • phi:latest                              (Ultra leve)"
    echo "  • phi:2.7b                              (Mínimo)"
    echo "  • mistral:7b                             (Alternativo)"
    echo "  • mistral:7b-instruct                     (Alternativo)"
    echo "  • neural-chat:7b                         (CPU-friendly)"
    echo "  • devstral:24b                            (Alta performance)"
    echo ""
    echo "Exemplos de uso:"
    echo "  $0 --rtx2050 qwen2.5-coder:7b-instruct-q4_K_M"
    echo "  $0 --low-memory qwen2.5-coder:7b-instruct-q4_K_M"
    echo "  $0 --cpu-only phi:latest"
    echo ""
    echo "Arquivos de configuração:"
    echo "  • docker-compose.yml     - Configuração principal"
    echo "  • openhands/settings.json - Configurações OpenHands"
    echo "  • vscode-continue-config.json - Config VS Code + Continue"
}

# Função para verificar recursos do sistema
check_resources() {
    print_status "Verificando recursos do sistema..."
    
    local total_mem=0
    local gpu_mem=0
    local cpu_count=0
    
    # Memória RAM
    if command -v free &> /dev/null; then
        total_mem=$(free -g | awk '/^Mem:/{print $2}')
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        total_mem=$(sysctl -n hw.memsize | awk '{print int($1/1024/1024/1024)}')
    fi
    
    # CPU
    if command -v nproc &> /dev/null; then
        cpu_count=$(nproc)
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        cpu_count=$(sysctl -n hw.ncpu)
    fi
    
    # GPU
    if command -v nvidia-smi &> /dev/null; then
        gpu_mem=$(nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits | head -1)
    fi
    
    echo "RAM: ${total_mem}GB | CPU: ${cpu_count} cores | GPU: ${gpu_mem}MB"
    
    # Retorna recomendações
    if [ "$gpu_mem" -ge 16000 ]; then
        echo "Recomendado: devstral:24b ou modelos grandes"
    elif [ "$gpu_mem" -ge 8000 ]; then
        echo "Recomendado: llama3.2:3b ou modelos médios"
    elif [ "$gpu_mem" -ge 4000 ]; then
        echo "Recomendado: qwen2.5-coder:7b-instruct-q4_K_M (Perfeito para RTX 2050)"
    elif [ "$gpu_mem" -gt 0 ]; then
        echo "Recomendado: qwen2.5:1.5b ou modelos leves"
    else
        echo "Recomendado: qwen2.5:1.5b (CPU-only)"
    fi
}

# Função para listar modelos disponíveis
list_models() {
    print_header "Modelos Disponíveis"
    
    # Modelos populares com suas características
    echo ""
    echo "🚀 Modelos de Alta Performance:"
    echo "  devstral:24b       ~14GB VRAM | Excelente para código"
    echo "  llama3.1:70b       ~40GB VRAM | Máxima capacidade"
    echo "  mixtral:8x7b       ~48GB VRAM | Multi-linguagem"
    echo ""
    echo "⚡ Modelos Médios:"
    echo "  llama3.2:3b        ~2GB VRAM  | Bom equilíbrio"
    echo "  qwen2.5:7b         ~5GB VRAM  | Chinês/Inglês"
    echo "  codellama:7b       ~5GB VRAM  | Foco em código"
    echo ""
    echo "💎 RTX 2050 Optimized:"
    echo "  qwen2.5-coder:7b-instruct-q4_K_M  ~4GB VRAM | Especialista C#/.NET"
    echo ""
    echo "🪶 Modelos Leves:"
    echo "  qwen2.5:1.5b       ~1GB VRAM  | CPU-friendly"
    echo "  phi3:mini          ~2GB VRAM  | Microsoft"
    echo "  gemma:2b           ~2GB VRAM  | Google"
    echo ""
    
    check_resources
}

# Função para validar nome do modelo
validate_model() {
    local model=$1
    
    # Verifica formato básico
    if [[ ! "$model" =~ ^[a-zA-Z0-9_:-]+$ ]]; then
        print_error "Nome do modelo inválido: $model"
        print_error "Use formato: nome:versão (ex: llama3.2:3b)"
        return 1
    fi
    
    # Verifica se não está vazio
    if [ -z "$model" ]; then
        print_error "Nome do modelo não pode ser vazio"
        return 1
    fi
    
    return 0
}

# Função para verificar se arquivo existe
check_file() {
    local file=$1
    
    if [ ! -f "$file" ]; then
        print_error "Arquivo não encontrado: $file"
        return 1
    fi
    
    if [ ! -w "$file" ]; then
        print_error "Sem permissão para escrever: $file"
        return 1
    fi
    
    return 0
}

# Função para fazer backup
backup_config() {
    local backup_dir="backups"
    local timestamp=$(date +"%Y%m%d_%H%M%S")
    
    print_status "Criando backup das configurações..."
    
    mkdir -p "$backup_dir"
    
    # Backup docker-compose.yml
    if [ -f "docker-compose.yml" ]; then
        cp docker-compose.yml "$backup_dir/docker-compose_$timestamp.yml"
        print_success "Backup: docker-compose.yml"
    fi
    
    # Backup settings.json
    if [ -f "openhands/settings.json" ]; then
        cp openhands/settings.json "$backup_dir/settings_$timestamp.json"
        print_success "Backup: openhands/settings.json"
    fi
    
    # Backup low-resource se existir
    if [ -f "docker-compose.low-resource.yml" ]; then
        cp docker-compose.low-resource.yml "$backup_dir/docker-compose.low-resource_$timestamp.yml"
        print_success "Backup: docker-compose.low-resource.yml"
    fi
    
    print_success "Backup concluído em: $backup_dir/"
}

# Função para verificar configuração atual
check_config() {
    print_header "Configuração Atual"
    
    # Docker-compose.yml
    if [ -f "docker-compose.yml" ]; then
        echo ""
        echo "📄 docker-compose.yml:"
        grep -E "(OPENHANDS_LLM_MODEL|OLLAMA_MODEL)" docker-compose.yml | sed 's/^[[:space:]]*/  /'
    fi
    
    # Settings.json
    if [ -f "openhands/settings.json" ]; then
        echo ""
        echo "📄 openhands/settings.json:"
        grep -E "(llm_model|llm_temperature|llm_context_window)" openhands/settings.json | sed 's/^[[:space:]]*/  /'
    fi
    
    echo ""
    check_resources
}

# Função para atualizar configurações
update_config() {
    local model=$1
    local temperature=${2:-""}
    local compose_file=${3:-"docker-compose.yml"}
    
    print_status "Atualizando configuração para: $model"
    
    # Atualiza docker-compose.yml
    if check_file "$compose_file"; then
        # Cria backup temporário
        cp "$compose_file" "$compose_file.tmp"
        
        # Atualiza modelo OpenHands
        sed -i.tmp "s/OPENHANDS_LLM_MODEL: .*/OPENHANDS_LLM_MODEL: $model/" "$compose_file"
        
        # Atualiza modelo Ollama
        sed -i.tmp "s/OLLAMA_MODEL=.*/OLLAMA_MODEL=$MODEL_NAME/" "$compose_file"
        
        # Atualiza comando pull
        sed -i.tmp "s/ollama pull .*/ollama pull $MODEL_NAME \&\&/" "$compose_file"
        
        # Remove arquivo temporário
        rm "$compose_file.tmp"
        
        print_success "Atualizado: $compose_file"
    fi
    
    # Atualiza settings.json
    if check_file "openhands/settings.json"; then
        cp "openhands/settings.json" "openhands/settings.json.tmp"
        
        # Atualiza modelo
        sed -i.tmp "s|\"llm_model\": \".*\"|\"llm_model\": \"ollama\/$model\"|" "openhands/settings.json"
        
        # Atualiza temperatura se fornecida
        if [ -n "$temperature" ]; then
            sed -i.tmp "s/\"llm_temperature\": .*/\"llm_temperature\": $temperature/" "openhands/settings.json"
        fi
        
        rm "openhands/settings.json.tmp"
        print_success "Atualizado: openhands/settings.json"
    fi
    
    # Atualiza low-resource se existir
    if [ -f "docker-compose.low-resource.yml" ]; then
        cp "docker-compose.low-resource.yml" "docker-compose.low-resource.yml.tmp"
        
        sed -i.tmp "s/OPENHANDS_LLM_MODEL: .*/OPENHANDS_LLM_MODEL: $model/" "docker-compose.low-resource.yml"
        sed -i.tmp "s/OLLAMA_MODEL=.*/OLLAMA_MODEL=$MODEL_NAME/" "docker-compose.low-resource.yml"
        sed -i.tmp "s/ollama pull .*/ollama pull $MODEL_NAME \&\&/" "docker-compose.low-resource.yml"
        
        rm "docker-compose.low-resource.yml.tmp"
        print_success "Atualizado: docker-compose.low-resource.yml"
    fi
}

# Função para restaurar backup
restore_backup() {
    local backup_dir="backups"
    
    if [ ! -d "$backup_dir" ]; then
        print_error "Diretório de backups não encontrado: $backup_dir"
        return 1
    fi
    
    print_header "Restaurando Backup"
    
    # Lista backups disponíveis
    echo "Backups disponíveis:"
    ls -la "$backup_dir"/*.yml "$backup_dir"/*.json 2>/dev/null | awk '{print $9}' | sed 's|.*/||' | nl
    
    echo ""
    read -p "Digite o número do backup para restaurar: " backup_num
    
    # Implementar restauração baseada no número
    print_warning "Função de restauração em desenvolvimento"
}

# Função principal de configuração
configure_model() {
    local model=$1
    local temperature=$2
    local compose_file=$3
    
    # Validação
    if ! validate_model "$model"; then
        return 1
    fi
    
    # Backup automático
    backup_config
    
    # Atualiza configurações
    update_config "$model" "$temperature" "$compose_file"
    
    print_success "Configuração atualizada com sucesso!"
    echo ""
    print_header "Resumo das Alterações"
    echo "Modelo: $model"
    [ -n "$temperature" ] && echo "Temperatura: $temperature"
    echo ""
    print_status "Para aplicar as alterações:"
    echo "  docker-compose down"
    echo "  docker-compose up --build -d"
    echo ""
    print_status "Ou use o script melhorado:"
    echo "  ./start-improved.sh"
}

# Parse de argumentos
MODEL_NAME=""
TEMPERATURE=""
COMPOSE_FILE="docker-compose.yml"
SHOW_HELP=false
LIST_MODELS=false
CHECK_CONFIG=false
BACKUP=false
RESTORE=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            SHOW_HELP=true
            shift
            ;;
        -l|--list)
            LIST_MODELS=true
            shift
            ;;
        -c|--check)
            CHECK_CONFIG=true
            shift
            ;;
        -b|--backup)
            BACKUP=true
            shift
            ;;
        -r|--restore)
            RESTORE=true
            shift
            ;;
        -t|--temperature)
            TEMPERATURE="$2"
            shift 2
            ;;
        -f|--file)
            COMPOSE_FILE="$2"
            shift 2
            ;;
        -*)
            print_error "Opção desconhecida: $1"
            show_help
            exit 1
            ;;
        *)
            MODEL_NAME="$1"
            shift
            ;;
    esac
done

# Executa ações baseadas nos argumentos
if [ "$SHOW_HELP" = true ]; then
    show_help
    exit 0
fi

if [ "$LIST_MODELS" = true ]; then
    list_models
    exit 0
fi

if [ "$CHECK_CONFIG" = true ]; then
    check_config
    exit 0
fi

if [ "$BACKUP" = true ]; then
    backup_config
    exit 0
fi

if [ "$RESTORE" = true ]; then
    restore_backup
    exit 0
fi

# Verifica se modelo foi fornecido
if [ -z "$MODEL_NAME" ]; then
    print_error "Nome do modelo não fornecido"
    echo ""
    show_help
    exit 1
fi

# Valida temperatura se fornecida
if [ -n "$TEMPERATURE" ]; then
    if ! [[ "$TEMPERATURE" =~ ^[0-9]+(\.[0-9]+)?$ ]] || [ "$(echo "$TEMPERATURE < 0 || $TEMPERATURE > 2" | bc -l 2>/dev/null || echo 1)" -eq 1 ]; then
        print_error "Temperatura inválida: $TEMPERATURE (use 0.0 a 2.0)"
        exit 1
    fi
fi

# Executa configuração principal
configure_model "$MODEL_NAME" "$TEMPERATURE" "$COMPOSE_FILE"
