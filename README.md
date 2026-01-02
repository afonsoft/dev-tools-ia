# Dev Tools IA

Ambiente de desenvolvimento integrado para processamento de linguagem natural e codificação assistida por IA, combinando OpenHands, Ollama e uma interface web amigável.

## 📋 Descrição do Projeto

Este projeto fornece um ambiente de desenvolvimento containerizado focado em IA, integrando ferramentas avançadas para desenvolvimento assistido por inteligência artificial. O ambiente oferece uma plataforma completa para desenvolvimento em .NET e Node.js, com suporte a processamento de linguagem natural e codificação assistida.

### 🎯 Visão de Negócio
- Aumento de produtividade através de assistência IA no desenvolvimento
- Ambiente padronizado e reproduzível para toda a equipe
- Integração contínua com ferramentas modernas de desenvolvimento
- Suporte a múltiplos frameworks e tecnologias

### 🔧 Visão Técnica
- Arquitetura baseada em containers com Docker
- Aceleração por GPU para processamento de IA
- Modelo de linguagem local para maior segurança e privacidade
- Integração com ferramentas de desenvolvimento populares

## 📁 Estrutura do Repositório

```
.
├── openhands/           # Configurações do OpenHands AI
│   └── settings.json    # Configurações específicas da IA
├── runtime/             # Ambiente de execução
│   └── Dockerfile      # Configuração do container de runtime
├── vscode/             # Configurações do VS Code
│   ├── extensions.json # Extensões recomendadas
│   └── install-extensions.sh # Script de instalação de extensões
├── docker-compose.yml  # Configuração dos serviços
├── configure.sh        # Script de configuração do ambiente
├── start.sh           # Script de inicialização
└── LICENSE            # Licença do projeto
```

## 🛠️ Stack Tecnológica

### Runtime e Infraestrutura
- **Base**: Docker com suporte NVIDIA GPU
- **Container Runtime**: Docker Compose
- **GPU Support**: NVIDIA Container Toolkit

### Frameworks e SDKs
- **.NET**
  - SDK 8.0 (LTS)
  - SDK 9.0 (Preview)
- **Node.js**
  - Gerenciamento via NVM
  - Última versão LTS

