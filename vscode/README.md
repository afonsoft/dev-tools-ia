# 💻 VS Code - Configurações e Extensões

## 📋 Visão Geral

Este diretório contém as configurações, extensões e personalizações do Visual Studio Code otimizadas para desenvolvimento C#/.NET com integração de IA local.

## 📁 Estrutura do Diretório

```
vscode/
├── README.md                    # Este arquivo
├── settings/                    # Configurações do VS Code
│   ├── settings.json            # Configurações globais
│   ├── keybindings.json         # Atalhos personalizados
│   └── snippets/                # Code snippets personalizados
│       ├── csharp.json          # Snippets para C#
│       ├── docker.json          # Snippets para Docker
│       └── markdown.json         # Snippets para Markdown
├── extensions/                  # Extensões recomendadas
│   ├── recommendations.json      # Lista de extensões
│   └── marketplace/             # Extensões baixadas
├── themes/                      # Temas personalizados
│   ├── devtools-ia.json        # Tema customizado
│   └── icons/                   # Ícones customizados
├── launch/                      # Configurações de debug
│   ├── launch.json              # Configurações de launch
│   └── tasks.json               # Configurações de tasks
└── workspace/                   # Configurações de workspace
    ├── code-workspace           # Workspace compartilhado
    └── projects/                # Projetos específicos
```

## 🎯 Propósito

### O que é armazenado aqui:

1. **Configurações Globais**: Settings, keybindings, snippets
2. **Extensões**: Lista de extensões recomendadas e configurações
3. **Temas**: Personalização visual do ambiente
4. **Debug**: Configurações para depuração de aplicações
5. **Workspace**: Configurações específicas por projeto

### Por que este diretório é importante:

- **Consistência**: Mesma configuração entre diferentes máquinas
- **Produtividade**: Extensões e snippets otimizados para C#/.NET
- **Integração**: Configurações específicas para integração com IA
- **Backup**: Preservação de personalizações importantes

## 🔧 Configurações Principais

### settings.json (Configurações Globais)

```json
{
  // Editor
  "editor.fontSize": 14,
  "editor.fontFamily": "Fira Code, Consolas, 'Courier New', monospace",
  "editor.tabSize": 4,
  "editor.insertSpaces": true,
  "editor.wordWrap": "on",
  "editor.minimap.enabled": true,
  "editor.lineNumbers": "on",
  "editor.renderWhitespace": "selection",
  "editor.bracketPairColorization.enabled": true,
  "editor.guides.bracketPairs": true,
  "editor.suggest.snippetsPreventQuickSuggestions": false,
  "editor.formatOnSave": true,
  "editor.formatOnType": true,
  "editor.codeActionsOnSave": {
    "source.fixAll": "explicit",
    "source.organizeImports": "explicit"
  },

  // C# Específico
  "csharp.semanticHighlighting.enabled": true,
  "csharp.format.enable": true,
  "csharp.inlayHints.parameters.enabled": true,
  "csharp.inlayHints.parameters.forLiteralParameters": true,
  "csharp.inlayHints.parameters.forIndexerParameters": true,
  "csharp.inlayHints.parameters.forObjectCreationParameters": true,
  "csharp.inlayHints.parameters.forOtherParameters": true,
  "csharp.inlayHints.types.enabled": true,
  "csharp.inlayHints.types.forImplicitVariableTypes": true,
  "csharp.inlayHints.types.forLambdaParameterTypes": true,
  "csharp.inlayHints.types.forMethodParameterTypes": true,
  "[csharp]": {
    "editor.defaultFormatter": "ms-dotnettools.csharp",
    "editor.semanticTokenColorCustomizations": {
      "enabled": true,
      "rules": {
        "*.method": "#FFB86C",
        "*.type": "#8BE9FD",
        "*.namespace": "#BD93F9"
      }
    }
  },

  // Terminal
  "terminal.integrated.fontFamily": "Fira Code, Consolas, monospace",
  "terminal.integrated.fontSize": 14,
  "terminal.integrated.shell.windows": "C:\\Program Files\\PowerShell\\7\\pwsh.exe",

  // Files and Explorer
  "files.exclude": {
    "**/bin": true,
    "**/obj": true,
    "**/.vs": true,
    "**/.git": true,
    "**/node_modules": true,
    "**/packages": true
  },
  "files.watcherExclude": {
    "**/bin/**": true,
    "**/obj/**": true,
    "**/.vs/**": true
  },
  "explorer.fileNesting.enabled": true,
  "explorer.fileNesting.patterns": {
    "*.csproj": "$(capture).cs,$(capture).csproj,$(capture).Designer.cs,$(capture).resx,$(capture).Resources.Designer.cs,$(capture).settings.Designer.cs,$(capture).Editor.cs,$(capture).AssemblyInfo.cs,$(capture).xaml,$(capture).xaml.cs,$(capture).g.cs,$(capture).g.i.cs",
    "*.sln": "$(capture).sln,$(capture).DotSettings,$(capture).DotSettings.user",
    "*.config": "$(capture).config,$(capture).Debug.config,$(capture).Release.config"
  },

  // Git
  "git.enableSmartCommit": true,
  "git.autofetch": true,
  "git.confirmSync": false,
  "git.postCommitCommand": "none",
  "git.showInlineOpenFileAction": false,
  "git.suggestSmartCommit": false,

  // Workbench
  "workbench.colorTheme": "DevTools IA Dark",
  "workbench.iconTheme": "DevTools IA Icons",
  "workbench.startupEditor": "none",
  "workbench.editor.showTabs": true,
  "workbench.editor.limit.enabled": true,
  "workbench.editor.limit.value": 10,

  // Extensions
  "extensions.autoUpdate": false,
  "extensions.ignoreRecommendations": false,

  // Debug
  "debug.console.fontSize": 14,
  "debug.internalConsoleOptions": "neverOpen",

  // AI Integration
  "continue.model": "qwen2.5-coder:7b-instruct-q4_K_M",
  "continue.provider": "ollama",
  "continue.apiBase": "http://localhost:11434",
  "continue.contextLength": 4096,
  "continue.temperature": 0.1,
  "continue.enableCodeCompletion": true,
  "continue.enableTabAutocomplete": true,
  "continue.enableCodeLens": true,
  "continue.enableInlineComments": true,
  "continue.enableSlashCommands": true,
  "continue.enableWebSearch": false,

  // Security
  "security.workspace.trust.untrustedFiles": "open",
  "security.workspace.trust.enabled": true,

  // Telemetry
  "telemetry.enableTelemetry": false,
  "redhat.telemetry.enabled": false,

  // Other
  "update.mode": "manual",
  "workbench.enableExperiments": false,
  "npm.enableScriptExplorer": true,
  "typescript.updateImportsOnFileMove.enabled": "always"
}
```

