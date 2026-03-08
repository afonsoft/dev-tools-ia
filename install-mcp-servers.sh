#!/bin/bash

# 🚀 MCP Servers Installation Script
# Para desenvolvimento C#/.NET com OpenHands

echo "🔧 Instalando MCP Servers para OpenHands..."

# Verificar se Node.js está instalado
if ! command -v npm &> /dev/null; then
    echo "❌ Node.js não encontrado. Por favor, instale Node.js primeiro."
    exit 1
fi

# Verificar se Python está instalado
if ! command -v python &> /dev/null; then
    echo "❌ Python não encontrado. Por favor, instale Python primeiro."
    exit 1
fi

echo "✅ Pré-requisitos verificados. Instalando servidores..."

# Servidores principais (obrigatórios)
echo "📦 Instalando servidores principais..."
npm install -g @modelcontextprotocol/server-memory
npm install -g @modelcontextprotocol/server-sequential-thinking
npm install -g @modelcontextprotocol/server-everything
pip install mcp-server-fetch

# Servidores de desenvolvimento (essenciais para C#)
echo "💻 Instalando servidores de desenvolvimento..."
npm install -g @modelcontextprotocol/server-filesystem
npm install -g @modelcontextprotocol/server-git
npm install -g @modelcontextprotocol/server-sqlite

# Servidores web (opcionais mas úteis)
echo "🌐 Instalando servidores web..."
npm install -g @modelcontextprotocol/server-puppeteer
npm install -g @modelcontextprotocol/server-shadcn-ui

# Servidor de busca (opcional, requer API key)
echo "🔍 Instalando servidor de busca..."
npm install -g @modelcontextprotocol/server-brave-search

# Servidor Docker (já incluído no OpenHands)
echo "🐳 Verificando suporte Docker..."
if command -v docker &> /dev/null; then
    echo "✅ Docker encontrado - MCP Docker Gateway disponível"
else
    echo "⚠️ Docker não encontrado - MCP Docker Gateway não estará disponível"
fi

echo ""
echo "🎉 Instalação concluída!"
echo ""
echo "📋 Próximos passos:"
echo "1. Copie mcp-config.json para o diretório do OpenHands"
echo "2. Reinicie o container OpenHands"
echo "3. Configure as API keys opcionais (Brave Search, etc.)"
echo ""
echo "📚 Documentação completa: MCP-README.md"
