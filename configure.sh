#!/bin/bash

# Check if a model name was provided
if [ -z "$1" ]; then
    echo "Uso: ./configure.sh <nome-do-modelo>"
    echo "Exemplo: ./configure.sh llama2:13b"
    exit 1
fi

MODEL_NAME=$1

# Update docker-compose.yml
sed -i "s/OPENHANDS_LLM_MODEL: .*/OPENHANDS_LLM_MODEL: $MODEL_NAME/" docker-compose.yml
sed -i "s/OLLAMA_MODEL=.*/OLLAMA_MODEL=$MODEL_NAME/" docker-compose.yml
sed -i "s/ollama pull .*/ollama pull $MODEL_NAME \&\&/" docker-compose.yml

# Update settings.json
sed -i "s|\"llm_model\": \".*\"|\"llm_model\": \"ollama\/$MODEL_NAME\"|" openhands/settings.json

echo "Configuração atualizada com sucesso!"
echo "Novo modelo definido para: $MODEL_NAME"
echo "Por favor, reinicie seus containers para que as alterações tenham efeito:"
echo "docker-compose down && docker-compose up -d"
