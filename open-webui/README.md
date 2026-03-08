# 🌐 Open WebUI - Interface Web para Ollama

## 📋 Visão Geral

Este diretório armazena os dados e configurações do Open WebUI, a interface web amigável para interação com modelos de linguagem locais rodando no Ollama.

## 📁 Estrutura do Diretório

```
open-webui/
├── README.md                    # Este arquivo
├── data/                        # Dados persistentes da aplicação
│   ├── database/                # Banco de dados SQLite
│   │   └── webui.db            # BD principal
│   ├── uploads/                 # Arquivos enviados
│   ├── cache/                   # Cache da aplicação
│   └── logs/                    # Logs da aplicação
├── config/                      # Configurações personalizadas
│   ├── app.json                # Configurações da aplicação
│   └── users.json              # Configurações de usuários
└── backups/                    # Backups automáticos
    └── webui-backup-20240307.sql
```

## 🎯 Propósito

### O que é armazenado aqui:

1. **Banco de Dados**: Usuários, conversas, configurações
2. **Uploads**: Arquivos enviados durante conversas
3. **Cache**: Dados temporários para performance
4. **Logs**: Logs da aplicação web
5. **Configurações**: Personalizações do ambiente

### Por que este diretório é importante:

- **Persistência**: Mantém conversas e usuários entre reinicializações
- **Backup**: Facilita backup de dados importantes
- **Customização**: Permite configurações específicas
- **Segurança**: Isolamento dos dados da aplicação

## 🔧 Configuração no Docker Compose

No arquivo `docker-compose.yml`, este diretório é montado como volume:

```yaml
services:
  open-webui:
    volumes:
      - ./open-webui:/app/backend/data
```

Isso garante que:
- Conversas sejam persistidas
- Usuários mantenham suas configurações
- Uploads sejam preservados
- Logs sejam acessíveis

## 🌐 Funcionalidades Principais

### Interface Web:

- **Chat Interativo**: Interface amigável para conversar com LLMs
- **Gestão de Modelos**: Visualizar e gerenciar modelos disponíveis
- **Histórico**: Conversas anteriores são salvas automaticamente
- **Upload de Arquivos**: Suporte para análise de documentos
- **Multi-usuários**: Sistema de usuários com autenticação

### Configurações Padrão:

```yaml
environment:
  OLLAMA_BASE_URL: http://ollama:11434
  OPENWEBUI_USERNAME: admin@admin.com
  OPENWEBUI_PASSWORD: admin
  ENABLE_MODEL_FILTER: true
  ENABLE_SIGNUP: false
  WEBUI_NAME: "OpenHands Lite"
  DEFAULT_MODELS: ["qwen2.5-coder:7b-instruct-q4_K_M"]
  ENABLE_RAG_WEB_SEARCH: true
  ENABLE_IMAGE_GENERATION: true
```

## 👥 Gestão de Usuários

### Usuário Padrão:

- **Email**: admin@admin.com
- **Senha**: admin
- **Função**: Administrador

### Criar Novos Usuários:

1. Acesse: http://localhost:8080
2. Faça login como administrador
3. Vá para "Admin" > "Users"
4. Clique em "Add User"

### Permissões:

- **Admin**: Acesso total ao sistema
- **User**: Acesso limitado às próprias conversas
- **Guest**: Acesso apenas visual (se habilitado)

## 📊 Uso de Espaço

### Estimativa de Uso:

| Componente | Uso Inicial | Crescimento |
|------------|-------------|-------------|
| Banco de Dados | ~10MB | ~1MB por 100 conversas |
| Uploads | 0MB | Variável |
| Cache | ~50MB | ~100MB máximo |
| Logs | ~1MB | ~5MB por semana |

### Recomendações:

- **Mínimo**: 1GB de espaço livre
- **Recomendado**: 5GB para uso extensivo
- **Limpeza**: Implementar limpeza automática de logs

## 🔍 Administração

### Comandos Úteis:

```bash
# Verificar status do container
docker ps | grep open-webui

# Verificar logs
docker logs open-webui

# Acessar terminal do container
docker exec -it open-webui bash

# Verificar uso de espaço
du -sh open-webui/

# Backup do banco de dados
docker exec open-webui cp /app/backend/data/database/webui.db /app/backend/data/backups/webui-backup-$(date +%Y%m%d).sql
```

### Manutenção Automática:

```bash
#!/bin/bash
# maintenance-openwebui.sh

echo "🔧 Manutenção do Open WebUI"

# 1. Limpar logs antigos
find open-webui/data/logs -name "*.log" -mtime +7 -delete

# 2. Limpar cache antigo
find open-webui/data/cache -name "*" -mtime +1 -delete

# 3. Backup do banco
docker exec open-webui cp /app/backend/data/database/webui.db /app/backend/data/backups/webui-backup-$(date +%Y%m%d).sql

# 4. Verificar espaço
echo "📊 Uso de espaço:"
du -sh open-webui/

# 5. Limpar backups antigos
find open-webui/data/backups -name "*.sql" -mtime +30 -delete

echo "✅ Manutenção concluída"
```

## 🚀 Integração com Outros Serviços

### Ollama:

- **Conexão**: `http://ollama:11434`
- **Modelos**: Utiliza modelos disponíveis no Ollama
- **API**: Comunicação via REST API

