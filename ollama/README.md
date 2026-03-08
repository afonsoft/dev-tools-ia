# 🤖 Ollama - Local LLM Storage

## 📋 Visão Geral

Este diretório armazena os modelos de linguagem e configurações do Ollama, o serviço local de LLMs utilizado pelo projeto DevTools IA.

## 📁 Estrutura do Diretório

```
ollama/
├── README.md                    # Este arquivo
├── models/                      # Modelos baixados
│   ├── qwen2.5-coder:7b-instruct-q4_K_M/
│   │   ├── manifest.json        # Metadados do modelo
│   │   ├── model.bin           # Arquivo binário do modelo
│   │   └── ...                 # Outros arquivos do modelo
├── .ollama/                     # Configurações do Ollama
│   ├── config.json             # Configurações globais
│   └── logs/                   # Logs do serviço
└── data/                       # Dados persistentes
    └── database/               # Banco de dados do Ollama
```

## 🎯 Propósito

### O que é armazenado aqui:

1. **Modelos de LLM**: Arquivos binários dos modelos de linguagem
2. **Configurações**: Configurações específicas do Ollama
3. **Logs**: Logs de execução e erros
4. **Dados Persistentes**: Informações que precisam sobreviver a reinicializações

### Por que este diretório é importante:

- **Persistência**: Garante que modelos não sejam perdidos ao reiniciar containers
- **Performance**: Evita downloads repetidos dos mesmos modelos
- **Customização**: Permite configurações específicas por ambiente
- **Backup**: Facilita backup dos modelos e configurações

## 🔧 Configuração no Docker Compose

No arquivo `docker-compose.yml`, este diretório é montado como volume:

```yaml
services:
  ollama:
    volumes:
      - ./ollama:/root/.ollama
```

Isso garante que:
- Os modelos baixados persistam entre reinicializações
- As configurações sejam mantidas
- Os logs sejam acessíveis do host

## 📊 Modelos Utilizados

### Modelo Principal: Qwen 2.5 Coder 7B

```
Nome: qwen2.5-coder:7b-instruct-q4_K_M
Tamanho: ~4.8GB
Especialização: C#/.NET Development
Quantização: 4-bit (Q4_K_M)
VRAM Necessária: ~3.8GB
```

### Outros Modelos Disponíveis:

- `phi:latest` - Modelo leve (~2GB)
- `qwen2.5:1.5b` - Ultra leve (~1GB)
- `llama3.2:3b` - Alternativa médio (~2GB)
- `mistral:7b` - Modelo geral (~4GB)

## 🚀 Gerenciamento de Modelos

### Comandos Úteis:

```bash
# Listar modelos disponíveis
docker exec ollama-ai ollama list

# Baixar novo modelo
docker exec ollama-ai ollama pull phi:latest

# Remover modelo
docker exec ollama-ai ollama remove phi:latest

# Ver informações do modelo
docker exec ollama-ai ollama show qwen2.5-coder:7b-instruct-q4_K_M

# Ver logs do Ollama
docker logs ollama-ai
```

### Backup de Modelos:

```bash
# Criar backup do diretório completo
tar -czf ollama-backup-$(date +%Y%m%d).tar.gz ollama/

# Restaurar backup
tar -xzf ollama-backup-20240307.tar.gz
```

## 📈 Espaço em Disco

### Estimativa de Uso:

| Modelo | Tamanho | VRAM | Uso em Disco |
|--------|---------|------|--------------|
| Qwen 2.5 Coder 7B | 4.8GB | 3.8GB | ~5GB |
| Phi | 2.0GB | 1.5GB | ~2GB |
| Qwen 2.5 1.5B | 1.0GB | 1.2GB | ~1GB |

### Recomendações:

- **Mínimo**: 10GB de espaço livre
- **Recomendado**: 20GB para múltiplos modelos
- **Ideal**: 50GB para desenvolvimento extensivo

## 🔍 Troubleshooting

### Problemas Comuns:

1. **Modelo não encontrado**
   ```bash
   # Verificar se o modelo foi baixado
   docker exec ollama-ai ollama list
   
   # Baixar novamente se necessário
   docker exec ollama-ai ollama pull qwen2.5-coder:7b-instruct-q4_K_M
   ```

2. **Espaço em disco insuficiente**
   ```bash
   # Verificar uso de espaço
   du -sh ollama/
   
   # Remover modelos não utilizados
   docker exec ollama-ai ollama remove nome-do-modelo
   ```

3. **Permissões incorretas**
   ```bash
   # Verificar permissões
   ls -la ollama/
   
   # Corrigir permissões se necessário
   sudo chown -R $USER:$USER ollama/
   ```

4. **Container não inicia**
   ```bash
   # Verificar logs
   docker logs ollama-ai
   
   # Reiniciar container
   docker restart ollama-ai
   ```

## 🛠️ Manutenção

### Rotina de Manutenção Semanal:

```bash
#!/bin/bash
# maintenance-ollama.sh

echo "🔧 Manutenção do Ollama"

# 1. Limpar logs antigos
find ollama/.ollama/logs -name "*.log" -mtime +7 -delete

# 2. Verificar espaço em disco
echo "📊 Uso de espaço:"
du -sh ollama/

# 3. Listar modelos ativos
echo "🤖 Modelos ativos:"
docker exec ollama-ai ollama list

# 4. Verificar saúde do serviço
echo "🏥 Saúde do serviço:"
docker exec ollama-ai ollama ps

echo "✅ Manutenção concluída"
```

## 🔐 Segurança

### Considerações de Segurança:

1. **Acesso Restrito**: Este diretório contém modelos proprietários
2. **Backup Regular**: Implementar backup automático
3. **Monitoramento**: Monitorar acesso não autorizado
4. **Limpeza**: Remover modelos sensíveis quando não forem necessários

### Permissões Recomendadas:

```bash
# Dono: usuário que executa o Docker
# Grupo: docker
# Permissões: 755 (rwxr-xr-x)

sudo chown -R $USER:docker ollama/
sudo chmod -R 755 ollama/
```

## 📚 Documentação Adicional

- [Documentação Oficial Ollama](https://ollama.ai/docs)
- [Guia de Modelos Disponíveis](https://ollama.ai/library)
- [Configuração do Docker Compose](../docker-compose.yml)
- [README do Projeto](../README.md)

## 🔄 Integração com Outros Serviços

### OpenHands:
- Utiliza Ollama como provedor de LLM
- Configuração: `OPENHANDS_LLM_ENDPOINT=http://ollama:11434`

### VS Code + Continue:
- Conecta via API do Ollama
- Configuração: `vscode-continue-config.json`

### Web UI:
- Interface web para interação com modelos
- Acesso: http://localhost:8080

## 📝 Notas de Versão

### v1.0.0 (2024-03-07)
- Implementação inicial
- Suporte para Qwen 2.5 Coder 7B
- Configuração para RTX 2050

### v1.1.0 (Planejado)
- Suporte para múltiplos modelos
- Cache inteligente
- Monitoramento avançado

---

**Importante**: Este diretório é crítico para o funcionamento do sistema. Não remova ou modifique arquivos manualmente sem entender o impacto.
