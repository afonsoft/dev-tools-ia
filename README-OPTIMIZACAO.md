# 🚀 Otimizações de Memória para OpenHands

## 📋 Visão Geral

Este documento descreve as otimizações implementadas no projeto para reduzir o consumo de memória e recursos, baseado nas melhores práticas da documentação oficial do OpenHands.

## 🔧 Configurações Otimizadas

### 1. OpenHands - Modo Low Memory

#### Variáveis de Ambiente Chave
```yaml
# Limites de memória e processamento
OPENHANDS_MEMORY_BUDGET: 2147483648  # 2GB total
OPENHANDS_MAX_PARALLEL_REQUESTS: 1   # Sequencial
OPENHANDS_MAX_ITERATIONS: 20          # Reduzido

# Sandbox otimizado
SANDBOX_MEMORY_LIMIT: "1g"           # 1GB para sandbox
SANDBOX_CPU_LIMIT: "0.5"              # Meio CPU core
SANDBOX_TIMEOUT: 180                  # 3 minutos

# Workspace reduzido
MAX_WORKSPACE_SIZE: "2g"              # 2GB max
WORKSPACE_TIMEOUT: 300                # 5 minutos
```

#### Recursos Docker
```yaml
deploy:
  resources:
    limits:
      memory: "2g"    # 2GB total
      cpus: "1.0"     # 1 CPU core
```

### 2. Ollama - Configuração Ultra-Leve

#### Otimizações de VRAM
```yaml
OLLAMA_GPU_LAYERS: 25              # Reduzido para RTX 2050
OLLAMA_CONTEXT_LENGTH: 2048        # Contexto mínimo funcional
OLLAMA_GPU_OVERHEAD: 536870912     # 512MB overhead
OLLAMA_BATCH_SIZE: 128             # Batch reduzido
OLLAMA_PRELOAD: 0                   # Sem preload
```

#### Recursos Docker
```yaml
deploy:
  resources:
    limits:
      memory: "3g"    # 3GB para Ollama
      cpus: "1.0"     # 1 CPU core
```

### 3. Web UI - Minimalista

```yaml
deploy:
  resources:
    limits:
      memory: "512m"   # 512MB apenas
      cpus: "0.5"     # Meio CPU core
```

## 📊 Comparação de Consumo

| Componente | Padrão | Otimizado | Economia |
|------------|--------|-----------|----------|
| OpenHands | 4GB RAM | 2GB RAM | 50% |
| Ollama | 6GB RAM | 3GB RAM | 50% |
| Web UI | 1GB RAM | 512MB RAM | 50% |
| **Total** | **11GB** | **5.5GB** | **50%** |

## 🎯 Recomendações por Hardware

### Sistema Básico (8GB RAM Total)
- Use `docker-compose.low-memory.yml`
- Feche outras aplicações
- Desabilite plugins não essenciais

### Sistema Intermediário (16GB RAM Total)
- Use `docker-compose.yml` (otimizado)
- Pode manter algumas aplicações abertas

### Sistema Avançado (32GB+ RAM Total)
- Use configuração padrão
- Habilite todos os recursos

## ⚡ Dicas de Performance Adicionais

### 1. Monitoramento
```bash
# Monitorar uso de memória dos containers
docker stats --no-stream

# Monitorar VRAM da GPU
nvidia-smi --query-gpu=memory.used,memory.total --format=csv
```

### 2. Limpeza Automática
```bash
# Limpar containers parados
docker container prune -f

# Limpar imagens não usadas
docker image prune -f
```

### 3. Swap do Sistema
```bash
# Aumentar swap (Linux)
sudo swapon --show
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

## 🔍 Troubleshooting

### Erro: "Out of Memory"
- Reduza `OPENHANDS_LLM_GPU_LAYERS` para 20
- Diminua `OLLAMA_CONTEXT_LENGTH` para 1024
- Use modelo menor: `phi:latest` ou `qwen2.5:1.5b`

### Erro: "Container Killed"
- Verifique logs: `docker logs openhands-hands-app`
- Reduza limites de memória em 25%
- Aumente timeout para operações longas

### Performance Lenta
- Aumente `OLLAMA_BATCH_SIZE` gradualmente
- Habilite `OLLAMA_FLASH_ATTENTION=1`
- Considere quantização `q3_K_M` (mais leve)

## 📚 Referências

- [OpenHands Local Setup](https://docs.openhands.dev/openhands/usage/run-openhands/local-setup)
- [Agent Server Resource Management](https://docs.openhands.dev/sdk/arch/agent-server)
- [Local LLMs Guide](https://docs.openhands.dev/openhands/usage/llms/local-llms)
- [Docker Sandbox Configuration](https://docs.openhands.dev/openhands/usage/sandboxes/docker)

## 🔄 Como Usar

### Para Sistemas com Pouca Memória:
```bash
# Usar configuração ultra-leve
docker-compose -f docker-compose.low-memory.yml up -d
```

### Para Sistemas com Memória Moderada:
```bash
# Usar configuração otimizada
docker-compose up -d
```

### Monitoramento em Tempo Real:
```bash
# Script de monitoramento
watch -n 2 'docker stats --no-stream && echo "---" && free -h'
```

## 🎯 Benefícios Alcançados

✅ **50% de economia** no consumo total de memória  
✅ **Compatibilidade** com RTX 2050 4GB VRAM  
✅ **Estabilidade** em sistemas de 8GB RAM  
✅ **Performance** aceitável para desenvolvimento C#  
✅ **Escalabilidade** - fácil upgrade para mais recursos  

---

**Nota**: Estas otimizações foram testadas especificamente para RTX 2050 com 4GB VRAM e sistemas com 8-16GB RAM. Ajustes adicionais podem ser necessários para outras configurações de hardware.
