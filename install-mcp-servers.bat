@echo off
REM 🚀 MCP Servers Installation Script (Windows)
REM Para desenvolvimento C#/.NET com OpenHands

echo 🔧 Instalando MCP Servers para OpenHands...

REM Verificar se Node.js está instalado
where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ Node.js não encontrado. Por favor, instale Node.js primeiro.
    pause
    exit /b 1
)

REM Verificar se Python está instalado
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ Python não encontrado. Por favor, instale Python primeiro.
    pause
    exit /b 1
)

echo ✅ Pré-requisitos verificados. Instalando servidores...

REM Servidores principais (obrigatórios)
echo 📦 Instalando servidores principais...
npm install -g @modelcontextprotocol/server-memory
npm install -g @modelcontextprotocol/server-sequential-thinking
npm install -g @modelcontextprotocol/server-everything
pip install mcp-server-fetch

REM Servidores de desenvolvimento (essenciais para C#)
echo 💻 Instalando servidores de desenvolvimento...
npm install -g @modelcontextprotocol/server-filesystem
npm install -g @modelcontextprotocol/server-git
npm install -g @modelcontextprotocol/server-sqlite

REM Servidores web (opcionais mas úteis)
echo 🌐 Instalando servidores web...
npm install -g @modelcontextprotocol/server-puppeteer
npm install -g @modelcontextprotocol/server-shadcn-ui

REM Servidor de busca (opcional, requer API key)
echo 🔍 Instalando servidor de busca...
npm install -g @modelcontextprotocol/server-brave-search

REM Servidor Docker (já incluído no OpenHands)
echo 🐳 Verificando suporte Docker...
where docker >nul 2>nul
if %errorlevel% neq 0 (
    echo ⚠️ Docker não encontrado - MCP Docker Gateway não estará disponível
) else (
    echo ✅ Docker encontrado - MCP Docker Gateway disponível
)

echo.
echo 🎉 Instalação concluída!
echo.
echo 📋 Próximos passos:
echo 1. Copie mcp-config.json para o diretório do OpenHands
echo 2. Reinicie o container OpenHands
echo 3. Configure as API keys opcionais (Brave Search, etc.)
echo.
echo 📚 Documentação completa: MCP-README.md
pause