### OpenHands:

- **Compartilhamento**: Ambos utilizam o mesmo Ollama
- **Configuração**: Modelos compartilhados entre serviços
- **Performance**: Cache compartilhado quando possível

### VS Code + Continue:

- **Alternativa**: Continue pode ser usado como alternativa
- **Configuração**: Ambos apontam para o mesmo endpoint Ollama
- **Uso**: Continue para desenvolvimento, WebUI para interação

## 🔐 Segurança

### Configurações de Segurança:

```yaml
environment:
  ENABLE_SIGNUP: false              # Desabilitar cadastros públicos
  ENABLE_MODEL_FILTER: true         # Filtrar modelos disponíveis
  WEBUI_SECRET_KEY: "sua-chave-secreta"  # Chave de criptografia
  DEFAULT_USER_ROLE: "user"         # Função padrão para novos usuários
```

### Boas Práticas:

1. **Mudar Senha Padrão**: Alterar senha do admin
2. **HTTPS**: Configurar HTTPS em produção
3. **Backup**: Implementar backup regular do banco
4. **Monitoramento**: Monitorar acessos suspeitos
5. **Atualizações**: Manter imagem atualizada

## 📈 Monitoramento

### Métricas Importantes:

- **Uso de Memória**: Monitorar consumo do container
- **Conversas Ativas**: Número de conversas simultâneas
- **Taxa de Erros**: Erros na aplicação
- **Performance**: Tempo de resposta das APIs

### Scripts de Monitoramento:

```bash
#!/bin/bash
# monitor-openwebui.sh

echo "📊 Monitoramento Open WebUI"

# Verificar se está rodando
if docker ps | grep -q open-webui; then
    echo "✅ Container rodando"
else
    echo "❌ Container parado"
fi

# Verificar uso de recursos
echo "📈 Recursos:"
docker stats --no-stream open-webui

# Verificar logs de erro
echo "🔍 Logs de erro:"
docker logs open-webui 2>&1 | grep -i error | tail -5

# Verificar espaço
echo "💾 Espaço em uso:"
du -sh open-webui/
```

## 🛠️ Troubleshooting

### Problemas Comuns:

1. **Interface não carrega**
   ```bash
   # Verificar se o container está rodando
   docker ps | grep open-webui
   
   # Verificar logs
   docker logs open-webui
   
   # Reiniciar container
   docker restart open-webui
   ```

2. **Não conecta ao Ollama**
   ```bash
   # Verificar conexão entre containers
   docker network ls
   docker network inspect dev-tools-ia_openhands-net
   
   # Testar conexão
   docker exec open-webui curl http://ollama:11434/api/tags
   ```

3. **Login falha**
   ```bash
   # Verificar usuário no banco
   docker exec open-webui sqlite3 /app/backend/data/database/webui.db "SELECT * FROM user;"
   
   # Resetar senha admin
   docker exec open-webui python -c "
   from app.backend.models.user import User
   from app.backend.database.database import get_db
   db = next(get_db())
   admin = db.query(User).filter(User.email == 'admin@admin.com').first()
   if admin:
       admin.password = 'admin'  # Reset para senha padrão
       db.commit()
       print('Senha resetada')
   "
   ```

4. **Espaço em disco insuficiente**
   ```bash
   # Verificar uso
   du -sh open-webui/
   
   # Limpar cache
   docker exec open-webui rm -rf /app/backend/data/cache/*
   
   # Limpar logs
   docker exec open-webui rm -rf /app/backend/data/logs/*
   ```

## 📝 Backup e Restore

### Backup Completo:

```bash
#!/bin/bash
# backup-openwebui.sh

BACKUP_DIR="backups/open-webui"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/webui-backup-$TIMESTAMP.tar.gz"

echo "🗄️ Criando backup do Open WebUI"

# Criar diretório de backup
mkdir -p $BACKUP_DIR

# Backup completo
tar -czf $BACKUP_FILE open-webui/

echo "✅ Backup criado: $BACKUP_FILE"
```

### Restore:

```bash
#!/bin/bash
# restore-openwebui.sh

BACKUP_FILE=$1

if [ -z "$BACKUP_FILE" ]; then
    echo "Uso: $0 <arquivo-de-backup>"
    exit 1
fi

echo "🔄 Restaurando backup do Open WebUI"

# Parar container
docker stop open-webui

# Fazer backup do estado atual
mv open-webui open-webui.backup.$(date +%Y%m%d)

# Restaurar do backup
tar -xzf $BACKUP_FILE

# Iniciar container
docker start open-webui

echo "✅ Backup restaurado"
```

## 📚 Documentação Adicional

- [Documentação Oficial Open WebUI](https://github.com/open-webui/open-webui)
- [Guia de Configuração](../README.md)
- [Configuração do Ollama](../ollama/README.md)
- [Docker Compose](../docker-compose.yml)

## 🔄 Roadmap

### v1.1.0 (Planejado):
- Temas personalizáveis
- Integração com mais LLMs
- Melhorias de performance
- Sistema de plugins

### v1.2.0 (Planejado):
- Multi-idioma completo
- Integração com GitHub
- Sistema de permissões avançado
- Analytics dashboard

---

**Importante**: Este diretório contém dados sensíveis de usuários e conversas. Implemente políticas de backup e segurança adequadas em ambiente de produção.
