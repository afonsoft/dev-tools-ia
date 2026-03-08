#!/bin/bash

# ╔═══════════════════════════════════════════════════════════════════════╗
# ║  VS Code — Install Extensions Script (Cross-Platform)                  ║
# ║  Instala extensões essenciais para DevTools IA + RTX 2050             ║
# ╚═══════════════════════════════════════════════════════════════════════╝

echo "🚀 VS Code Extensions Installer - DevTools IA + RTX 2050"
echo "======================================================"

# Detectar sistema operacional
detect_os() {
    case "$(uname -s)" in
        Linux*)     OS="Linux";;
        Darwin*)    OS="macOS";;
        CYGWIN*|MINGW*|MSYS*) OS="Windows";;
        *)          OS="Unknown";;
    esac
    echo "📱 Sistema detectado: $OS"
}

# Verificar VS Code instalado
check_vscode() {
    echo "🔍 Verificando VS Code..."
    if command -v code &> /dev/null; then
        echo "✅ VS Code encontrado"
        CODE_CMD="code"
    elif command -v code-server &> /dev/null; then
        echo "✅ Code Server encontrado"
        CODE_CMD="code-server"
    elif [[ "$OS" == "Windows" ]] && command -v code.cmd &> /dev/null; then
        echo "✅ VS Code encontrado (Windows)"
        CODE_CMD="code.cmd"
    else
        echo "❌ VS Code não encontrado. Instale VS Code primeiro."
        exit 1
    fi
}

# Lista de extensões para instalar
declare -a EXTENSIONS=(
    # AI & Code Completion
    "continue.continue"
    "github.copilot"
    "github.copilot-chat"
    "ms-vscode.intellicode-api-usage-examples"
    "ms-vscode.intellicode"
    
    # C# / .NET Development
    "ms-dotnettools.csharp"
    "ms-dotnettools.csdevkit"
    "ms-dotnettools.blazor"
    "ms-dotnettools.dotnet-interactive-vscode"
    "ms-dotnettools.vscode-dotnet-runtime"
    "k--kato.docrunner"
    "formulahendry.dotnet-test-explorer"
    "ms-vscode.dotnet-runtime"
    "jchannon.csharpextensions"
    "formulahendry.dotnet-core-snippets"
    "ms-dotnettools.vscode-dotnet-pack"
    
    # Testing & Quality
    "hbenl.vscode-test-explorer"
    "ms-vscode.test-adapter-converter"
    "dotnet-exception-snippets.exception-snippets"
    
    # Web Development
    "ms-vscode.vscode-html-css-pack"
    "bradlc.vscode-tailwindcss"
    "formulahendry.auto-rename-tag"
    "formulahendry.auto-close-tag"
    "ritwickdey.liveserver"
    "yzhang.markdown-all-in-one"
    "shd101wyy.markdown-preview-enhanced"
    
    # Docker & Containers
    "ms-azuretools.vscode-docker"
    "ms-vscode-remote.remote-containers"
    "formulahendry.docker-extension-pack"
    "ms-vscode.vscode-yaml"
    "redhat.vscode-yaml"
    
    # Git & Version Control
    "eamodio.gitlens"
    "github.vscode-pull-request-github"
    "github.vscode-github-actions"
    "donjayamanne.git-extension-pack"
    "mhutchie.git-graph"
    "codezombiech.gitignore"
    "waderyan.gitblame"
    "donjayamanne.githistory"
    
    # Database & Data
    "ms-mssql.mssql"
    "ms-vscode.vscode-sql-tools"
    "cweijan.vscode-redis-client"
    "ms-azuretools.vscode-cosmosdb"
    "humao.rest-client"
    
    # Productivity & Editor Enhancements
    "esbenp.prettier-vscode"
    "dbaeumer.vscode-eslint"
    "editorconfig.editorconfig"
    "streetsidesoftware.code-spell-checker"
    "streetsidesoftware.code-spell-checker-portuguese"
    "streetsidesoftware.code-spell-checker-spanish"
    "gruntfuggly.todo-tree"
    "christian-kohler.path-intellisense"
    "ms-vscode.vscode-powershell"
    
    # Themes & Icons
    "pkief.material-icon-theme"
    "ms-vscode.theme-tomorrow-night-blue"
    "zhuangtongfa.material-theme"
    "dracula-theme.theme-dracula"
    "sainnhe.gruvbox-material"
    "vscode-icons-team.vscode-icons"
    
    # Utilities & Tools
    "ms-vscode.live-server"
    "ms-vscode.hexeditor"
    "alefragnani.bookmarks"
    "wakatime.vscode-wakatime"
    
    # Remote Development
    "ms-vscode-remote.remote-ssh"
    "ms-vscode-remote.remote-wsl"
    "ms-vscode.remote-explorer"
    
    # Language Support
    "ms-python.python"
    "ms-python.vscode-pylance"
    "ms-python.black-formatter"
    "ms-python.isort"
    "ms-python.flake8"
    "golang.go"
    "rust-lang.rust-analyzer"
    "redhat.java"
    "vscjava.vscode-java-pack"
    
    # Markdown & Documentation
    "davidanson.vscode-markdownlint"
    "mushanshit.vscode-markdown-image"
    "hugonode.paste-json-as-markdown"
    "bierner.markdown-mermaid"
    "bierner.markdown-footnotes"
    "bierner.markdown-checkbox"
    
    # Snippets & Code Generation
    "xabikos.javascriptsnippets"
    "visualstudioexptteam.vscodeintellicode"
    
    # Performance & Monitoring
    "coenraadf.bracket-pair-colorizer-2"
    "oderwat.indent-rainbow"
    
    # Terminal & Shell
    "tyriar.shell-launcher"
    "runemula.vscode-git-bash"
    
    # Additional Extensions
    "genepiot.ollama-vscode"
    "mechatroner.rainbow-csv"
    "angular.ng-template"
    "boundarystudio.csharp-extentions-pack"
    "gformat.html-formatter"
    "johnpapa.angular2"
    "johnpapa.vscode-peacock"
    "johnpapa.winteriscoming"
)

