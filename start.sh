#!/bin/bash

echo "======================================"
echo " Encerrando ambiente anterior (se existir)"
echo "======================================"
docker compose down

echo ""
echo "======================================"
echo " Iniciando ambiente com Docker Compose"
echo "======================================"
docker compose up --build -d

echo ""
echo "Aguardando inicialização dos serviços..."
sleep 20

echo ""
echo "======================================"
echo " URLs dos Serviços"
echo "======================================"
echo "OpenHands:   http://localhost:3000"
echo "Open-WebUI:  http://localhost:8080"
echo "Ollama API:  http://localhost:11434"
echo "VS Code:     http://localhost:8443"
sleep 5

echo ""
echo "Abrindo serviços no navegador..."
# Detecta o sistema operacional para usar o comando correto
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Comando para Linux
    xdg-open http://localhost:3000
    xdg-open http://localhost:8080
    xdg-open http://localhost:8443
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Comando para macOS
    open http://localhost:3000
    open http://localhost:8080
    open http://localhost:8443
else
    echo "Não foi possível detectar o sistema operacional para abrir URLs."
fi

echo ""
echo "Ambiente iniciado com sucesso!"
read -p "Pressione qualquer tecla para fechar esta janela..." -n 1 -r
echo ""