### keybindings.json (Atalhos Personalizados)

```json
[
  // C# Development
  {
    "key": "ctrl+shift+c",
    "command": "dotnet.generateAsync",
    "when": "editorLangId == 'csharp'"
  },
  {
    "key": "ctrl+shift+t",
    "command": "dotnet.test.runTestsInContext",
    "when": "editorLangId == 'csharp'"
  },
  {
    "key": "ctrl+shift+d",
    "command": "dotnet.test.debugTestsInContext",
    "when": "editorLangId == 'csharp'"
  },
  {
    "key": "ctrl+shift+f",
    "command": "editor.action.formatDocument",
    "when": "editorTextFocus && !editorReadonly"
  },

  // Continue AI
  {
    "key": "ctrl+l",
    "command": "continue.quickChat",
    "when": "!inlineChatFocused"
  },
  {
    "key": "ctrl+i",
    "command": "continue.editWithInput",
    "when": "editorHasSelection"
  },
  {
    "key": "ctrl+shift+\\",
    "command": "continue.focusContinueInput",
    "when": "!inlineChatFocused"
  },

  // Terminal
  {
    "key": "ctrl+`",
    "command": "workbench.action.terminal.toggle"
  },
  {
    "key": "ctrl+shift+`",
    "command": "workbench.action.terminal.split"
  },

  // Explorer
  {
    "key": "ctrl+shift+e",
    "command": "workbench.view.explorer"
  },
  {
    "key": "ctrl+shift+p",
    "command": "workbench.action.showCommands"
  },

  // Debug
  {
    "key": "f5",
    "command": "workbench.action.debug.start",
    "when": "!inDebugMode && debuggersAvailable"
  },
  {
    "key": "f5",
    "command": "workbench.action.debug.continue",
    "when": "inDebugMode"
  },
  {
    "key": "shift+f5",
    "command": "workbench.action.debug.stop",
    "when": "inDebugMode"
  }
]
```

## 📦 Extensões Recomendadas

### recommendations.json

```json
{
  "recommendations": [
    // C# Development
    "ms-dotnettools.csharp",
    "ms-dotnettools.csdevkit",
    "ms-dotnettools.blazor",
    "ms-dotnettools.dotnet-interactive-vscode",
    "k--kato.docrunner",
    "formulahendry.dotnet-test-explorer",
    "ms-vscode.dotnet-runtime",

    // Web Development
    "ms-vscode.vscode-html-css-pack",
    "bradlc.vscode-tailwindcss",
    "formulahendry.auto-rename-tag",
    "formulahendry.auto-close-tag",
    "ms-vscode.vscode-json",

    // Docker
    "ms-azuretools.vscode-docker",
    "ms-vscode-remote.remote-containers",

    // Git
    "eamodio.gitlens",
    "github.vscode-pull-request-github",
    "github.vscode-github-actions",
    "donjayamanne.git-extension-pack",

    // Database
    "ms-mssql.mssql",
    "ms-vscode.vscode-sql-tools",
    "cweijan.vscode-redis-client",

    // AI & Code Completion
    "continue.continue",
    "github.copilot",
    "github.copilot-chat",
    "ms-vscode.intellicode-api-usage-examples",
    "visualstudioexptteam.vscodeintellicode",

    // Productivity
    "esbenp.prettier-vscode",
    "dbaeumer.vscode-eslint",
    "editorconfig.editorconfig",
    "ms-vscode.vscode-markdownlint",
    "streetsidesoftware.code-spell-checker",
    "gruntfuggly.todo-tree",
    "christian-kohler.path-intellisense",
    "ms-vscode.vscode-powershell",

    // Themes & Icons
    "pkief.material-icon-theme",
    "ms-vscode.theme-tomorrow-night-blue",
    "zhuangtongfa.material-theme",
    "dracula-theme.theme-dracula",

    // Utilities
    "ms-vscode.live-server",
    "humao.rest-client",
    "ms-vscode.vscode-yaml",
    "redhat.vscode-yaml",
    "ms-vscode.vscode-xml",
    "shd101wyy.markdown-preview-enhanced",
    "yzhang.markdown-all-in-one",

    // Testing
    "formulahendry.dotnet-test-explorer",
    "hbenl.vscode-test-explorer",
    "ms-vscode.test-adapter-converter",

    // Performance
    "wakatime.vscode-wakatime",
    "gruntfuggly.todo-tree"
  ]
}
```

## 🎨 Temas e Personalização

### DevTools IA Dark Theme

```json
{
  "name": "DevTools IA Dark",
  "type": "vscode",
  "colors": {
    "editor.background": "#1e1e1e",
    "editor.foreground": "#d4d4d4",
    "editor.lineHighlightBackground": "#2d2d30",
    "editor.selectionBackground": "#264f78",
    "editor.inactiveSelectionBackground": "#3a3d41",
    "editorCursor.foreground": "#aeafad",
    "editorWhitespace.foreground": "#404040",
    "editorIndentGuide.background": "#404040",
    "editorIndentGuide.activeBackground": "#707070",
    "editorRuler.foreground": "#333333",
    "editorCodeLens.foreground": "#999999",
    "editorBracketMatch.background": "#006400",
    "editorBracketMatch.border": "#888888",
    "editorOverviewRuler.border": "#333333",
    "editorOverviewRuler.findMatchForeground": "#7c7c7c",
    "editorOverviewRuler.rangeHighlightForeground": "#7c7c7c",
    "editorError.foreground": "#f48771",
    "editorWarning.foreground": "#cca700",
    "editorInfo.foreground": "#75beff",
    "editorGutter.background": "#1e1e1e",
    "sideBar.background": "#252526",
    "sideBar.foreground": "#cccccc",
    "sideBarTitle.foreground": "#bbbbbb",
    "sideBarSectionHeader.background": "#333333",
    "sideBarSectionHeader.foreground": "#cccccc",
    "activityBar.background": "#333333",
    "activityBar.foreground": "#ffffff",
    "activityBarBadge.background": "#007acc",
    "activityBarBadge.foreground": "#ffffff",
    "titleBar.activeBackground": "#1e1e1e",
    "titleBar.activeForeground": "#cccccc",
    "titleBar.inactiveBackground": "#2d2d30",
    "titleBar.inactiveForeground": "#cccccc",
    "statusBar.background": "#007acc",
    "statusBar.foreground": "#ffffff",
    "statusBar.noFolderBackground": "#68217a",
    "statusBar.debuggingBackground": "#cc6633",
    "statusBarItem.hoverBackground": "#1a1a1a",
    "statusBarItem.remoteBackground": "#68217a",
    "tab.activeBackground": "#1e1e1e",
    "tab.activeForeground": "#ffffff",
    "tab.inactiveBackground": "#2d2d30",
    "tab.inactiveForeground": "#cccccc",
    "tab.unfocusedActiveBackground": "#1e1e1e",
    "tab.unfocusedActiveForeground": "#ffffff",
    "tab.unfocusedInactiveBackground": "#2d2d30",
    "tab.unfocusedInactiveForeground": "#cccccc",
    "tab.border": "#1e1e1e",
    "editorGroupHeader.tabsBackground": "#252526",
    "editorGroupHeader.tabsBorder": "#1e1e1e",
    "panel.background": "#1e1e1e",
    "panel.border": "#808080",
    "panelTitle.activeBorder": "#808080",
    "panelTitle.activeForeground": "#e7e7e7",
    "panelTitle.inactiveForeground": "#e7e7e7",
    "panel.border": "#80808033",
    "dropdown.background": "#3c3c3c",
    "dropdown.foreground": "#cccccc",
    "input.background": "#3c3c3c",
    "input.foreground": "#cccccc",
    "input.border": "#3c3c3c",
    "input.placeholderForeground": "#cccccc80",
    "inputValidation.errorBackground": "#5a0000",
    "inputValidation.errorBorder": "#be1100",
    "button.background": "#0e639c",
    "button.foreground": "#ffffff",
    "button.hoverBackground": "#1177bb",
    "checkbox.background": "#3c3c3c",
    "checkbox.foreground": "#f0f0f0",
    "checkbox.border": "#6a6a6a",
    "dropdown.border": "#3c3c3c",
    "list.activeSelectionBackground": "#094771",
    "list.activeSelectionForeground": "#ffffff",
    "list.hoverBackground": "#2a2d2e",
    "list.focusBackground": "#062f4a",
    "list.inactiveSelectionBackground": "#323334",
    "list.inactiveSelectionForeground": "#cccccc",
    "tree.indentGuidesStroke": "#a0a0a0",
    "scrollbar.shadow": "#000000",
    "scrollbarSlider.activeBackground": "#bfbfbf",
    "scrollbarSlider.background": "#797979",
    "scrollbarSlider.hoverBackground": "#646464",
    "progressBar.background": "#0e70c0",
    "widget.shadow": "#0000005c",
    "selection.background": "#264f78"
  },
  "tokenColors": [
    {
      "name": "Comments",
      "scope": ["comment", "punctuation.definition.comment"],
      "settings": {
        "foreground": "#6A9955"
      }
    },
    {
      "name": "Variables",
      "scope": ["variable", "string constant.other.placeholder"],
      "settings": {
        "foreground": "#9CDCFE"
      }
    },
    {
      "name": "Colors",
      "scope": ["constant.other.color"],
      "settings": {
        "foreground": "#569cd6"
      }
    },
    {
      "name": "Invalid",
      "scope": ["invalid", "invalid.illegal"],
      "settings": {
        "foreground": "#f44747"
      }
    },
    {
      "name": "Keyword, Storage",
      "scope": ["keyword", "storage.type", "storage.modifier"],
      "settings": {
        "foreground": "#569cd6"
      }
    },
    {
      "name": "Operator, Misc",
      "scope": [
        "keyword.control",
        "keyword.other",
        "punctuation",
        "punctuation.definition.tag",
        "punctuation.separator.inheritance.php",
        "punctuation.definition.tag.html",
        "punctuation.definition.tag.begin.html",
        "punctuation.definition.tag.end.html",
        "punctuation.section.embedded",
        "keyword.other.template",
        "keyword.other.substitution"
      ],
      "settings": {
        "foreground": "#d4d4d4"
      }
    },
    {
      "name": "Tag",
      "scope": [
        "entity.name.tag",
        "meta.tag.sgml",
        "markup.deleted.git_gutter"
      ],
      "settings": {
        "foreground": "#569cd6"
      }
    },
    {
      "name": "Function, Special Method",
      "scope": [
        "entity.name.function",
        "meta.function-call",
        "variable.function",
        "support.function",
        "keyword.other.special-method"
      ],
      "settings": {
        "foreground": "#dcdcaa"
      }
    },
    {
      "name": "Block Level Variables",
      "scope": ["variable.other"],
      "settings": {
        "foreground": "#9CDCFE"
      }
    },
    {
      "name": "Other Variable, String Link",
      "scope": ["support.other.variable.use", "string.other.link"],
      "settings": {
        "foreground": "#9CDCFE"
      }
    },
    {
      "name": "Number, Constant, Function Argument, Tag Attribute, Embedded",
      "scope": [
        "constant.numeric",
        "constant.language",
        "support.constant",
        "constant.character",
        "constant.escape",
        "variable.parameter",
        "keyword.other.unit",
        "keyword.other"
      ],
      "settings": {
        "foreground": "#b5cea8"
      }
    },
    {
      "name": "String, Symbols, Inherited Class, Markup Heading",
      "scope": [
        "string",
        "constant.other.symbol",
        "constant.other.key",
        "entity.other.inherited-class",
        "markup.heading",
        "markup.inserted.git_gutter"
      ],
      "settings": {
        "foreground": "#ce9178"
      }
    },
    {
      "name": "Class, Support",
      "scope": [
        "entity.name.class",
        "entity.name.type.class",
        "support.type",
        "support.class",
        "support.other.namespace.use.php",
        "meta.use.php",
        "support.other.namespace.php",
        "markup.changed.git_gutter",
        "support.type.sys-types"
      ],
      "settings": {
        "foreground": "#4ec9b0"
      }
    },
    {
      "name": "Entity Types",
      "scope": ["entity.name.type"],
      "settings": {
        "foreground": "#4ec9b0"
      }
    },
    {
      "name": "CSS Class and Support",
      "scope": [
        "entity.other.attribute-name.class",
        "entity.other.attribute-name.id",
        "support.type.property-name",
        "support.type.property-name.json",
        "support.type.property-name.yaml",
        "support.type.property-name.toml"
      ],
      "settings": {
        "foreground": "#d7ba7d"
      }
    },
    {
      "name": "Sub-methods",
      "scope": [
        "entity.name.module.js",
        "variable.import.parameter.js",
        "variable.other.class.js"
      ],
      "settings": {
        "foreground": "#9CDCFE"
      }
    },
    {
      "name": "Language methods",
      "scope": ["variable.language"],
      "settings": {
        "fontStyle": "italic",
        "foreground": "#9CDCFE"
      }
    },
    {
      "name": "entity.name.method.js",
      "scope": ["entity.name.method.js"],
      "settings": {
        "fontStyle": "italic",
        "foreground": "#dcdcaa"
      }
    },
    {
      "name": "meta.method.js",
      "scope": [
        "meta.class-method.js",
        "meta.method.object.js",
        "meta.method.instance.js"
      ],
      "settings": {
        "fontStyle": "italic",
        "foreground": "#dcdcaa"
      }
    },
    {
      "name": "attributes",
      "scope": ["entity.other.attribute-name"],
      "settings": {
        "foreground": "#92c5f8"
      }
    },
    {
      "name": "CSS Attributes",
      "scope": [
        "support.type.property-name.css",
        "support.type.property-name.scss",
        "support.type.property-name.less"
      ],
      "settings": {
        "foreground": "#9cdcfe"
      }
    },
    {
      "name": "Regex",
      "scope": ["string.regexp"],
      "settings": {
        "foreground": "#d16969"
      }
    },
    {
      "name": "Escape Characters",
      "scope": ["constant.character.escape"],
      "settings": {
        "foreground": "#d7ba7d"
      }
    },
    {
      "name": "Related URLs",
      "scope": ["*url*", "*link*", "*uri*"],
      "settings": {
        "fontStyle": "underline"
      }
    },
    {
      "name": "Decorators",
      "scope": [
        "tag.decorator.js",
        "annotation.decorator.js",
        "tag.decorator.ts",
        "annotation.decorator.ts"
      ],
      "settings": {
        "fontStyle": "italic",
        "foreground": "#9cdcfe"
      }
    },
    {
      "name": "ES7 Bind Operator",
      "scope": ["source.js#function-call"],
      "settings": {
        "foreground": "#dcdcaa"
      }
    },
    {
      "name": "JSON Key - Level 0",
      "scope": ["source.json meta.structure.dictionary.json string.quoted.double.json"],
      "settings": {
        "foreground": "#9cdcfe"
      }
    },
    {
      "name": "JSON Key - Level 1",
      "scope": ["source.json meta.structure.dictionary.json meta.structure.dictionary.value.json string.quoted.double.json"],
      "settings": {
        "foreground": "#9cdcfe"
      }
    },
    {
      "name": "JSON Key - Level 2",
      "scope": [
        "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json string.quoted.double.json"
      ],
      "settings": {
        "foreground": "#9cdcfe"
      }
    },
    {
      "name": "JSON Key - Level 3+",
      "scope": [
        "source.json meta.structure.dictionary.json meta.structure.dictionary.value.json meta.structure.dictionary.json meta.structure.dictionary.json* string.quoted.double.json"
      ],
      "settings": {
        "foreground": "#9cdcfe"
      }
    }
  ]
}
```

## 🚀 Snippets Personalizados

### csharp.json (Snippets para C#)

```json
{
  "Create Controller": {
    "prefix": "controller",
    "body": [
      "using Microsoft.AspNetCore.Mvc;",
      "using Microsoft.AspNetCore.Authorization;",
      "",
      "namespace ${1:ProjectName}.Controllers",
      "{",
      "    [ApiController]",
      "    [Route(\"api/[controller]\")]",
      "    [Authorize]",
      "    public class ${2:ControllerName}Controller : ControllerBase",
      "    {",
      "        private readonly I${3:ServiceName}Service _${4:serviceName}Service;",
      "",
      "        public ${2:ControllerName}Controller(I${3:ServiceName}Service ${4:serviceName}Service)",
      "        {",
      "            _${4:serviceName}Service = ${4:serviceName}Service;",
      "        }",
      "",
      "        [HttpGet]",
      "        public async Task<IActionResult> GetAll()",
      "        {",
      "            var result = await _${4:serviceName}Service.GetAllAsync();",
      "            return Ok(result);",
      "        }",
      "",
      "        [HttpGet(\"{id}\")]",
      "        public async Task<IActionResult> GetById(int id)",
      "        {",
      "            var result = await _${4:serviceName}Service.GetByIdAsync(id);",
      "            return Ok(result);",
      "        }",
      "",
      "        [HttpPost]",
      "        public async Task<IActionResult> Create([FromBody] ${5:ModelName}Dto dto)",
      "        {",
      "            var result = await _${4:serviceName}Service.CreateAsync(dto);",
      "            return CreatedAtAction(nameof(GetById), new { id = result.Id }, result);",
      "        }",
      "",
      "        [HttpPut(\"{id}\")]",
      "        public async Task<IActionResult> Update(int id, [FromBody] ${5:ModelName}Dto dto)",
      "        {",
      "            var result = await _${4:serviceName}Service.UpdateAsync(id, dto);",
      "            return Ok(result);",
      "        }",
      "",
      "        [HttpDelete(\"{id}\")]",
      "        public async Task<IActionResult> Delete(int id)",
      "        {",
      "            await _${4:serviceName}Service.DeleteAsync(id);",
      "            return NoContent();",
      "        }",
      "    }",
      "}"
    ],
    "description": "Create a complete ASP.NET Core controller"
  },
  "Create Repository": {
    "prefix": "repository",
    "body": [
      "using ${1:ProjectName}.Core.Entities;",
      "using ${1:ProjectName}.Core.Interfaces;",
      "using Microsoft.EntityFrameworkCore;",
      "using System.Linq.Expressions;",
      "",
      "namespace ${1:ProjectName}.Infrastructure.Data",
      "{",
      "    public class ${2:EntityName}Repository : I${2:EntityName}Repository",
      "    {",
      "        private readonly AppDbContext _context;",
      "",
      "        public ${2:EntityName}Repository(AppDbContext context)",
      "        {",
      "            _context = context;",
      "        }",
      "",
      "        public async Task<${2:EntityName}> GetByIdAsync(int id)",
      "        {",
      "            return await _context.${3:tableName}.FindAsync(id);",
      "        }",
      "",
      "        public async Task<IEnumerable<${2:EntityName}>> GetAllAsync()",
      "        {",
      "            return await _context.${3:tableName}.ToListAsync();",
      "        }",
      "",
      "        public async Task<IEnumerable<${2:EntityName}>> FindAsync(Expression<Func<${2:EntityName}, bool>> predicate)",
      "        {",
      "            return await _context.${3:tableName}.Where(predicate).ToListAsync();",
      "        }",
      "",
      "        public async Task<${2:EntityName}> AddAsync(${2:EntityName} entity)",
      "        {",
      "            await _context.${3:tableName}.AddAsync(entity);",
      "            await _context.SaveChangesAsync();",
      "            return entity;",
      "        }",
      "",
      "        public async Task UpdateAsync(${2:EntityName} entity)",
      "        {",
      "            _context.${3:tableName}.Update(entity);",
      "            await _context.SaveChangesAsync();",
      "        }",
      "",
      "        public async Task DeleteAsync(${2:EntityName} entity)",
      "        {",
      "            _context.${3:tableName}.Remove(entity);",
      "            await _context.SaveChangesAsync();",
      "        }",
      "    }",
      "}"
    ],
    "description": "Create a repository pattern implementation"
  },
  "Create Unit Test": {
    "prefix": "test",
    "body": [
      "using Xunit;",
      "using Moq;",
      "using ${1:ProjectName}.Core.Entities;",
      "using ${1:ProjectName}.Core.Services;",
      "using ${1:ProjectName}.Core.Interfaces;",
      "",
      "namespace ${1:ProjectName}.Tests.Unit.Services",
      "{",
      "    public class ${2:ServiceName}Tests",
      "    {",
      "        private readonly Mock<I${3:RepositoryName}Repository> _${4:repositoryName}RepositoryMock;",
      "        private readonly ${2:ServiceName} _${5:serviceName}Service;",
      "",
      "        public ${2:ServiceName}Tests()",
      "        {",
      "            _${4:repositoryName}RepositoryMock = new Mock<I${3:RepositoryName}Repository>();",
      "            _${5:serviceName}Service = new ${2:ServiceName}(_${4:repositoryName}RepositoryMock.Object);",
      "        }",
      "",
      "        [Fact]",
      "        public async Task GetById_WithValidId_ReturnsEntity()",
      "        {",
      "            // Arrange",
      "            var entityId = 1;",
      "            var expectedEntity = new ${6:EntityName} { Id = entityId, Name = \"Test\" };",
      "            ",
      "            _${4:repositoryName}RepositoryMock",
      "                .Setup(x => x.GetByIdAsync(entityId))",
      "                .ReturnsAsync(expectedEntity);",
      "",
      "            // Act",
      "            var result = await _${5:serviceName}Service.GetByIdAsync(entityId);",
      "",
      "            // Assert",
      "            result.Should().NotBeNull();",
      "            result.Id.Should().Be(entityId);",
      "            result.Name.Should().Be(\"Test\");",
      "            _${4:repositoryName}RepositoryMock.Verify(x => x.GetByIdAsync(entityId), Times.Once);",
      "        }",
      "",
      "        [Fact]",
      "        public async Task GetById_WithInvalidId_ReturnsNull()",
      "        {",
      "            // Arrange",
      "            var invalidId = 999;",
      "            ",
      "            _${4:repositoryName}RepositoryMock",
      "                .Setup(x => x.GetByIdAsync(invalidId))",
      "                .ReturnsAsync((${6:EntityName})null);",
      "",
      "            // Act",
      "            var result = await _${5:serviceName}Service.GetByIdAsync(invalidId);",
      "",
      "            // Assert",
      "            result.Should().BeNull();",
      "            _${4:repositoryName}RepositoryMock.Verify(x => x.GetByIdAsync(invalidId), Times.Once);",
      "        }",
      "    }",
      "}"
    ],
    "description": "Create xUnit test with Arrange-Act-Assert pattern"
  }
}
```

## 🔧 Configurações de Debug

### launch.json

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": ".NET Core Launch (web)",
      "type": "coreclr",
      "request": "launch",
      "preLaunchTask": "build",
      "program": "${workspaceFolder}/src/${workspaceFolderBasename}.dll",
      "args": [],
      "cwd": "${workspaceFolder}",
      "stopAtEntry": false,
      "serverReadyAction": {
        "action": "openExternally",
        "pattern": "\\bNow listening on:\\s+(https?://\\S+)"
      },
      "env": {
        "ASPNETCORE_ENVIRONMENT": "Development"
      },
      "sourceFileMap": {
        "/Views": "${workspaceFolder}/Views"
      }
    },
    {
      "name": ".NET Core Attach",
      "type": "coreclr",
      "request": "attach"
    },
    {
      "name": "Docker .NET Core Launch",
      "type": "docker-coreclr",
      "request": "launch",
      "preLaunchTask": "docker-run: debug",
      "platform": "linux",
      "containerName": "devtools-ia",
      "sourceFileMap": {
        "/app": "${workspaceFolder}"
      }
    },
    {
      "name": "Docker .NET Core Attach",
      "type": "docker-coreclr",
      "request": "attach",
      "platform": "linux",
      "containerName": "devtools-ia",
      "sourceFileMap": {
        "/app": "${workspaceFolder}"
      }
    }
  ]
}
```

