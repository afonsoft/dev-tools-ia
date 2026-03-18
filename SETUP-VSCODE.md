# 🚀 Setup VS Code + GitHub Copilot para Desenvolvimento .NET

## 📋 Requisitos
- VS Code instalado
- GitHub Copilot ativado
- Extensões recomendadas para .NET

## ⚙️ Passo 1: Configurar VS Code + GitHub Copilot

### 1.1 Instalar Extensão GitHub Copilot
1. No VS Code: `Ctrl+Shift+X` (Extensions)
2. Pesquise: `GitHub Copilot`
3. Instale a extensão oficial
4. Faça login com sua conta GitHub

### 1.2 Configurar Copilot para .NET
1. Abra Settings: `Ctrl+,`
2. Configure para desenvolvimento .NET:
```json
{
  "github.copilot.enable": {
    "*": true,
    "csharp": true,
    "javascript": true,
    "typescript": true
  },
  "github.copilot.chat.provider": "copilot",
  "github.copilot.editor.enableAutoAcceptSuggestions": true,
  "github.copilot.editor.enableCodeActions": true
}
```

### 1.3 Copiar Arquivos de Configuração
Copie os arquivos da pasta `vscode/` deste repositório:

#### 📁 Windows (PowerShell/CMD)
```powershell
# Copiar configurações do VS Code
copy vscode\settings.json "%APPDATA%\Code\User\settings.json"

# Copiar atalhos personalizados
copy vscode\keybindings.json "%APPDATA%\Code\User\keybindings.json"

# Copiar extensões recomendadas
copy vscode\extensions.json "%APPDATA%\Code\User\extensions.json"
```

#### 🐧 Linux/macOS (Bash/Zsh)
```bash
# Copiar configurações do VS Code
cp vscode/settings.json ~/.config/Code/User/settings.json

# Copiar atalhos personalizados
cp vscode/keybindings.json ~/.config/Code/User/keybindings.json

# Copiar extensões recomendadas
cp vscode/extensions.json ~/.config/Code/User/extensions.json
```

#### 📂 Estrutura de Arquivos na Pasta VSCode
```
vscode/
├── settings.json              # Configurações otimizadas para .NET
├── keybindings.json          # Atalhos personalizados para C#/.NET
├── extensions.json           # Extensões recomendadas
├── install-extensions.sh     # Script de instalação Linux/macOS
├── install-extensions.bat    # Script de instalação Windows
└── README.md                 # Documentação completa
```

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

### 1.4 Verificar Instalação
Após copiar os arquivos:

1. **Reinicie VS Code** para carregar as novas configurações
2. **Verifique Copilot**: Clique no ícone Copilot na barra lateral
3. **Teste modelo**: `Ctrl+L` e digite "Hello, are you working?"
4. **Verifique atalhos**: `Ctrl+Shift+P` > "Preferences: Open Keyboard Shortcuts (JSON)"

