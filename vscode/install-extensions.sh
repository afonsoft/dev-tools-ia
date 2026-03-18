#!/bin/bash

# ╔═══════════════════════════════════════════════════════════════════════╗
# ║  VS Code / Windsurf — Install Extensions Script (Cross-Platform)      ║
# ║  Instala extensões essenciais para C#/.NET + Angular + Gemini API     ║
# ╚═══════════════════════════════════════════════════════════════════════╝

echo "🚀 VS Code Extensions Installer - Modern C#/.NET + Angular Development"
echo "====================================================================="

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

# Verificar VS Code/Windsurf instalado
check_vscode() {
    echo "🔍 Verificando VS Code/Windsurf..."
    if command -v code &> /dev/null; then
        echo "✅ VS Code encontrado"
        CODE_CMD="code"
    elif command -v windsurf &> /dev/null; then
        echo "✅ Windsurf encontrado"
        CODE_CMD="windsurf"
    elif command -v code-server &> /dev/null; then
        echo "✅ Code Server encontrado"
        CODE_CMD="code-server"
    elif [[ "$OS" == "Windows" ]] && command -v code.cmd &> /dev/null; then
        echo "✅ VS Code encontrado (Windows)"
        CODE_CMD="code.cmd"
    else
        echo "❌ VS Code/Windsurf não encontrado. Instale VS Code ou Windsurf primeiro."
        exit 1
    fi
}

# Lista de extensões para instalar (baseado no extensions.json atualizado)
declare -a EXTENSIONS=(
    # 🚀 AI & Code Completion
    "github.copilot"
    "github.copilot-chat"
    "ms-vscode.intellicode-api-usage-examples"
    "ms-vscode.intellicode"
    "visualstudioexptteam.vscodeintellicode"
    
    # 💻 C# / .NET Development
    "ms-dotnettools.csharp"
    "ms-dotnettools.csdevkit"
    "ms-dotnettools.blazor"
    "ms-dotnettools.dotnet-interactive-vscode"
    "ms-dotnettools.vscode-dotnet-runtime"
    "ms-vscode.dotnet-runtime"
    "jchannon.csharpextensions"
    "formulahendry.dotnet-core-snippets"
    "ms-dotnettools.vscode-dotnet-pack"
    "dotnet-exception-snippets.exception-snippets"
    "boundarystudio.csharp-extentions-pack"
    
    # 🧪 Testing & Quality
    "k--kato.docrunner"
    "formulahendry.dotnet-test-explorer"
    "hbenl.vscode-test-explorer"
    "ms-vscode.test-adapter-converter"
    
    # 🌐 Web Development (Angular & Frontend)
    "angular.ng-template"
    "johnpapa.angular2"
    "ms-vscode.vscode-html-css-pack"
    "bradlc.vscode-tailwindcss"
    "formulahendry.auto-rename-tag"
    "formulahendry.auto-close-tag"
    "ms-vscode.vscode-typescript-next"
    "ms-vscode.vscode-jest"
    "xabikos.javascriptsnippets"
    "richie5um2.scss-class-completion"
    "syler.sass-indented"
    "ms-vscode.live-server"
    "gformat.html-formatter"
    
    # 📝 Languages & Frameworks
    "ms-vscode.vscode-json"
    "redhat.vscode-xml"
    "redhat.vscode-yaml"
    "ms-vscode.vscode-yaml"
    
    # 🐳 Docker & Containers
    "ms-azuretools.vscode-docker"
    "ms-vscode-remote.remote-containers"
    "formulahendry.docker-extension-pack"
    
    # 🔧 Git & Version Control
    "eamodio.gitlens"
    "github.vscode-pull-request-github"
    "github.vscode-github-actions"
    "donjayamanne.git-extension-pack"
    "mhutchie.git-graph"
    "codezombiech.gitignore"
    "waderyan.gitblame"
    "donjayamanne.githistory"
    
    # 🗄️ Database & Data
    "ms-mssql.mssql"
    "ms-vscode.vscode-sql-tools"
    "cweijan.vscode-redis-client"
    "ms-azuretools.vscode-cosmosdb"
    "humao.rest-client"
    
    # 🎨 Code Quality & Formatting
    "esbenp.prettier-vscode"
    "dbaeumer.vscode-eslint"
    "editorconfig.editorconfig"
    "davidanson.vscode-markdownlint"
    "streetsidesoftware.code-spell-checker"
    "streetsidesoftware.code-spell-checker-portuguese"
    "streetsidesoftware.code-spell-checker-spanish"
    
    # 📋 Productivity & Utilities
    "gruntfuggly.todo-tree"
    "christian-kohler.path-intellisense"
    "christian-kohler.npm-intellisense"
    "alefragnani.bookmarks"
    "coenraadf.bracket-pair-colorizer-2"
    "oderwat.indent-rainbow"
    "mechatroner.rainbow-csv"
    
    # 🖥️ Terminal & Shell
    "ms-vscode.vscode-powershell"
    "runemula.vscode-git-bash"
    "tyriar.shell-launcher"
    
    # 🎨 Themes & Icons
    "pkief.material-icon-theme"
    "ms-vscode.theme-tomorrow-night-blue"
    "zhuangtongfa.material-theme"
    "dracula-theme.theme-dracula"
    "sainnhe.gruvbox-material"
    "whizark.workbench-monokai"
    "akamud.vscode-theme-onedark"
    "vscode-icons-team.vscode-icons"
    "johnpapa.vscode-peacock"
    "johnpapa.winteriscoming"
    
    # 📖 Documentation & Markdown
    "yzhang.markdown-all-in-one"
    "shd101wyy.markdown-preview-enhanced"
    "mushanshit.vscode-markdown-image"
    "hugonode.paste-json-as-markdown"
    "bierner.markdown-mermaid"
    "bierner.markdown-footnotes"
    "bierner.markdown-checkbox"
    "bierner.markdown-yaml-preamble"
    
    # 🔍 Search & Navigation
    "ms-vscode.hexeditor"
    "redhat.vscode-commons"
    
    # 🌐 Remote Development
    "ms-vscode-remote.remote-ssh"
    "ms-vscode-remote.remote-wsl"
    "ms-vscode.remote-explorer"
    
    # 🐍 Python (para scripts e automação)
    "ms-python.python"
    "ms-python.vscode-pylance"
    "ms-python.black-formatter"
    "ms-python.isort"
    "ms-python.flake8"
    
    # 🌟 Other Languages
    "golang.go"
    "rust-lang.rust-analyzer"
    "scala-lang.scala"
    "redhat.java"
    "vscjava.vscode-java-pack"
    "rebornix.ruby"
    
    # ⏱️ Time Tracking
    "wakatime.vscode-wakatime"
    
    # 🔧 JavaScript Debugging
    "ms-vscode.js-debug"
    "ms-vscode.js-debug-companion"
    
    # 🛡️ Security & Analysis
    "ms-vscode.vscode-codeql"
    
    # ☁️ Azure & Cloud
    "ms-vscode.azure-account"
    "ms-vscode.azurecli"
    "ms-azuretools.vscode-azurefunctions"
    "ms-azuretools.vscode-azureresourcegroups"
    "ms-azuretools.vscode-azurestorage"
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
    echo "• GitHub Copilot (AI code completion)"
    echo "• C# Dev Kit (.NET development)"
    echo "• Angular Extension (Frontend framework)"
    echo "• Docker (Container development)"
    echo "• GitLens (Git superpowers)"
    echo "• Material Icon Theme (Modern icons)"
    echo ""
    echo "🚀 VS Code/Windsurf está pronto para desenvolvimento moderno!"
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
