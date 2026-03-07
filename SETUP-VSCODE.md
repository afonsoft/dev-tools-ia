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

### 2.3 Importar Configuração Otimizada
Copie o conteúdo do arquivo `vscode-continue-config.json` deste repositório para seu `config.json`:

```json
{
  "models": [
    {
      "title": "Qwen 2.5 Coder 7B - RTX 2050 Optimized",
      "provider": "ollama",
      "model": "qwen2.5-coder:7b-instruct-q4_K_M",
      "contextLength": 4096,
      "temperature": 0.1,
      "topP": 0.9
    }
  ],
  "tabAutocompleteModel": {
    "title": "Qwen 2.5 Coder 7B - RTX 2050 Optimized",
    "provider": "ollama",
    "model": "qwen2.5-coder:7b-instruct-q4_K_M",
    "contextLength": 2048,
    "temperature": 0.0
  },
  "providerOptions": {
    "ollama": {
      "apiBase": "http://localhost:11434"
    }
  }
}
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
- `Ctrl+L`: Abrir chat
- `Ctrl+I`: Editar código selecionado
- `Ctrl+Shift+P`: "Continue: " para comandos especiais

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

O Qwen 2.5 Coder 7B entenderá perfeitamente o contexto C#/.NET e gerará testes profissionais!