### 1.5 Instalar Extensões Recomendadas

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
code --install-extension ms-dotnettools.csharp
code --install-extension ms-dotnettools.csdevkit
code --install-extension eamodio.gitlens
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode.vscode-json
```

## 🎯 Passo 2: Configurar GitHub Copilot Agents

### 2.1 Copiar Agents para o Projeto
```bash
# No seu projeto .NET
mkdir -p agents
cp -r /caminho/dev-tools-ia/agents/* ./agents/

# Commitar no repositório
git add agents/
git commit -m "feat: add GitHub Copilot agents for .NET development"
git push origin main
```

### 2.2 Configurar Copilot para usar Agents
```json
// Adicionar ao .vscode/settings.json do seu projeto
{
  "github.copilot.enable": {
    "*": true,
    "csharp": true
  },
  "github.copilot.chat.provider": "copilot",
  "github.copilot.advanced": {
    "useCopilotAgents": true,
    "agentsPath": "./agents"
  }
}
```

## 💻 Passo 3: Workflow C#/.NET com Agents

### 3.1 Chat Básico (`Ctrl+L`)
Selecione código e use prompts especializados com agents:

```
Use the design-patterns skill to refactor this method following SOLID principles and LINQ
```

```
Use the entity-framework-core skill to create a Repository pattern for this DbContext
```

```
Use the testing-xunit skill to add comprehensive unit tests for this class
```

### 3.2 Edit Direto (`Ctrl+I`)
Escreva comentários e deixe a IA gerar:

```csharp
// TODO: Use the security-jwt skill to implement JWT authentication
// TODO: Apply the aspnet-core-api skill for proper validation
// TODO: Use the performance-optimization skill for async handling
```

### 3.3 Contexto Local (`@Codebase`)
Use `@Codebase` no chat para referenciar todo o projeto:

```
@Codebase Use the dotnet-best-practices skill to create a service layer following Dependency Injection principles
```

### 3.4 Prompts Especializados C# com Agents

#### Para Entity Framework Core:
```
Use the entity-framework-core skill to generate a Repository pattern implementation for this DbContext with async methods, proper error handling, and unit testing support.
```

#### Para Web API:
```
Use the aspnet-core-api skill to create RESTful API endpoints with proper HTTP verbs, status codes, validation, and Swagger documentation.
```

#### Para Testes Unitários:
```
Use the testing-xunit skill to generate comprehensive xUnit tests for this class using Arrange-Act-Assert pattern, mocking dependencies with Moq.
```

#### Para Blazor:
```
Use the blazor-components skill to create reusable Blazor components with proper state management and accessibility features.
```

#### Para Performance:
```
Use the performance-optimization skill to optimize this code for better performance and memory usage.
```

## 🔍 Passo 4: Comandos Úteis

### 4.1 Atalhos VS Code + Copilot
- `Ctrl+L`: Abrir chat Copilot
- `Ctrl+I`: Editar código selecionado
- `Ctrl+Shift+\`: Focar input Copilot
- `Ctrl+Shift+/`: Comandos slash Copilot
- `Ctrl+Shift+P`: "Copilot: " para comandos especiais

### 4.2 Atalhos Personalizados C#/.NET
- `Ctrl+Shift+C`: Gerar código async
- `Ctrl+Shift+T`: Rodar testes no contexto
- `Ctrl+Shift+R`: Refatorar código
- `Ctrl+Shift+M`: Adicionar usings faltantes
- `Ctrl+Shift+U`: Remover usings não utilizados

## 🚨 Dicas Profissionais

### Performance com Agents
1. **Context menor = Mais rápido**: Use skills específicas
2. **Evite arquivos >1000 linhas**: Divida em classes menores
3. **Use prompts diretos**: Seja específico na skill desejada

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

**Copilot não reconhece configuração:**
1. Verifique se o caminho está correto:
   - Windows: `%APPDATA%\Code\User\settings.json`
   - Linux/macOS: `~/.config/Code/User/settings.json`
2. Reinicie VS Code completamente
3. Verifique se a extensão Copilot está instalada

**Atalhos não funcionam:**
1. Abra `Ctrl+Shift+P` > "Preferences: Open Keyboard Shortcuts (JSON)"
2. Verifique se o arquivo `keybindings.json` foi copiado corretamente
3. Reinicie VS Code

**Agents não funcionando:**
1. Verifique se a pasta `agents/` existe no projeto
2. Confirme o `agentsPath` no settings.json
3. Reinicie VS Code para carregar os agents

## 🎉 Exemplo Completo: Gerar Testes xUnit com Agents

1. Selecione uma classe C#
2. `Ctrl+L` para abrir chat
3. Prompt com agent:
```
@Codebase Use the testing-xunit skill to generate comprehensive xUnit tests for this repository class following these requirements:
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
- [ ] Extensão GitHub Copilot instalada
- [ ] Configurações copiadas para pasta correta
- [ ] Atalhos personalizados funcionando
- [ ] Extensões recomendadas instaladas

### ✅ GitHub Copilot Funcionando
- [ ] Login efetuado no GitHub Copilot
- [ ] Copilot respondendo ao "Hello"
- [ ] Autocomplete funcionando
- [ ] Comandos slash disponíveis

### ✅ Agents Configurados
- [ ] Pasta `agents/` copiada para o projeto
- [ ] Skills disponíveis no chat
- [ ] Contexto `@Codebase` funcionando com agents
- [ ] Prompts especializados respondendo

O GitHub Copilot com Agents especializados entenderá perfeitamente o contexto C#/.NET e gerará código profissional com as melhores práticas! 🚀