### tasks.json

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "build",
      "command": "dotnet",
      "type": "process",
      "args": [
        "build",
        "${workspaceFolder}/src/${workspaceFolderBasename}.csproj",
        "/property:GenerateFullPaths=true",
        "/consoleloggerparameters:NoSummary"
      ],
      "group": "build",
      "presentation": {
        "reveal": "silent"
      },
      "problemMatcher": "$msCompile"
    },
    {
      "label": "publish",
      "command": "dotnet",
      "type": "process",
      "args": [
        "publish",
        "${workspaceFolder}/src/${workspaceFolderBasename}.csproj",
        "/property:GenerateFullPaths=true",
        "/consoleloggerparameters:NoSummary"
      ],
      "group": "build",
      "presentation": {
        "reveal": "always"
      },
      "problemMatcher": "$msCompile"
    },
    {
      "label": "test",
      "command": "dotnet",
      "type": "process",
      "args": [
        "test",
        "${workspaceFolder}/tests/${workspaceFolderBasename}.Tests.csproj",
        "/property:GenerateFullPaths=true",
        "/consoleloggerparameters:NoSummary"
      ],
      "group": "test",
      "presentation": {
        "reveal": "always"
      },
      "problemMatcher": "$msCompile"
    },
    {
      "label": "docker-run: debug",
      "dependsOn": ["docker-build"],
      "type": "docker-run",
      "dockerRun": {
        "image": "devtools-ia:latest",
        "containerName": "devtools-ia",
        "env": {
          "ASPNETCORE_ENVIRONMENT": "Development"
        },
        "ports": {
          "5000": "5000",
          "5001": "5001"
        }
      }
    },
    {
      "label": "docker-build",
      "type": "docker-build",
      "dockerBuild": {
        "dockerfile": "${workspaceFolder}/Dockerfile",
        "context": "${workspaceFolder}",
        "tag": "devtools-ia:latest"
      }
    }
  ]
}
```

## 📚 Integração com Continue

### Configuração do Continue

```json
{
  "models": [
    {
      "title": "Qwen 2.5 Coder 7B - RTX 2050",
      "provider": "ollama",
      "model": "qwen2.5-coder:7b-instruct-q4_K_M",
      "apiBase": "http://localhost:11434",
      "contextLength": 4096,
      "temperature": 0.1,
      "maxTokens": 2048,
      "systemPrompt": "You are an expert C#/.NET developer. Focus on clean code, SOLID principles, and best practices. Always provide working, tested code examples."
    },
    {
      "title": "Qwen 2.5 - General",
      "provider": "ollama",
      "model": "qwen2.5:7b-instruct",
      "apiBase": "http://localhost:11434",
      "contextLength": 8192,
      "temperature": 0.2,
      "maxTokens": 4096,
      "systemPrompt": "You are a helpful AI assistant specialized in software development and documentation."
    }
  ],
  "tabAutocompleteModel": {
    "title": "Qwen 2.5 Coder 7B - Autocomplete",
    "provider": "ollama",
    "model": "qwen2.5-coder:7b-instruct-q4_K_M",
    "apiBase": "http://localhost:11434",
    "contextLength": 2048,
    "temperature": 0.1,
    "maxTokens": 256
  },
  "enableCodeCompletion": true,
  "enableTabAutocomplete": true,
  "enableCodeLens": true,
  "enableInlineComments": true,
  "enableSlashCommands": true,
  "enableWebSearch": false,
  "customCommands": [
    {
      "name": "refactor",
      "description": "Refactor code following SOLID principles",
      "prompt": "Refactor this code following SOLID principles and C# best practices. Explain your changes and provide the refactored code."
    },
    {
      "name": "test",
      "description": "Generate unit tests using xUnit and Moq",
      "prompt": "Generate comprehensive unit tests for this code using xUnit, Moq, and Arrange-Act-Assert pattern. Include edge cases and error scenarios."
    },
    {
      "name": "document",
      "description": "Generate XML documentation",
      "prompt": "Generate comprehensive XML documentation for this code following Microsoft standards. Include parameter descriptions, return value documentation, and examples."
    },
    {
      "name": "optimize",
      "description": "Optimize code for performance",
      "prompt": "Optimize this code for better performance. Identify bottlenecks and suggest improvements. Consider async/await patterns, LINQ optimization, and memory management."
    }
  ]
}
```

## 🛠️ Scripts de Setup

### setup-vscode.sh

```bash
#!/bin/bash
# setup-vscode.sh

