# 🚀 Setup VS Code + Continue para RTX 2050 com Qwen 2.5 Coder 7B

## 📋 Requisitos
- RTX 2050 (4GB VRAM)
- VS Code instalado
- Ollama instalado localmente
- Extensão Continue no VS Code

## 🔧 Passo 1: Instalar Ollama

1. Acesse [ollama.com](https://ollama.com) e baixe a versão Windows
2. Após instalar, abra PowerShell/CMD como Administrador
3. Instale o modelo otimizado:

```bash
ollama pull qwen2.5-coder:7b-instruct-q4_K_M
```

4. Verifique a instalação:

```bash
ollama list
```

## ⚙️ Passo 2: Configurar VS Code + Continue

### 2.1 Instalar Extensão Continue
1. No VS Code: `Ctrl+Shift+X` (Extensions)
2. Pesquise: `Continue`
3. Instale a extensão de `ContinueDev`

### 2.2 Configurar Modelo
1. Clique no ícone Continue (símbolo "C" na barra lateral)
2. Clique na engrenagem ⚙️ (Config) no canto inferior direito
3. Abra o arquivo `config.json`

### 2.3 Copiar Arquivos de Configuração
Copie os arquivos da pasta `vscode/` deste repositório:

#### 📁 Windows (PowerShell/CMD)
```powershell
# Copiar configurações do VS Code
copy vscode\settings.json "%APPDATA%\Code\User\settings.json"

# Copiar configurações do Continue
copy vscode\config.json "%APPDATA%\Code\User\globalStorage\continue.continue\config.json"

# Copiar atalhos personalizados
copy vscode\keybindings.json "%APPDATA%\Code\User\keybindings.json"

# Copiar extensões recomendadas
copy vscode\extensions.json "%APPDATA%\Code\User\extensions.json"
```

#### 🐧 Linux/macOS (Bash/Zsh)
```bash
# Copiar configurações do VS Code
cp vscode/settings.json ~/.config/Code/User/settings.json

# Copiar configurações do Continue
cp vscode/config.json ~/.config/Code/User/globalStorage/continue.continue/config.json

# Copiar atalhos personalizados
cp vscode/keybindings.json ~/.config/Code/User/keybindings.json

# Copiar extensões recomendadas
cp vscode/extensions.json ~/.config/Code/User/extensions.json
```

#### 📂 Estrutura de Arquivos na Pasta VSCode
```
vscode/
├── settings.json              # Configurações otimizadas para RTX 2050
├── config.json               # Configuração do Continue + Ollama
├── keybindings.json          # Atalhos personalizados para C#/.NET
├── extensions.json           # Extensões recomendadas (mesclado)
├── install-extensions.sh     # Script de instalação Linux/macOS
├── install-extensions.bat    # Script de instalação Windows
└── README.md                 # Documentação completa
```

### 2.4 Configurar Continue para Ollama (Completo)

#### 🎯 Configuração Automática
O arquivo `vscode/config.json` já contém toda a configuração necessária para usar o Qwen 2.5 Coder 7B com Ollama:

```json
{
  "models": [
    {
      "title": "Qwen 2.5 Coder 7B - RTX 2050 Optimized",
      "provider": "ollama",
      "model": "qwen2.5-coder:7b-instruct-q4_K_M",
      "contextLength": 4096,
      "temperature": 0.1,
      "topP": 0.9,
      "topK": 40,
      "repeatPenalty": 1.1,
      "systemPrompt": "You are an expert C#/.NET developer specializing in clean code, SOLID principles, Entity Framework Core, and modern .NET practices..."
    }
  ],
  "tabAutocompleteModel": {
    "title": "Qwen 2.5 Coder 7B - RTX 2050 Autocomplete",
    "provider": "ollama",
    "model": "qwen2.5-coder:7b-instruct-q4_K_M",
    "contextLength": 2048,
    "temperature": 0.0,
    "maxTokens": 256
  },
  "providerOptions": {
    "ollama": {
      "apiBase": "http://localhost:11434",
      "timeout": 120000,
      "numParallelRequests": 1,
      "numCtx": 4096
    }
  }
}
```

#### 🔧 Configuração Manual (se necessário)
1. Clique no ícone Continue (símbolo "C" na barra lateral)
2. Clique na engrenagem ⚙️ (Config) no canto inferior direito
3. Abra o arquivo `config.json`
4. Copie o conteúdo do arquivo `vscode/config.json`

#### ⚡ Comandos Personalizados Disponíveis
- `/refactor` - Refatorar código seguindo SOLID principles
- `/test` - Gerar testes xUnit com Moq
- `/document` - Gerar documentação XML
- `/optimize` - Otimizar performance
- `/repository` - Criar Repository pattern
- `/api` - Criar endpoints Web API
- `/linq` - Converter para LINQ
- `/async` - Converter para async/await
- `/validate` - Adicionar validação
- `/security` - Adicionar medidas de segurança

#### 🎨 Context Providers
- `@codebase` - Contexto completo do projeto
- `@file` - Arquivo atual
- `@directory` - Diretório atual

### 2.5 Verificar Instalação
Após copiar os arquivos:

1. **Reinicie VS Code** para carregar as novas configurações
2. **Verifique Continue**: Clique no ícone "C" na barra lateral
3. **Teste modelo**: `Ctrl+L` e digite "Hello, are you working?"
4. **Verifique atalhos**: `Ctrl+Shift+P` > "Preferences: Open Keyboard Shortcuts (JSON)"

### 2.6 Instalar Extensões Recomendadas

#### Opção 1: Script Automático (Recomendado)
Use o script apropriado para seu sistema operacional:

**Windows:**
```cmd
# No PowerShell ou CMD
vscode\install-extensions.bat
```

**Linux/macOS:**
```bash
# No terminal
chmod +x vscode/install-extensions.sh
./vscode/install-extensions.sh
```

#### Opção 2: Manual via VS Code
VS Code perguntará se deseja instalar as extensões recomendadas. Clique em "Install All".

#### Opção 3: Terminal VS Code
```bash
# No VS Code Terminal
code --install-extension continue.continue
code --install-extension ms-dotnettools.csharp
code --install-extension ms-dotnettools.csdevkit
code --install-extension eamodio.gitlens
code --install-extension ms-azuretools.vscode-docker
```

## 🎯 Passo 3: Otimizações para RTX 2050

### 3.1 Gerenciamento de VRAM
- **Feche navegadores** com muitas abas antes de usar
- **Evite YouTube/Twitch** durante sessões de codificação
- **Monitore VRAM** com `nvidia-smi` no terminal

### 3.2 Context Length Otimizado
- **Chat**: 4096 tokens (configurado)
- **Autocomplete**: 2048 tokens (mais rápido)
- **Arquivos grandes**: Divida em partes menores

## 💻 Passo 4: Workflow C#/.NET

### 4.1 Chat Básico (`Ctrl+L`)
Selecione código e use prompts especializados:

```
// Refactor this method using SOLID principles and LINQ
```

```
// Create a Repository pattern for this Entity Framework Core model
```

```
// Add xUnit tests following Arrange-Act-Assert pattern
```

### 4.2 Edit Direto (`Ctrl+I`)
Escreva comentários e deixe a IA gerar:

```csharp
// TODO: Implement async method to fetch users from database with error handling
// TODO: Add input validation using DataAnnotations
// TODO: Create DTO class for API response
```

### 4.3 Contexto Local (`@Codebase`)
Use `@Codebase` no chat para referenciar todo o projeto:

```
@Codebase Create a new service layer following Dependency Injection principles
```

### 4.4 Prompts Especializados C#

#### Para Entity Framework Core:
```
Generate a Repository pattern implementation for this DbContext with async methods, proper error handling, and unit testing support.
```

#### Para Web API:
```
Create RESTful API endpoints with proper HTTP verbs, status codes, validation, and Swagger documentation.
```

#### Para Testes Unitários:
```
Generate comprehensive xUnit tests for this class using Arrange-Act-Assert pattern, mocking dependencies with Moq.
```

#### Para LINQ:
```
Refactor this foreach loop to use LINQ for better performance and readability.
```

## 🔍 Passo 5: Comandos Úteis

### 5.1 Gerenciamento Ollama
```bash
# Verificar modelo rodando
ollama ps

# Parar modelo (libera VRAM)
ollama stop qwen2.5-coder:7b-instruct-q4_K_M

# Reiniciar modelo
ollama run qwen2.5-coder:7b-instruct-q4_K_M

# Verificar uso de VRAM
nvidia-smi
```

### 5.2 Atalhos VS Code + Continue
- `Ctrl+L`: Abrir chat Continue
- `Ctrl+I`: Editar código selecionado
- `Ctrl+Shift+\`: Focar input Continue
- `Ctrl+Shift+/`: Comandos slash Continue
- `Ctrl+Shift+P`: "Continue: " para comandos especiais

### 5.3 Atalhos Personalizados C#/.NET
- `Ctrl+Shift+C`: Gerar código async
- `Ctrl+Shift+T`: Rodar testes no contexto
- `Ctrl+Shift+R`: Refatorar código
- `Ctrl+Shift+M`: Adicionar usings faltantes
- `Ctrl+Shift+U`: Remover usings não utilizados

## 🚨 Dicas Profissionais

### Performance
1. **Context menor = Mais rápido**: Use contextos específicos
2. **Evite arquivos >1000 linhas**: Divida em classes menores
3. **Use prompts diretos**: Seja específico no que quer

### Python + IA Integrado
Se precisar rodar treinamentos Python:

```bash
# Pare o modelo Qwen para liberar VRAM
ollama stop qwen2.5-coder:7b-instruct-q4_K_M

# Execute seu script Python
python train_model.py

# Reinicie o modelo quando terminar
ollama run qwen2.5-coder:7b-instruct-q4_K_M
```

### Troubleshooting

**Arquivos não encontrados:**
```bash
# Windows - Verificar caminhos
echo %APPDATA%
dir "%APPDATA%\Code\User"

# Linux/macOS - Verificar caminhos  
echo ~/.config/Code/User
ls -la ~/.config/Code/User
```

**Continue não reconhece configuração:**
1. Verifique se o caminho está correto:
   - Windows: `%APPDATA%\Code\User\globalStorage\continue.continue\config.json`
   - Linux/macOS: `~/.config/Code/User/globalStorage/continue.continue/config.json`
2. Reinicie VS Code completamente
3. Verifique se a extensão Continue está instalada

**Atalhos não funcionam:**
1. Abra `Ctrl+Shift+P` > "Preferences: Open Keyboard Shortcuts (JSON)"
2. Verifique se o arquivo `keybindings.json` foi copiado corretamente
3. Reinicie VS Code

**VRAM esgotada:**
```bash
ollama stop qwen2.5-coder:7b-instruct-q4_K_M
# Feche aplicativos que usam VRAM
ollama run qwen2.5-coder:7b-instruct-q4_K_M
```

**Modelo lento:**
- Reduza `contextLength` no config.json
- Use `temperature: 0.0` para respostas mais rápidas
- Divida prompts grandes

**Conexão recusada:**
- Verifique se Ollama está rodando: `ollama list`
- Reinicie Ollama se necessário

## 🎉 Exemplo Completo: Gerar Testes xUnit

1. Selecione uma classe C#
2. `Ctrl+L` para abrir chat
3. Prompt:
```
@Codebase Generate comprehensive xUnit tests for this repository class following these requirements:
- Use Arrange-Act-Assert pattern
- Mock dependencies with Moq
- Test all public methods
- Include edge cases and error scenarios
- Use meaningful test names
- Add Theory tests for parameter validation
```

## ✅ Verificação Final

Após seguir todos os passos, verifique:

### ✅ VS Code Configurado
- [ ] Extensão Continue instalada
- [ ] Configurações copiadas para pasta correta
- [ ] Atalhos personalizados funcionando
- [ ] Extensões recomendadas instaladas

### ✅ Ollama Funcionando
- [ ] Modelo `qwen2.5-coder:7b-instruct-q4_K_M` instalado
- [ ] Serviço Ollama rodando (`ollama list`)
- [ ] VRAM disponível (`nvidia-smi`)

### ✅ Integração Testada
- [ ] Continue responde ao "Hello"
- [ ] Autocomplete funcionando
- [ ] Comandos slash disponíveis
- [ ] Contexto `@Codebase` funcionando

O Qwen 2.5 Coder 7B entenderá perfeitamente o contexto C#/.NET e gerará código profissional otimizado para sua RTX 2050! 🚀
