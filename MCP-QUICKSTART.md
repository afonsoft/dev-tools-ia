# 🚀 MCP Quickstart Guide

Setup rápido dos servidores MCP para desenvolvimento C#/.NET com OpenHands e Gemini 2.5 Flash API otimizada.

## 🎯 Objetivo

Configurar rapidamente os servidores MCP essenciais para maximizar a produtividade com OpenHands e Gemini 2.5 Flash API otimizada.

## ⚡ Setup Rápido (5 minutos)

### 1. Instalação dos Servidores

```bash
# Instalar servidores principais
npm install -g @modelcontextprotocol/server-memory
npm install -g @modelcontextprotocol/server-sequential-thinking
npm install -g @modelcontextprotocol/server-filesystem
npm install -g @modelcontextprotocol/server-git
pip install mcp-server-fetch

# Servidores opcionais (recomendados)
npm install -g @modelcontextprotocol/server-sqlite
npm install -g @modelcontextprotocol/server-puppeteer
```

### 2. Configuração Automática

```bash
# O script start.sh já configura MCP automaticamente
./start.sh

# Ou configurar manualmente
cp mcp-config.json openhands/
docker-compose restart openhands
```

### 3. Verificação

```bash
# Verificar se MCP está funcionando
docker-compose exec openhands curl -f http://localhost:3000/health

# Verificar logs MCP
docker-compose logs openhands | grep -i mcp
```

## 🔧 Configuração Essencial

### openhands/settings.json (já configurado para Gemini)
```json
{
  "mcp_config": {
    "sse_servers": [
      {
        "url": "https://mcp.deepwiki.com/mcp",
        "api_key": null
      }
    ],
    "stdio_servers": [
      {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-memory"],
        "env": {
          "MEMORY_LIMIT": "1GB",
          "CACHE_SIZE": "100MB"
        }
      },
      {
        "command": "npx", 
        "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"],
        "env": {}
      },
      {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-filesystem", "/workspace"],
        "env": {}
      },
      {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-git"],
        "env": {}
      },
      {
        "command": "python",
        "args": ["-m", "mcp_server_fetch"],
        "env": {}
      },
      {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-sqlite"],
        "env": {}
      },
      {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-puppeteer"],
        "env": {}
      },
      {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-shadcn-ui"],
        "env": {}
      }
    ],
    "shttp_servers": []
  }
}
```

## 🎯 Casos de Uso Imediatos

### 1. Repository Pattern Automático
```
Prompt: "Create Repository pattern for Entity Framework Core with async methods using MCP filesystem and git servers"
```

### 2. Code Review Inteligente
```
Prompt: "Review this C# code using SOLID principles and suggest improvements with MCP sequential-thinking"
```

### 3. Database Operations
```
Prompt: "Create SQLite database schema for this C# project using MCP sqlite server"
```

### 4. Web Scraping
```
Prompt: "Extract data from this website using MCP puppeteer server"
```

## 📊 Servidores Configurados

| Servidor | Tipo | Uso Principal | Requisito |
|----------|------|---------------|-----------|
| memory | stdio | Memória persistente | npm |
| sequential-thinking | stdio | Processamento estruturado | npm |
| filesystem | stdio | Arquivos locais | npm |
| git | stdio | Controle de versão | npm |
| fetch | stdio | Requisições HTTP | pip |
| deepwiki | sse | Documentação técnica | grátis |
| sqlite | stdio | Banco de dados | npm |
| puppeteer | stdio | Web automation | npm |
| shadcn-ui | stdio | Componentes UI | npm |

## 🚀 Teste Rápido

### Teste Básico
```bash
# Acessar OpenHands
http://localhost:3000

# Testar MCP memory
Prompt: "Lembre-se que meu projeto usa .NET 8 e Entity Framework Core"

# Testar MCP filesystem  
Prompt: "Liste todos os arquivos .cs no projeto usando filesystem"

# Testar MCP git
Prompt: "Verifique o status do git e crie um branch para feature X"
```

### Teste Avançado
```bash
# Testar workflow completo com Gemini 2.5 Flash
Prompt: "Usando MCP servers e Gemini 2.5 Flash:
1. Analise o projeto atual (filesystem)
2. Crie testes unitários para as classes principais com xUnit
3. Faça commit das mudanças (git)
4. Documente o processo (memory)
5. Otimize performance com parallel processing"
```

## 🔥 Benefícios Imediatos

✅ **Productividade 10x** com automação de tarefas repetitivas  
✅ **Qualidade** com padrões SOLID e melhores práticas  
✅ **Velocidade** com operações Git e filesystem otimizadas  
✅ **Inteligência** com memória contextual e aprendizado  
✅ **Automação** com web scraping e database operations  
✅ **Documentação** com acesso a conhecimento técnico via deepwiki  
✅ **Performance** com Gemini 2.5 Flash otimizado  
✅ **UI Components** com shadcn-ui integration  

## 🚨 Troubleshooting Rápido

### Servidor não encontrado
```bash
# Reinstalar servidor específico
npm install -g @modelcontextprotocol/server-nome

# Verificar instalação
npx @modelcontextprotocol/server-nome --help
```

### Permissões negadas
```bash
# Verificar permissões do workspace
docker-compose exec openhands ls -la /workspace

# Ajustar permissões se necessário
docker-compose exec openhands chmod -R 755 /workspace
```

### MCP não iniciando
```bash
# Verificar logs completos
docker-compose logs openhands

# Reiniciar OpenHands
docker-compose restart openhands
```

## 📚 Próximos Passos

- **Guia Completo**: Veja [MCP-README.md](./MCP-README.md)
- **OpenHands Config**: Veja [openhands/README.md](./openhands/README.md)
- **Exemplos Práticos**: Veja [README.md](./README.md#exemplos-práticos)

---

**Pronto para acelerar seu desenvolvimento C#/.NET com MCP e Gemini 2.5 Flash?** 🚀

Setup completo em 5 minutos com performance otimizada! ⚡