# Instalar extensões
install_extensions() {
    echo "📦 Instalando ${#EXTENSIONS[@]} extensões..."
    echo ""
    
    local success_count=0
    local fail_count=0
    
    for extension in "${EXTENSIONS[@]}"; do
        echo -n "🔧 Instalando $extension... "
        
        if $CODE_CMD --install-extension "$extension" --force &> /dev/null; then
            echo "✅"
            ((success_count++))
        else
            echo "❌"
            ((fail_count++))
        fi
    done
    
    echo ""
    echo "📊 Resumo da instalação:"
    echo "✅ Sucesso: $success_count extensões"
    echo "❌ Falhas: $fail_count extensões"
}

# Verificar instalações
verify_installations() {
    echo ""
    echo "🔍 Verificando extensões instaladas..."
    
    local installed_count=0
    for extension in "${EXTENSIONS[@]}"; do
        if $CODE_CMD --list-extensions | grep -q "$extension"; then
            ((installed_count++))
        fi
    done
    
    echo "📈 Extensões instaladas: $installed_count/${#EXTENSIONS[@]}"
    
    if [[ $installed_count -eq ${#EXTENSIONS[@]} ]]; then
        echo "🎉 Todas as extensões foram instaladas com sucesso!"
    else
        echo "⚠️  Algumas extensões podem não ter sido instaladas. Verifique manualmente."
    fi
}

# Exibir informações úteis
show_info() {
    echo ""
    echo "📋 Informações úteis:"
    echo "• Para listar extensões instaladas: $CODE_CMD --list-extensions"
    echo "• Para desinstalar extensão: $CODE_CMD --uninstall-extension <nome>"
    echo "• Para atualizar extensões: $CODE_CMD --update-extensions"
    echo ""
    echo "⚡ Extensões principais instaladas:"
    echo "• Continue (IA local com Ollama)"
    echo "• GitHub Copilot"
    echo "• C# Dev Kit"
    echo "• Docker"
    echo "• GitLens"
    echo "• Material Icon Theme"
    echo ""
    echo "🚀 VS Code está pronto para DevTools IA + RTX 2050!"
}

# Função principal
main() {
    detect_os
    check_vscode
    install_extensions
    verify_installations
    show_info
}

# Executar script
main "$@"
