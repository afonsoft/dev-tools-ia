# 📋 MCP Quick Setup Guide

## 🚀 Servers Prontos para Usar (Sem Instalação)

### ✅ **DeepWiki** (Já Funciona)
- **Tipo**: SSE Server
- **Uso**: Documentação técnica e conhecimento
- **Instalação**: Não precisa
- **Status**: ✅ Ativo

### ⚠️ **Servers que Precisam de Instalação**

#### **Essenciais para C#/.NET**
```bash
# Memory (persistência)
pip install mcp-server-memory

# Fetch (requisições HTTP)
pip install mcp-server-fetch

# Filesystem (acesso a arquivos)
npm install -g @modelcontextprotocol/server-filesystem

# Git (controle de versão)
npm install -g @modelcontextprotocol/server-git

# SQLite (banco de dados)
npm install -g @modelcontextprotocol/server-sqlite
```

#### **Opcionais Avançados**
```bash
# Web scraping
npm install -g @modelcontextprotocol/server-puppeteer

# Componentes UI
npm install -g @modelcontextprotocol/server-shadcn-ui

# Busca web (API key gratuita)
npm install -g @modelcontextprotocol/server-brave-search
```

## 🔧 Configuração Atual

O `openhands/settings.json` já está configurado com:

### **SSE Servers** (Sem instalação)
- **deepwiki**: Documentação técnica online

### **Stdio Servers** (Precisam instalação)
- **memory**: Memória persistente
- **fetch**: Requisições HTTP
- **filesystem**: Acesso a arquivos
- **git**: Operações Git
- **sqlite**: Banco de dados

> **Nota**: Os stdio servers mostrarão mensagens de instalação até que você os instale.

## 🚀 Setup Rápido

### 1. Instalar Servidores Essenciais
```bash
# Windows
pip install mcp-server-memory mcp-server-fetch
npm install -g @modelcontextprotocol/server-filesystem @modelcontextprotocol/server-git @modelcontextprotocol/server-sqlite

# Linux/macOS
pip install mcp-server-memory mcp-server-fetch
npm install -g @modelcontextprotocol/server-filesystem @modelcontextprotocol/server-git @modelcontextprotocol/server-sqlite
```

### 2. Reiniciar OpenHands
```bash
docker-compose restart openhands
```

### 3. Verificar Instalação
```bash
# Verificar logs
docker-compose logs openhands | grep -i mcp

# Acessar OpenHands
http://localhost:3000
```

## 📊 Status dos Servers

| Server | Status | Instalação | Uso Principal |
|--------|--------|------------|---------------|
| deepwiki | ✅ Ativo | ❌ Não precisa | Documentação |
| memory | ⚠️ Placeholder | ✅ pip install | Memória |
| fetch | ⚠️ Placeholder | ✅ pip install | HTTP |
| filesystem | ⚠️ Placeholder | ✅ npm install | Arquivos |
| git | ⚠️ Placeholder | ✅ npm install | Git |
| sqlite | ⚠️ Placeholder | ✅ npm install | Database |

## 🎯 Benefícios

✅ **DeepWiki já funciona** - Documentação técnica imediata  
✅ **Setup incremental** - Instale só o que precisar  
✅ **Mensagens claras** - Avisa exatamente o que instalar  
✅ **Foco C#/.NET** - Servers essenciais priorizados  

**Pronto para começar com DeepWiki e instalar os outros conforme necessário!** 🚀