### Componentes Principais
- **[OpenHands](https://github.com/all-hands-dev/openhands)**
  - Versão: 0.58 (última estável)
  - Ambiente de desenvolvimento IA aprimorado
  - Integração com VS Code
  - Suporte a múltiplos modelos
  - Otimização de memória melhorada
  - Interface local: http://localhost:3000
- **[Ollama](https://github.com/ollama/ollama)**
  - API de modelo de linguagem
  - Modelo padrão: Devstral 24B
  - Especializado em desenvolvimento e agentes de código
  - Otimizado para alta performance
  - Suporte a múltiplos modelos via API
  - API local: http://localhost:11434
- **[Open WebUI](https://github.com/open-webui/open-webui)**
  - Interface gráfica amigável
  - Autenticação integrada
  - Customização de parâmetros
  - Interface local: http://localhost:8080

## 🧩 Dockerfile — `runtime`

Resumo técnico do arquivo `runtime/Dockerfile` (fonte: `runtime/Dockerfile`):

- **Imagem base**: `docker.openhands.dev/openhands/runtime:0.62-nikolaik` — imagem preparada com runtime e ferramentas de base.
- **Locale**: `LANG=C.UTF-8`, `LC_ALL=C.UTF-8` para evitar warnings relacionados a locale.
- **Dependências instaladas (apt)**: `ca-certificates`, `curl`, `ffmpeg`, `git`, `libbz2-dev`, `libffi-dev`, `libfontconfig1`, `libfreetype6`, `liblzma-dev`, `libncursesw5-dev`, `libreadline-dev`, `libsqlite3-dev`, `libssl-dev`, `libxml2-dev`, `libxmlsec1-dev`, `python3-pip`, `python3-setuptools`, `python3-venv`, `zlib1g-dev`.
- **Node.js / NVM**: instala `nvm` (v0.40.3), instala a versão LTS do Node.js via `nvm install --lts` e configura `nvm alias default`.
- **.NET SDKs**: usa `dotnet-install.sh` para instalar os canais `8` e `10` em `/usr/share/dotnet` e cria symlink para `/usr/bin/dotnet`.
- **Python venv e pacotes OpenHands**: cria venv em `/opt/venv`, atualiza `pip/setuptools` e instala `openhands-agent-server`, `openhands-sdk`, `openhands-tools`, `openhands-workspace`.
- **Astral UV e ferramentas**: instala o instalador `astral.sh/uv` e registra `openhands` como ferramenta (`uv tool install openhands`).
- **Configurações de PATH e variáveis**:
  - `NVM_DIR=/root/.nvm`
  - `PATH` atualizado para incluir Node, .NET tools e `/opt/venv/bin` e `/root/.local/bin`
  - `DOTNET_ROOT=/usr/share/dotnet`
  - `DOTNET_CLI_TELEMETRY_OPTOUT=true`
  - `NODE_TLS_REJECT_UNAUTHORIZED=0`
- **Ajustes de Git/NPM**: desabilita verificação SSL global do Git (`git config --global http.sslVerify false`) e `npm config set strict-ssl false` (útil em ambientes controlados, NÃO recomendado para ambientes públicos sem proxy seguro).
- **Diretório de trabalho**: `WORKDIR /app`.
- **Boas práticas aplicadas no Dockerfile**:
  - Agrupamento de comandos `apt-get` e limpeza (`apt-get clean`, `rm -rf /var/lib/apt/lists/*`) para reduzir tamanho da imagem.
  - Uso de virtualenv para isolar pacotes Python e evitar PEP 668 problems.
  - Notas no Dockerfile recomendam avaliar instalação direta do Node.js para produção em vez de `nvm`.

Recomendações rápidas
- Revise `npm` e `git` configs para ambientes públicos (não desabilitar SSL em produção).
- Se for publicar imagem para produção, prefira instalar Node.js direto em vez de `nvm` (evita complexidade em imagens não-interativas).
- Considere expor variáveis sensíveis externamente via `docker-compose` ou secrets em vez de hardcode no Dockerfile.


## 🚀 Como Rodar a Aplicação

1. **Pré-requisitos**
   - Docker com suporte a NVIDIA GPU
   - NVIDIA Container Toolkit instalado
   - Mínimo de 16GB RAM (32GB recomendado)
   - GPU com 8GB+ VRAM

2. **Instalação**
   ```bash
   # Clone o repositório
   git clone https://github.com/afonsoft/dev-tools-ia.git
   cd dev-tools-ia

   # Configure o ambiente
   ./configure.sh

   # Inicie os serviços
   ./start.sh
   ```

3. **Acesso às Interfaces**
   - OpenHands UI: http://localhost:3000
   - Web UI: http://localhost:8080
   - Ollama API: http://localhost:11434

## ⚙️ Variáveis de Ambiente

| Variável | Descrição | Valor Padrão |
|----------|-----------|--------------|
| OPENHANDS_LLM_PROVIDER | Provedor do modelo LLM | ollama |
| OPENHANDS_LLM_MODEL | Modelo LLM a ser usado | devstral:24b |
| OPENHANDS_LLM_TEMPERATURE | Temperatura de geração | 0.1 |
| OPENHANDS_LLM_CTX_SIZE | Tamanho do contexto | 32768 |
| CUDA_VISIBLE_DEVICES | GPU a ser utilizada | 0 |
| OPENHANDS_MAX_PARALLEL_REQUESTS | Requisições paralelas | 1 |

## 📈 Status do Projeto

Status: **Concluído**

Para mais detalhes sobre as últimas alterações, consulte o [CHANGELOG.md](CHANGELOG.md).

## 📄 Licença

Este projeto está sob a licença [GNU GPL v3.0](LICENSE).

---
*Última atualização: 2025-11-11*

Atualizações: README e CHANGELOG revisados; alterações preparadas na branch `feature/update`.

1. **Devstral (24B)** - Modelo Padrão
   - Especializado em tarefas de desenvolvimento e agentes de código
   - Performance superior em tarefas complexas
   - Requisitos: 32GB+ RAM, 12GB+ VRAM
   - Uso: Desenvolvimento profissional e projetos complexos

2. **CodeLlama (7B/13B/34B)**
   - Focado em geração e análise de código
   - Suporte a múltiplas linguagens de programação
   - Requisitos: 16GB+ RAM, 8GB+ VRAM (versão 7B)
   - Uso: Desenvolvimento geral e análise de código

3. **Qwen2.5-Coder (7B/14B/32B)**
   - Especializado em código com contexto longo
   - Suporte a até 128K tokens
   - Requisitos: 16GB+ RAM, 8GB+ VRAM (versão 7B)
   - Uso: Projetos com bases de código grandes

#### Modelos para Hardware Limitado

1. **Phi (2.7B/3.8B)**
   - Modelo leve com boa performance
   - Excelente relação tamanho/performance
   - Requisitos: 8GB+ RAM, 4GB+ VRAM
   - Uso: Desenvolvimento em hardware modesto

2. **TinyLlama (1.1B)**
   - Modelo ultra-leve
   - Bom para tarefas básicas
   - Requisitos: 6GB+ RAM, 4GB+ VRAM
   - Uso: Ambientes com recursos muito limitados

#### Modelos para Agentes de Código

1. **GPT-OSS (20B/120B)**
   - Especializado em tarefas de agente e raciocínio
   - Excelente para casos de uso de desenvolvimento
   - Requisitos: 32GB+ RAM, 16GB+ VRAM (versão 20B)
   - Uso: Desenvolvimento complexo e automação

2. **DeepSeek-R1 (7B/32B/70B)**
   - Performance próxima a modelos líderes
   - Excelente capacidade de raciocínio
   - Requisitos: 16GB+ RAM, 8GB+ VRAM (versão 7B)
   - Uso: Tarefas de agente e desenvolvimento

3. **Qwen3 (8B/14B/30B)**
   - Suite completa para desenvolvimento
   - Suporte a MoE (Mixture of Experts)
   - Requisitos: 16GB+ RAM, 8GB+ VRAM (versão 8B)
   - Uso: Geração de código e automação

4. **LLama3.1 Groq Tool-Use (8B/70B)**
   - Otimizado para uso de ferramentas
   - Excelente para function calling
   - Requisitos: 16GB+ RAM, 8GB+ VRAM (versão 8B)
   - Uso: Integração com ferramentas e APIs

5. **Mistral-Small3.2 (24B)**
   - Function calling aprimorado
   - Melhor seguimento de instruções
   - Requisitos: 24GB+ RAM, 12GB+ VRAM
   - Uso: Agentes de código precisos

#### Modelos Especializados em Desenvolvimento

1. **Mistral-Large (123B)**
   - Líder em geração de código
   - Contexto de 128k tokens
   - Suporte multilíngue avançado
   - Requisitos: 48GB+ RAM, 24GB+ VRAM
   - Uso: Projetos grandes e complexos

2. **CodeLlama (7B/13B)**
   - Otimizado para desenvolvimento e análise de código
   - Excelente suporte multilinguagem
   - Requisitos: 8GB+ RAM, 6GB+ VRAM (versão 7B)
   - Uso: Projetos pequenos e médios
   - Disponível em variantes: base, instruct, python

3. **Devstral (24B)**
   - Especializado em agentes de código
   - Ótimo para automação de desenvolvimento
   - Requisitos: 32GB+ RAM, 16GB+ VRAM
   - Uso: Automação de desenvolvimento

> **Nota sobre Seleção de Modelos**: Para tarefas que envolvem agentes de código e automação de desenvolvimento, recomendamos começar com modelos menores como Granite3-Dense (2B) ou LLama3.1 (8B) e escalar conforme necessário. Modelos maiores como GPT-OSS (120B) e Mistral-Large (123B) oferecem melhor performance mas requerem significativamente mais recursos. Considere o trade-off entre performance e recursos disponíveis ao escolher o modelo.

#### Configurações de Otimização

##### Configurações do Ollama
- `OLLAMA_CONTEXT_LENGTH`: 32768 (recomendado para boa performance)
- `OLLAMA_GPU_LAYERS`: Ajuste baseado na VRAM disponível
  - 35 layers para GPUs com 8GB VRAM
  - 45 layers para GPUs com 12GB+ VRAM
- `OLLAMA_MAX_LOADED_MODELS`: 1 (otimizar uso de VRAM)
- `OLLAMA_GPU_OVERHEAD`: Buffer de GPU
  - 1GB para GPUs com 8GB VRAM
  - 2GB para GPUs com 12GB+ VRAM
- `OLLAMA_NUM_PARALLEL`: 2 (balanceado para maioria dos sistemas)
- `OLLAMA_FLASH_ATTENTION`: 1 (acelera processamento)
- `OLLAMA_F16`: 1 (economia de VRAM com FP16)
- `OLLAMA_BATCH_SIZE`: 8 (otimizado para performance)
- `OLLAMA_PRELOAD`: 1 (carregamento mais rápido)

##### Configurações do OpenHands
- `OPENHANDS_LLM_CTX_SIZE`: 32768 (match com Ollama)
- `OPENHANDS_LLM_GPU_LAYERS`: Mesmo valor do Ollama
- `OPENHANDS_MAX_PARALLEL_REQUESTS`: 2 (balanceado)
- `OPENHANDS_MEMORY_BUDGET`: Ajuste baseado na RAM
  - 8GB para sistemas com 12GB RAM
  - 12GB para sistemas com 16GB+ RAM

##### Configurações Recomendadas por Hardware

1. **Sistema Básico (8GB RAM, GPU 6GB VRAM)**
   ```yaml
   OLLAMA_GPU_LAYERS: 25
   OLLAMA_GPU_OVERHEAD: 536870912  # 512MB
   OLLAMA_NUM_PARALLEL: 1
   OPENHANDS_MEMORY_BUDGET: 6442450944  # 6GB
   ```

2. **Sistema Intermediário (12GB RAM, GPU 8GB VRAM)**
   ```yaml
   OLLAMA_GPU_LAYERS: 35
   OLLAMA_GPU_OVERHEAD: 1073741824  # 1GB
   OLLAMA_NUM_PARALLEL: 2
   OPENHANDS_MEMORY_BUDGET: 8589934592  # 8GB
   ```

3. **Sistema Avançado (16GB+ RAM, GPU 12GB+ VRAM)**
   ```yaml
   OLLAMA_GPU_LAYERS: 45
   OLLAMA_GPU_OVERHEAD: 2147483648  # 2GB
   OLLAMA_NUM_PARALLEL: 3
   OPENHANDS_MEMORY_BUDGET: 12884901888  # 12GB
   ```

> **Nota**: Estas configurações são pontos de partida recomendados. Ajuste com base no comportamento do sistema e nas necessidades específicas do seu projeto.

##### Configurações Otimizadas para GPUs RTX Série 30/40

###### RTX 3050 (8GB VRAM)
```yaml
# Configurações Ollama
OLLAMA_GPU_LAYERS: 38              # Otimizado para arquitetura Ampere
OLLAMA_GPU_OVERHEAD: 1073741824    # 1GB overhead
OLLAMA_NUM_PARALLEL: 2
OLLAMA_BATCH_SIZE: 12              # Maior batch size devido ao melhor scheduler
OLLAMA_F16: 1                      # Habilita FP16 para economia de VRAM
OLLAMA_FLASH_ATTENTION: 1
OLLAMA_CONCURRENT_SLOTS: 2         # Slots de execução paralela

# Configurações OpenHands
OPENHANDS_LLM_GPU_LAYERS: 38
OPENHANDS_MEMORY_BUDGET: 10737418240  # 10GB para sistemas com 16GB+ RAM
OPENHANDS_MAX_PARALLEL_REQUESTS: 2
```

###### RTX 4050 (6GB/8GB VRAM)
```yaml
# Configurações Ollama
OLLAMA_GPU_LAYERS: 42              # Otimizado para arquitetura Ada Lovelace
OLLAMA_GPU_OVERHEAD: 1073741824    # 1GB overhead
OLLAMA_NUM_PARALLEL: 2
OLLAMA_BATCH_SIZE: 16              # Maior devido ao melhor tensor core
OLLAMA_F16: 1                      # Habilita FP16
OLLAMA_FLASH_ATTENTION: 1
OLLAMA_CONCURRENT_SLOTS: 3         # Mais slots devido à melhor eficiência
OLLAMA_TENSOR_SPLIT: 1             # Habilita tensor splitting

# Configurações OpenHands
OPENHANDS_LLM_GPU_LAYERS: 42
OPENHANDS_MEMORY_BUDGET: 12884901888  # 12GB para sistemas com 16GB+ RAM
OPENHANDS_MAX_PARALLEL_REQUESTS: 3
```

> **Benefícios Específicos por GPU**:
> 
> **RTX 3050**:
> - Melhor suporte a FP16 com Ampere
> - Bom desempenho em batch processing
> - Permite até 38 camadas na GPU com segurança
> 
> **RTX 4050**:
> - Arquitetura Ada mais eficiente
> - Melhor performance em FP16
> - Suporte a tensor splitting
> - Permite até 42 camadas na GPU
> 
> **Dicas de Otimização**:
> 1. Monitore a temperatura da GPU (ideal < 80°C)
> 2. Use `nvidia-smi` para monitorar uso de VRAM
> 3. Ajuste `OLLAMA_GPU_LAYERS` se observar OOM (Out of Memory)
> 4. Reduza `BATCH_SIZE` se encontrar instabilidades
> 
> **Modelos Recomendados**:
> - CodeLlama 7B (estável e eficiente)
> - Mistral 7B (boa performance)
> - Llama2 7B (base confiável)

##### Configurações Otimizadas por Quantidade de RAM

###### Sistema com 16GB RAM
```yaml
# Configurações de Memória Gerais
OPENHANDS_MEMORY_BUDGET: 10737418240       # 10GB para OpenHands
deploy:
  resources:
    limits:
      memory: 8g                           # Limite OpenHands
    reservations:
      memory: 6g                           # Reserva mínima

# Configurações Ollama
OLLAMA_MAX_LOADED_MODELS: 1
OLLAMA_GPU_OVERHEAD: 1073741824            # 1GB para GPU overhead
OLLAMA_BATCH_SIZE: 8
OLLAMA_NUM_PARALLEL: 2

# Modelos Recomendados:
# - CodeLlama 7B (padrão)
# - Mistral 7B
# - Llama2 7B
```

###### Sistema com 20GB RAM
```yaml
# Configurações de Memória Gerais
OPENHANDS_MEMORY_BUDGET: 14737418240       # 14GB para OpenHands
deploy:
  resources:
    limits:
      memory: 12g                          # Limite OpenHands
    reservations:
      memory: 8g                           # Reserva mínima

# Configurações Ollama
OLLAMA_MAX_LOADED_MODELS: 1
OLLAMA_GPU_OVERHEAD: 1610612736            # 1.5GB para GPU overhead
OLLAMA_BATCH_SIZE: 12
OLLAMA_NUM_PARALLEL: 2

# Modelos Recomendados:
# - Mistral 8B
# - DeepSeek-Coder 6.7B
# - Qwen 7B
```

###### Sistema com 32GB RAM
```yaml
# Configurações de Memória Gerais
OPENHANDS_MEMORY_BUDGET: 21474836480       # 20GB para OpenHands
deploy:
  resources:
    limits:
      memory: 16g                          # Limite OpenHands
    reservations:
      memory: 12g                          # Reserva mínima

# Configurações Ollama
OLLAMA_MAX_LOADED_MODELS: 2                # Permite carregar 2 modelos
OLLAMA_GPU_OVERHEAD: 2147483648            # 2GB para GPU overhead
OLLAMA_BATCH_SIZE: 16
OLLAMA_NUM_PARALLEL: 3
OLLAMA_CONCURRENT_SLOTS: 4

# Modelos Recomendados:
# - Devstral 24B
# - CodeLlama 13B
# - DeepSeek-Coder 16B
```

###### Sistema com 64GB RAM
```yaml
# Configurações de Memória Gerais
OPENHANDS_MEMORY_BUDGET: 42949672960       # 40GB para OpenHands
deploy:
  resources:
    limits:
      memory: 32g                          # Limite OpenHands
    reservations:
      memory: 24g                          # Reserva mínima

# Configurações Ollama
OLLAMA_MAX_LOADED_MODELS: 3                # Permite carregar 3 modelos
OLLAMA_GPU_OVERHEAD: 4294967296            # 4GB para GPU overhead
OLLAMA_BATCH_SIZE: 24
OLLAMA_NUM_PARALLEL: 4
OLLAMA_CONCURRENT_SLOTS: 6
OLLAMA_PRELOAD: 1
OLLAMA_NUMA: 1                            # Habilita otimizações NUMA

# Modelos Recomendados:
# - Mistral-Large 32B
# - CodeLlama 34B
# - Qwen 72B
```

> **Notas de Otimização por RAM**:
>
> **16GB RAM**:
> - Foco em modelos até 8B
> - Gerenciamento conservador de memória
> - Priorize um único modelo carregado
>
> **20GB RAM**:
> - Suporte a modelos até 13B
> - Melhor capacidade de processamento paralelo
> - Boa para desenvolvimento médio
>
> **32GB RAM**:
> - Ideal para modelos até 24B
> - Suporte a múltiplos modelos
> - Excelente para desenvolvimento profissional
>
> **64GB RAM**:
> - Suporte a modelos grandes (30B+)
> - Múltiplos modelos em paralelo
> - Otimizações NUMA habilitadas
> - Ideal para ambientes de produção
>
> **Dicas Gerais**:
> 1. Reserve 20-30% da RAM total para o sistema operacional
> 2. Use `OLLAMA_PRELOAD` em sistemas com RAM abundante
> 3. Ajuste `NUMA` apenas em servidores multi-socket
> 4. Monitore swap com `free -h` (Linux) ou Gerenciador de Tarefas (Windows)
> 5. Em caso de OOM, reduza `OPENHANDS_MEMORY_BUDGET` em 25%
> 6. Com OpenHands 0.56+, use configurações de paralelismo conservadoras
> 7. Para Devstral 24B, recomenda-se mínimo de 32GB RAM
>
> **Importante: Gerenciamento de Paralelismo**
> - `OLLAMA_NUM_PARALLEL` e `OPENHANDS_MAX_PARALLEL_REQUESTS` afetam diretamente o consumo de memória
> - Cada requisição paralela adicional aumenta significativamente o uso de RAM
> - Recomendações por configuração de memória:
>   - 8-12GB RAM: mantenha ambos em 1
>   - 16GB RAM: máximo de 2 paralelos
>   - 32GB+ RAM: pode usar 3-4 paralelos
> - Se encontrar erros de memória, reduza estes valores para 1 primeiro
> - Aumente apenas se tiver certeza que há memória disponível

#### Alternativa Recomendada: CodeLlama 7B
O [CodeLlama](https://ai.meta.com/blog/code-llama-large-language-model-coding/) é uma excelente alternativa para sistemas com recursos mais limitados:

- **Capacidades**:
  - Compreensão e geração de código em múltiplas linguagens
  - Completação de código inteligente
  - Explicação de código existente
  - Refatoração e documentação

- **Vantagens**:
  - Menor consumo de memória
  - Bom desempenho em GPUs mais modestas
  - Equilíbrio entre performance e recursos

- **Requisitos Mínimos**:
  - RAM: 16GB
  - GPU: 8GB VRAM (ou CPU razoável)
  - SSD: 20GB livre

## Pré-requisitos

### Hardware
- CPU: 4+ cores recomendados
- RAM: 16GB+ recomendados
- GPU: NVIDIA com suporte a CUDA (opcional, mas recomendado)
- Armazenamento: 20GB+ livres

### Software
- Docker Engine 24.0+
- Docker Compose v2.20+
- NVIDIA Driver 525+ (para GPU)
- NVIDIA Container Toolkit
- Git 2.40+

## Guia de Instalação

1. Clone o repositório:
   ```bash
   git config --global http.sslVerify false  # Se necessário
   git clone [URL_DO_REPOSITORIO]
   ```

2. Configure o ambiente:
   ```bash
   # Para Windows
   git config --global core.longpaths true
   
   # Para NPM (se necessário)
   npm config set strict-ssl false
   ```

3. Execute o script de inicialização:
   - Linux/macOS/Windows: `./start.sh`

O ambiente será iniciado automaticamente e abrirá:
- OpenHands UI: http://localhost:3000
- Web Chat UI: http://localhost:8080

## Estrutura do Repositório

```
.
├── openhands/                # Configurações do OpenHands
│   └── settings.json        # Configurações do agente e LLM
├── runtime/                 # Ambiente de execução
│   └── Dockerfile          # Configuração do container base
├── vscode/                 # Configurações do VS Code
│   ├── extensions.json     # Extensões recomendadas
│   └── install-extensions.sh # Instalador de extensões
├── docker-compose.yml      # Definição dos serviços
├── start.bat              # Inicialização (Windows)
├── start.sh              # Inicialização (Unix)
├── .gitignore            # Exclusões do Git
├── LICENSE              # GNU GPL v3.0
├── CHANGELOG.md         # Registro de alterações
└── README.md           # Esta documentação
```

## Configuração e Variáveis de Ambiente

### Configuração do Modelo LLM

O ambiente suporta diferentes modelos LLM que podem ser configurados de acordo com os recursos disponíveis em sua máquina. Para alterar o modelo, edite as configurações no arquivo `openhands/settings.json` e `docker-compose.yml`.

#### Cenários de Uso

1. **Configuração Padrão (Hardware Robusto)**
```json
// openhands/settings.json
{
    "llm_model": "ollama/devstral:latest",
    "llm_base_url": "http://ollama:11434"
}
```
```yaml
# docker-compose.yml (seção ollama)
environment:
  - OLLAMA_MODEL=devstral:latest
  - OLLAMA_CONTEXT_LENGTH=32768
  - OLLAMA_GPU_LAYERS=80
  - OLLAMA_MAX_LOADED_MODELS=1
  - OLLAMA_FLASH_ATTENTION=1
  - OLLAMA_GPU_OVERHEAD=2147483648  # 2GB para buffer de GPU
```

2. **Configuração Recomendada (Hardware Moderado)**
```json
// openhands/settings.json
{
    "llm_model": "ollama/codellama:7b",
    "llm_base_url": "http://ollama:11434"
}
```
```yaml
# docker-compose.yml (seção ollama)
environment:
  - OLLAMA_MODEL=codellama:7b
  - OLLAMA_CONTEXT_LENGTH=16384
  - OLLAMA_GPU_LAYERS=45
  - OLLAMA_MAX_LOADED_MODELS=1
  - OLLAMA_FLASH_ATTENTION=1
  - OLLAMA_GPU_OVERHEAD=1073741824  # 1GB para buffer de GPU
```

O CodeLlama 7B é recomendado para a maioria dos usuários por:
- Menor consumo de recursos
- Boa performance em hardware mais modesto
- Excelente suporte a múltiplas linguagens

2. **Recursos Limitados (8-16GB RAM, GPU < 8GB)**
```json
// openhands/settings.json
{
    "llm_model": "ollama/phi:latest",  // ou "ollama/neural-chat:latest"
    "llm_base_url": "http://ollama:11434"
}
```
```yaml
# docker-compose.yml (seção ollama)
environment:
  - OLLAMA_MODEL=phi:latest
  - OLLAMA_CONTEXT_LENGTH=8192
  - OLLAMA_GPU_LAYERS=35  # Ajuste conforme necessário
  - OLLAMA_MAX_LOADED_MODELS=1
```

3. **Recursos Moderados (16-32GB RAM, GPU 8-12GB)**
```json
// openhands/settings.json
{
    "llm_model": "ollama/mistral:latest",  // ou "ollama/codellama:7b"
    "llm_base_url": "http://ollama:11434"
}
```
```yaml
# docker-compose.yml (seção ollama)
environment:
  - OLLAMA_MODEL=mistral:latest
  - OLLAMA_CONTEXT_LENGTH=16384
  - OLLAMA_GPU_LAYERS=45
  - OLLAMA_MAX_LOADED_MODELS=1
```

4. **Recursos Abundantes (32GB+ RAM, GPU 16GB+)**
```json
// openhands/settings.json
{
    "llm_model": "ollama/qwen2.5-coder:7b",  // ou "ollama/codellama:13b"
    "llm_base_url": "http://ollama:11434"
}
```
```yaml
# docker-compose.yml (seção ollama)
environment:
  - OLLAMA_MODEL=qwen2.5-coder:7b
  - OLLAMA_CONTEXT_LENGTH=32768
  - OLLAMA_GPU_LAYERS=80
  - OLLAMA_MAX_LOADED_MODELS=1
```

#### Parâmetros de Otimização
- `OLLAMA_CONTEXT_LENGTH`: Tamanho do contexto (menor = menos memória)
- `OLLAMA_GPU_LAYERS`: Número de camadas na GPU (mais = melhor performance, mais VRAM)
- `OLLAMA_MAX_LOADED_MODELS`: Limite de modelos carregados simultaneamente
- `OLLAMA_GPU_OVERHEAD`: Buffer de memória GPU (default: 2GB)

#### Alterando o Modelo via Script

O projeto inclui um script `configure.sh` que facilita a troca do modelo LLM. Para utilizá-lo:

```bash
# Dar permissão de execução (necessário apenas uma vez)
chmod +x configure.sh

# Alterar para um modelo leve (8-16GB RAM)
./configure.sh phi:latest

# Alterar para um modelo intermediário (16-32GB RAM)
./configure.sh codellama:7b

# Alterar para um modelo mais robusto (32GB+ RAM)
./configure.sh qwen2.5-coder:7b

# Após alterar o modelo, reinicie os containers
docker-compose down && docker-compose up -d
```

O script automaticamente:
1. Atualiza o modelo no `docker-compose.yml`
2. Configura o `settings.json` do OpenHands
3. Ajusta o comando de pull do Ollama
4. Fornece instruções para reiniciar os containers

> **Dica**: Para ver os modelos disponíveis, visite o [Ollama Model Library](https://ollama.ai/library)

### OpenHands
```env
LOG_ALL_EVENTS=true
LLM_MAX_INPUT_TOKENS=16384
LLM_MAX_OUTPUT_TOKENS=16384
OPENHANDS_LLM_PROVIDER=ollama
OPENHANDS_LLM_MODEL=qwen2.5-coder:7b
```

### Ollama
```env
OLLAMA_CONTEXT_LENGTH=32768
OLLAMA_HOST=0.0.0.0:11434
OLLAMA_MODEL=qwen2.5-coder:7b
OLLAMA_NUM_PARALLEL=1
OLLAMA_KEEP_ALIVE=-1
OLLAMA_FLASH_ATTENTION=1
```

### Web UI
```env
OPENWEBUI_USERNAME=admin@admin.com
OPENWEBUI_PASSWORD=admin
```

## Extensões VS Code

### Desenvolvimento .NET
- [C# Dev Kit](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit)
- [C# Extensions Pack](https://marketplace.visualstudio.com/items?itemName=boundarystudio.csharp-extentions-pack)

### Git e Controle de Versão
- [Git Extension Pack](https://marketplace.visualstudio.com/items?itemName=donjayamanne.git-extension-pack)
- [GitHub Actions](https://marketplace.visualstudio.com/items?itemName=github.vscode-github-actions)
- [GitHub Pull Requests](https://marketplace.visualstudio.com/items?itemName=github.vscode-pull-request-github)

### IA e Desenvolvimento
- [GitHub Copilot](https://marketplace.visualstudio.com/items?itemName=github.copilot)
- [Ollama VSCode](https://marketplace.visualstudio.com/items?itemName=genepiot.ollama-vscode)

### Formatação e Qualidade
- [EditorConfig](https://marketplace.visualstudio.com/items?itemName=editorconfig.editorconfig)
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)

### Frameworks e UI
- [Angular Extension Pack](https://marketplace.visualstudio.com/items?itemName=johnpapa.angular2)
- [Tailwind CSS IntelliSense](https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss)

## Recursos do Sistema

### Limites por Container
- **OpenHands**
  - Memória: 2-4GB
  - CPU: 1-2 cores
- **Ollama**
  - GPU: Acesso total
  - VRAM: 2GB overhead
- **Web UI**
  - Memória: 512MB-2GB
  - CPU: 0.5-1 core

## Status do Projeto

- **Estado**: Concluído
- **Versão**: 1.3.0
- **Última Atualização**: 11 de Novembro de 2025

## Problemas Conhecidos e Soluções

### Erro de Memória Insuficiente no Ollama

Se você encontrar o seguinte erro nos logs do container Ollama:
```
error="model requires more system memory (33.0 GiB) than is available (10.3 GiB)"
```

Este erro ocorre quando o modelo LLM selecionado requer mais memória do que está disponível no seu sistema. Para resolver:

1. **Solução Imediata**: Mude para um modelo que requer menos memória
   ```bash
   # Pare os containers
   docker compose down

   # Edite openhands/settings.json
   # Altere o modelo para uma opção mais leve:
   {
     "llm_model": "ollama/phi:latest",  # Modelo leve (~4GB RAM)
     # ou
     "llm_model": "ollama/mistral:latest"  # Modelo moderado (~8GB RAM)
   }

   # Edite docker-compose.yml
   # Na seção 'ollama', atualize:
   environment:
     - OLLAMA_MODEL=phi:latest  # ou mistral:latest
     - OLLAMA_CONTEXT_LENGTH=8192  # Reduzir contexto também ajuda
   
   # Reinicie os containers
   docker compose up -d
   ```

2. **Modelos Recomendados por Faixa de Memória**:
   - 8GB RAM: `phi:latest`, `neural-chat:latest`
   - 16GB RAM: `mistral:latest`, `codellama:7b`
   - 32GB+ RAM: `qwen2.5-coder:7b`, `codellama:13b`

3. **Otimizações Adicionais**:
   - Reduza `OLLAMA_CONTEXT_LENGTH` para 8192 ou 4096
   - Defina `OLLAMA_MAX_LOADED_MODELS=1`
   - Aumente o swap do sistema se possível
   - Feche aplicações desnecessárias

Para mais detalhes sobre configuração de modelos, consulte a seção "Configuração do Modelo LLM" acima.

## Licença

Este projeto está licenciado sob a [GNU General Public License v3.0](LICENSE).

## Links Úteis

- [Conventional Commits](https://www.conventionalcommits.org/pt-br/v1.0.0/)
- [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/)
- [Versionamento Semântico](https://semver.org/lang/pt-BR/)
- [Documentação Docker](https://docs.docker.com/)
- [Documentação .NET](https://learn.microsoft.com/dotnet/)

[Ver Changelog](CHANGELOG.md)
