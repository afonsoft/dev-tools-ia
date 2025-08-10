#!/bin/bash

# Loop de tentativas para garantir que o code-server está pronto
until /app/code-server/bin/code-server --version; do
  echo "Aguardando o code-server..."
  sleep 5
done

echo "Instalando extensões..."
/app/code-server/bin/code-server --install-extension ms-dotnettools.csharp
/app/code-server/bin/code-server --install-extension ms-dotnettools.csdevkit
/app/code-server/bin/code-server --install-extension genepiot.ollama-vscode
/app/code-server/bin/code-server --install-extension mechatroner.rainbow-csv
/app/code-server/bin/code-server --install-extension bradlc.vscode-tailwindcss
/app/code-server/bin/code-server --install-extension dbaeumer.vscode-eslint
/app/code-server/bin/code-server --install-extension angular.ng-template
/app/code-server/bin/code-server --install-extension boundarystudio.csharp-extentions-pack
/app/code-server/bin/code-server --install-extension donjayamanne.git-extension-pack
/app/code-server/bin/code-server --install-extension donjayamanne.githistory
/app/code-server/bin/code-server --install-extension editorconfig.editorconfig
/app/code-server/bin/code-server --install-extension esbenp.prettier-vscode
/app/code-server/bin/code-server --install-extension gformat.html-formatter
/app/code-server/bin/code-server --install-extension github.copilot
/app/code-server/bin/code-server --install-extension github.copilot-chat
/app/code-server/bin/code-server --install-extension github.vscode-github-actions
/app/code-server/bin/code-server --install-extension github.vscode-pull-request-github
/app/code-server/bin/code-server --install-extension johnpapa.angular-essentials
/app/code-server/bin/code-server --install-extension johnpapa.angular2
/app/code-server/bin/code-server --install-extension johnpapa.vscode-peacock
/app/code-server/bin/code-server --install-extension johnpapa.winteriscoming
/app/code-server/bin/code-server --install-extension shd101wyy.markdown-preview-enhanced
/app/code-server/bin/code-server --install-extension visualstudioexptteam.intellicode-api-usage-examples
/app/code-server/bin/code-server --install-extension visualstudioexptteam.vscodeintellicode
/app/code-server/bin/code-server --install-extension vscode-icons-team.vscode-icons
/app/code-server/bin/code-server --install-extension zhuangtongfa.material-theme

echo "Iniciando o code-server..."
/app/code-server/bin/code-server --bind-addr 0.0.0.0:8443 /workspace
