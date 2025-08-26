@echo off
title Iniciando OpenHands + Ollama + VS Code

echo ======================================
echo  Encerrando ambiente anterior (se existir)
echo ======================================
docker compose down

echo.
echo ======================================
echo  Iniciando ambiente com Docker Compose
echo ======================================
docker compose up --build -d
REM docker compose up --force-recreate

echo.
echo Aguardando inicializacao dos servicos...
timeout /t 20 /nobreak > nul

echo.
echo ======================================
echo  URLs dos Servicos
echo ======================================
echo OpenHands:   http://localhost:3000
echo Ollama API:  http://localhost:11434
echo Web UI:      http://localhost:8080
timeout /t 5 /nobreak > nul
echo.
echo Abrindo servicos no navegador...
start http://localhost:3000
start http://localhost:8080
echo.
echo Ambiente iniciado com sucesso!
echo Pressione qualquer tecla para fechar esta janela...
pause > nul