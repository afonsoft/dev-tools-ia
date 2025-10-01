# Changelog
Todas as alterações notáveis neste projeto serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/),
e este projeto adere ao [Versionamento Semântico](https://semver.org/lang/pt-BR/).

## [1.2.0] - 2025-10-01

### Adicionado
- Atualização do OpenHands para versão 0.58
- Melhorias na documentação com estrutura mais clara
- Adição de seção detalhada de variáveis de ambiente
- Nova estrutura hierárquica do repositório no README

### Alterado
- Otimização das configurações de contexto do LLM (32768 tokens)
- Atualização das instruções de instalação e execução
- Refinamento da documentação técnica
- Melhorias na formatação e organização do README

### Corrigido
- Ajustes nos links internos da documentação
- Correção de inconsistências na documentação

## [1.1.0] - 2025-09-12
### Adicionado
- Atualização do OpenHands para versão 0.56
- Devstral 24B definido como modelo padrão
- Novas otimizações de memória e paralelismo
- Melhoria na documentação de configurações de hardware

### Alterado
- Ajuste nos parâmetros de paralelismo para melhor gerenciamento de memória
- Atualização das recomendações de modelos por perfil de hardware
- Refinamento das configurações de GPU para diferentes modelos de placas

## [1.0.0] - 2025-08-28

### Adicionado
- Configuração inicial do ambiente de desenvolvimento com Docker
- Integração com OpenHands, Ollama e Web UI
- Suporte a desenvolvimento .NET e Node.js
- Scripts de inicialização para Windows e Linux/macOS
- Configurações do VS Code e extensões recomendadas
- Documentação completa no README.md

### Configurado
- Ambiente Docker com suporte a GPU NVIDIA
- .NET SDKs 8.0 e 9.0
- Node.js com NVM
- Configurações do Ollama para modelo devstral:latest
- Autenticação básica para Web UI