echo "💻 Configurando VS Code para DevTools IA"

# Instalar extensões recomendadas
echo "📦 Instalando extensões..."
code --install-extension ms-dotnettools.csharp
code --install-extension ms-dotnettools.csdevkit
code --install-extension continue.continue
code --install-extension eamodio.gitlens
code --install-extension ms-vscode.vscode-docker
code --install-extension esbenp.prettier-vscode
code --install-extension pkief.material-icon-theme

# Criar diretórios de configuração
mkdir -p ~/.vscode/settings
mkdir -p ~/.vscode/snippets
mkdir -p ~/.vscode/themes

# Copiar configurações
cp vscode/settings/settings.json ~/.vscode/settings/
cp vscode/settings/keybindings.json ~/.vscode/settings/
cp vscode/settings/snippets/csharp.json ~/.vscode/snippets/

# Configurar workspace
if [ ! -f "dev-tools-ia.code-workspace" ]; then
    cat > dev-tools-ia.code-workspace << 'EOF'
{
    "name": "DevTools IA",
    "folders": [
        {
            "path": "."
        }
    ],
    "settings": {
        "continue.model": "qwen2.5-coder:7b-instruct-q4_K_M",
        "continue.provider": "ollama",
        "continue.apiBase": "http://localhost:11434",
        "continue.contextLength": 4096,
        "continue.temperature": 0.1
    },
    "extensions": {
        "recommendations": [
            "ms-dotnettools.csharp",
            "ms-dotnettools.csdevkit",
            "continue.continue",
            "eamodio.gitlens",
            "ms-vscode.vscode-docker"
        ]
    }
}
EOF
fi

