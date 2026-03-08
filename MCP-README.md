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

## � Tipos de Servidores MCP

### 🔄 **Stdio Servers** (Direto)
- **Uso**: Desenvolvimento e testes rápidos
- **Performance**: Alta (sem overhead de proxy)
- **Confiabilidade**: Média (sem reconexão automática)
- **Recomendado**: Para desenvolvimento local

### 🌐 **SSE Servers** (Server-Sent Events)
- **Uso**: Produção e serviços externos
- **Performance**: Média (com overhead)
- **Confiabilidade**: Alta (reconexão automática)
- **Recomendado**: Para serviços críticos

### ⚡ **SHTTP Servers** (HTTP Streamable)
- **Uso**: Operações pesadas e streaming
- **Performance**: Alta (com timeout configurável)
- **Confiabilidade**: Alta (reconexão automática)
- **Recomendado**: Para processamento de arquivos

## 🔧 Configuração Oficial OpenHands

A configuração segue o formato oficial do OpenHands:

```json
{
    "mcp": {
        "stdio_servers": [...],
        "sse_servers": [...],
        "shttp_servers": [...]
    }
}
```

### 🔄 **Stdio Servers** (Configurados)
- **memory**: Armazenamento persistente
- **sequential-thinking**: Processamento estruturado
- **everything**: Busca universal
- **fetch**: Requisições HTTP
- **filesystem**: Acesso a arquivos
- **git**: Operações Git
- **sqlite**: Banco de dados
- **puppeteer**: Web automation
- **shadcn-ui**: Componentes UI

### 🌐 **SSE Servers** (Configurados)
- **deepwiki**: Documentação técnica

### ⚡ **SHTTP Servers** (Exemplo)
- **API externa**: Para processamento pesado

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

| Tipo | Server | Uso Principal | Token | Performance |
|------|--------|---------------|-------|-------------|
| Stdio | memory | Memória persistente | ❌ Não | ⚡ Alta |
| Stdio | filesystem | Arquivos locais | ❌ Não | ⚡ Alta |
| Stdio | git | Controle de versão | ❌ Não | ⚡ Alta |
| Stdio | sqlite | Banco de dados | ❌ Não | ⚡ Alta |
| Stdio | fetch | Requisições HTTP | ❌ Não | ⚡ Alta |
| Stdio | puppeteer | Web automation | ❌ Não | ⚡ Alta |
| SSE | deepwiki | Documentação | ❌ Não | 🔄 Média |
| SHTTP | custom | Processamento | ⚠️ Opcional | ⚡ Alta |

## ⚙️ Configuração Avançada

### Performance para RTX 2050
```json
{
    "mcp": {
        "stdio_servers": [
            {
                "name": "memory",
                "command": "npx",
                "args": ["-y", "@modelcontextprotocol/server-memory"],
                "env": {
                    "MEMORY_LIMIT": "1GB",
                    "CACHE_SIZE": "100MB"
                }
            }
        ],
        "shttp_servers": [
            {
                "url": "https://api.example.com/mcp/shttp",
                "timeout": 1800
            }
        ]
    }
}
```

### Segurança
```json
{
    "mcp": {
        "stdio_servers": [
            {
                "name": "filesystem",
                "command": "npx",
                "args": ["-y", "@modelcontextprotocol/server-filesystem", "/workspace"],
                "env": {
                    "ALLOWED_PATHS": "/workspace,/workspace/src",
                    "DENIED_PATHS": "/etc,/usr/bin"
                }
            }
        ]
    }
}
```

## 🚀 Setup Completo

### 1. Instale os servidores
```bash
# Windows
./install-mcp-servers.bat

# Linux/macOS
./install-mcp-servers.sh
```

### 2. Configure o OpenHands
```bash
# Copiar configuração
cp mcp-config.json ./openhands/

# Reiniciar OpenHands
docker-compose restart openhands
```

### 3. Verifique a instalação
```bash
# Verificar servidores ativos
docker-compose exec openhands curl -f http://localhost:3000/health

# Verificar logs
docker-compose logs openhands | grep -i mcp
```

## 📈 Benefícios

✅ **Productividade 10x**: Geração automática de código C# com stdio servers  
✅ **Qualidade**: Padrões SOLID e melhores práticas  
✅ **Velocidade**: Operações Git e filesystem em alta performance  
✅ **Inteligência**: Memória contextual e aprendizado contínuo  
✅ **Automação**: Web scraping e CI/CD integrados  
✅ **Confiabilidade**: Mix de stdio (dev) e SSE/SHTTP (produção)  
✅ **Flexibilidade**: Timeout configurável para operações pesadas  

## 🔗 Links Úteis

- [MCP Documentation](https://modelcontextprotocol.io/)
- [OpenHands MCP Integration](https://docs.all-hands.dev/)
- [C# Development Best Practices](https://docs.microsoft.com/en-us/dotnet/csharp/)

---

**Pronto para levar seu desenvolvimento C#/.NET ao próximo nível?** 🚀
