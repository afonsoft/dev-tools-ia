# 🤖 MCP Servers Configuration

## 📋 Visão Geral

O Model Context Protocol (MCP) permite que o OpenHands se conecte a diversas ferramentas e serviços externos. Esta configuração otimizada foi criada para desenvolvimento C#/.NET com máxima produtividade.

## 🚀 Instalação dos Servidores

### Servidores Principais (já configurados)
```bash
# Instalação global dos servidores MCP
npm install -g @modelcontextprotocol/server-memory
npm install -g @modelcontextprotocol/server-sequential-thinking
npm install -g @modelcontextprotocol/server-everything
pip install mcp-server-fetch
```

### Servidores Adicionais (opcionais)
```bash
# Para desenvolvimento C#/.NET
npm install -g @modelcontextprotocol/server-filesystem
npm install -g @modelcontextprotocol/server-git
npm install -g @modelcontextprotocol/server-sqlite

# Para web scraping e automação
npm install -g @modelcontextprotocol/server-puppeteer
npm install -g @modelcontextprotocol/server-shadcn-ui

# Para busca (requer API key gratuita)
npm install -g @modelcontextprotocol/server-brave-search

# Para bancos de dados
npm install -g @modelcontextprotocol/server-postgres
```

## 🔧 Configuração no OpenHands

1. Copie o arquivo `mcp-config.json` para o diretório do OpenHands:
```bash
cp mcp-config.json ./openhands/mcp-config.json
```

2. Adicione ao `docker-compose.yml` do OpenHands:
```yaml
environment:
  OPENHANDS_MCP_CONFIG_PATH: /openhands/mcp-config.json
```

## 📊 Descrição dos Servidores

### 🧠 **Core Servers** (Sempre Ativos)
- **memory**: Armazenamento persistente de contexto e memória
- **sequential-thinking**: Processamento estruturado de problemas
- **everything**: Busca universal em arquivos e conteúdo
- **fetch**: Requisições HTTP e integração web
- **deepwiki**: Documentação e conhecimento técnico

### 💻 **Development Servers** (Essenciais para C#)
- **filesystem**: Acesso otimizado ao sistema de arquivos
- **git**: Operações Git automatizadas e inteligentes
- **sqlite**: Banco de dados leve para projetos
- **docker**: Integração com containers Docker

### 🌐 **Web & Automation** (Opcional)
- **puppeteer**: Web scraping e automação de browsers
- **shadcn-ui**: Geração de componentes UI modernos
- **brave-search**: Busca web (requer API key gratuita)

### 🗄️ **Database & Integration** (Opcional)
- **postgres**: Conexão com PostgreSQL
- **slack**: Integração com Slack (opcional)
- **google-drive**: Acesso a arquivos Google Drive (opcional)

## 🎯 Casos de Uso para C#/.NET

### Repository Pattern Automatizado
```csharp
// O OpenHands pode criar automaticamente:
// - Repository classes com async methods
// - Unit tests com xUnit e Moq
// - DbContext otimizado
// - Migrations Entity Framework
```

### Code Generation
- **CRUD APIs**: Geração automática de endpoints
- **DTOs**: Data Transfer Objects validados
- **Services**: Lógica de negócio com SOLID
- **Tests**: Cobertura completa com padrões

### Project Management
- **Git Flow**: Branches, merges, releases automatizados
- **Documentation**: READMEs e comentários XML
- **CI/CD**: GitHub Actions ou Azure DevOps

## 🔥 Servidores Gratuitos Recomendados

| Server | Uso Principal | Token Necessário | Instalação |
|--------|---------------|------------------|------------|
| memory | Memória persistente | ❌ Não | npm install |
| filesystem | Arquivos locais | ❌ Não | npm install |
| git | Controle de versão | ❌ Não | npm install |
| sqlite | Banco de dados | ❌ Não | npm install |
| fetch | Requisições HTTP | ❌ Não | pip install |
| puppeteer | Web automation | ❌ Não | npm install |
| brave-search | Busca web | ✅ Gratuito | npm install |

## ⚙️ Configuração Avançada

### Performance para RTX 2050
```json
{
  "servers": {
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"],
      "env": {
        "MEMORY_LIMIT": "1GB",
        "CACHE_SIZE": "100MB"
      }
    }
  }
}
```

### Segurança
```json
{
  "servers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/workspace"],
      "env": {
        "ALLOWED_PATHS": "/workspace,/workspace/src",
        "DENIED_PATHS": "/etc,/usr/bin"
      }
    }
  }
}
```

## 🚀 Setup Completo

1. **Instale os servidores**:
```bash
./install-mcp-servers.sh
```

2. **Configure o OpenHands**:
```bash
cp mcp-config.json ./openhands/
docker-compose restart openhands
```

3. **Verifique a instalação**:
```bash
docker-compose exec openhands npx @modelcontextprotocol/cli list-servers
```

## 📈 Benefícios

✅ **Productividade 10x**: Geração automática de código C#  
✅ **Qualidade**: Padrões SOLID e melhores práticas  
✅ **Velocidade**: Operações Git e filesystem otimizadas  
✅ **Inteligência**: Memória contextual e aprendizado  
✅ **Automação**: Web scraping e CI/CD integrados  

## 🔗 Links Úteis

- [MCP Documentation](https://modelcontextprotocol.io/)
- [OpenHands MCP Integration](https://docs.all-hands.dev/)
- [C# Development Best Practices](https://docs.microsoft.com/en-us/dotnet/csharp/)

---

**Pronto para levar seu desenvolvimento C#/.NET ao próximo nível?** 🚀
