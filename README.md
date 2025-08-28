# Dev Tools IA

Ambiente de desenvolvimento integrado para processamento de linguagem natural e codificação assistida por IA, combinando OpenHands, Ollama e uma interface web amigável.

## Descrição do Projeto

Este projeto fornece um ambiente de desenvolvimento containerizado focado em IA, que integra várias ferramentas para desenvolvimento assistido por inteligência artificial. O ambiente inclui suporte para desenvolvimento .NET, Node.js e oferece capacidades avançadas de processamento de linguagem natural.

## Stack Tecnológica

- **Runtime Base**: Docker com suporte a NVIDIA GPU
- **Frameworks e SDKs**:
  - .NET SDK 8.0 e 9.0
  - Node.js (última versão LTS via NVM)
- **Componentes Principais**:
  - [OpenHands](http://localhost:3000): Ambiente de desenvolvimento IA
  - [Ollama](http://localhost:11434): API de modelo de linguagem
  - [Web UI](http://localhost:8080): Interface gráfica para interação com modelos

## Pré-requisitos

- Docker e Docker Compose
- Driver NVIDIA e NVIDIA Container Toolkit (para aceleração GPU)
- Git

## Como Executar

1. Clone o repositório
2. Execute o script de inicialização:
   - Windows: `start.bat`
   - Linux/macOS: `./start.sh`

O ambiente será iniciado automaticamente e abrirá as interfaces web no navegador padrão.

## Estrutura do Repositório

```
.
├── openhands/                # Configurações do OpenHands
│   └── settings.json        # Configurações do agente e LLM
├── runtime/                 # Configuração do ambiente de execução
│   └── Dockerfile          # Definição do container de desenvolvimento
├── vscode/                 # Configurações do VS Code
│   ├── extensions.json     # Extensões recomendadas
│   └── install-extensions.sh # Script de instalação de extensões
├── docker-compose.yml      # Definição dos serviços
├── start.bat              # Script de inicialização (Windows)
├── start.sh              # Script de inicialização (Linux/macOS)
└── README.md             # Esta documentação
```

## Variáveis de Ambiente

### OpenHands
- `LOG_ALL_EVENTS`: Habilita log detalhado
- `LLM_MAX_INPUT_TOKENS`: 16384
- `LLM_MAX_OUTPUT_TOKENS`: 16384
- `OPENHANDS_LLM_PROVIDER`: ollama
- `OPENHANDS_LLM_MODEL`: qwen2.5-coder:7b

### Ollama
- `OLLAMA_CONTEXT_LENGTH`: 16384
- `OLLAMA_HOST`: 0.0.0.0:11434
- `OLLAMA_MODEL`: qwen2.5-coder:7b
- `OLLAMA_NUM_PARALLEL`: 2
- `OLLAMA_KEEP_ALIVE`: 30m

### Web UI
- `OPENWEBUI_USERNAME`: admin@admin.com
- `OPENWEBUI_PASSWORD`: admin

## Extensões VS Code Recomendadas

- .NET Development
  - C# Dev Kit
  - C# Extensions Pack
- Git Integration
  - Git Extension Pack
  - Git History
- AI & Development
  - GitHub Copilot
  - Ollama VSCode
- Formatação e Estilo
  - EditorConfig
  - Prettier
  - ESLint
- Frameworks
  - Angular Extension Pack
  - Tailwind CSS IntelliSense

## Licença

Este projeto está licenciado sob a [GNU General Public License v3.0](LICENSE)

## Links Úteis

- [Conventional Commits](https://www.conventionalcommits.org/pt-br/v1.0.0/)
- [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/)
- [Versionamento Semântico](https://semver.org/lang/pt-BR/)

[Ver Changelog](CHANGELOG.md)