echo "✅ VS Code configurado com sucesso!"
echo "📂 Abra o workspace: code dev-tools-ia.code-workspace"
```

## 📈 Performance e Otimização

### Configurações de Performance

```json
{
  "editor.semanticTokenColorCustomizations.enabled": true,
  "editor.stickyScroll.enabled": true,
  "editor.suggest.showStatusBar": true,
  "editor.suggest.preview": true,
  "editor.suggestSelection": "first",
  "editor.quickSuggestions": {
    "comments": "on",
    "strings": "on",
    "other": "on"
  },
  "editor.acceptSuggestionOnCommitCharacter": true,
  "editor.acceptSuggestionOnEnter": "on",
  "editor.suggest.snippetsPreventQuickSuggestions": false,
  "editor.wordBasedSuggestions": true,
  "editor.parameterHints.enabled": true,
  "editor.hover.enabled": true,
  "editor.lightbulb.enabled": true,
  "editor.codeLens": true,
  "files.watcherExclude": {
    "**/.git/objects/**": true,
    "**/.git/subtree-cache/**": true,
    "**/node_modules/**": true,
    "**/.hg/store/**": true,
    "**/bower_components/**": true
  },
  "search.exclude": {
    "**/node_modules": true,
    "**/bower_components": true,
    "**/coverage": true,
    "**/.git": true,
    "**/svn": true,
    "**/.hg": true,
    "**/CVS": true,
    "**/.DS_Store": true,
    "**/Thumbs.db": true,
    "**/bin": true,
    "**/obj": true
  }
}
```

## 📝 Troubleshooting

### Problemas Comuns

1. **Continue não conecta ao Ollama**
   ```bash
   # Verificar se Ollama está rodando
   docker ps | grep ollama
   
   # Testar conexão
   curl http://localhost:11434/api/tags
   
   # Verificar configuração do Continue
   cat ~/.continue/config.json
   ```

2. **Extensões não carregam**
   ```bash
   # Listar extensões instaladas
   code --list-extensions
   
   # Reinstalar extensão problemática
   code --uninstall-extension extension-name
   code --install-extension extension-name
   ```

3. **IntelliSense não funciona**
   ```bash
   # Verificar se .NET SDK está instalado
   dotnet --version
   
   # Limpar cache do VS Code
   rm -rf ~/.vscode/extensions/.obsolete
   ```

4. **Debug não funciona**
   ```bash
   # Verificar configuração de launch
   cat .vscode/launch.json
   
   # Verificar se projeto compila
   dotnet build
   ```

## 📚 Documentação Adicional

- [Continue Documentation](https://docs.continue.dev/)
- [VS Code C# Extension](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp)
- [Docker Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
- [GitLens Documentation](https://gitlens.amod.io/)

---

**Importante**: Mantenha suas configurações sincronizadas entre diferentes máquinas usando o VS Code Settings Sync ou armazenando-as em um repositório Git privado.
