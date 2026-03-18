# 🤖 GEMINI.md - Comprehensive Guide for .NET Development with GitHub Copilot

## 🎯 Overview

This document serves as the central hub for all GitHub Copilot customizations, agents, skills, and rules specifically optimized for .NET, C#, and modern development practices with Gemini API integration.

## 📁 Structure

```
agents/
├── GEMINI.md                    # This master guide
├── skills/                      # Reusable skill packages
│   ├── dotnet-best-practices/
│   ├── csharp-async-patterns/
│   ├── entity-framework-core/
│   ├── aspnet-core-api/
│   ├── blazor-components/
│   ├── testing-xunit/
│   ├── design-patterns/
│   ├── security-jwt/
│   └── performance-optimization/
└── rules/                       # Project-specific instructions
    ├── csharp-coding-standards.md
    ├── dotnet-project-structure.md
    ├── api-design-guidelines.md
    ├── database-conventions.md
    └── git-workflow.md
```

## 🚀 Key Components

### 1. Skills (`.github/skills/`)

Self-contained folders with `SKILL.md` files that provide reusable capabilities for GitHub Copilot.

#### Available Skills:

**🏗️ Core Development Skills**
- `dotnet-best-practices`: Ensures code follows .NET conventions and best practices
- `csharp-async-patterns`: Best practices for asynchronous programming in C#
- `design-patterns`: Implementation of SOLID principles and Gang of Four patterns
- `entity-framework-core`: EF Core best practices and optimization techniques

**🌐 Web Development Skills**
- `aspnet-core-api`: RESTful API development with ASP.NET Core
- `blazor-components`: Modern Blazor component development
- `security-jwt`: JWT authentication and authorization patterns
- `api-design-guidelines`: RESTful API design principles

**🧪 Testing & Quality Skills**
- `testing-xunit`: Unit testing with xUnit and best practices
- `integration-testing`: Integration testing strategies
- `performance-optimization`: Performance profiling and optimization
- `code-review-automation`: Automated code review patterns

### 2. Rules (`.github/instructions/`)

Context-specific instructions that Copilot reads when working on matching files.

#### Available Rules:

**📝 Coding Standards**
- `csharp-coding-standards.md`: C# naming conventions and formatting
- `dotnet-project-structure.md`: Solution and project organization
- `api-design-guidelines.md`: RESTful API design principles

**🗄️ Data & Architecture**
- `database-conventions.md`: Database naming and design patterns
- `microservices-patterns.md`: Microservices architecture guidelines
- `domain-driven-design.md`: DDD implementation patterns

**🔄 Workflow & Process**
- `git-workflow.md`: Git branching and commit conventions
- `ci-cd-pipelines.md`: Azure DevOps/GitHub Actions patterns
- `documentation-standards.md`: XML documentation and README standards

## 🎯 Usage Instructions

### Activating Skills

Skills can be activated in several ways:

1. **Command Palette**: `Ctrl+Shift+P` → "Copilot: Use Skill"
2. **Chat Command**: `/skill <skill-name>` in Copilot Chat
3. **Auto-discovery**: Agents automatically discover relevant skills

### Applying Rules

Rules are automatically applied when working on matching files:

```bash
# Files matching these patterns will trigger rules:
**/*.cs          # C# coding standards
**/*.csproj      # Project structure rules
**/*.csx         # Script file conventions
**/Controllers/**.cs  # API design guidelines
**/Models/**.cs      # Entity conventions
```

## 🛠️ Configuration

### VS Code Settings

Ensure these settings are in your `settings.json`:

```json
{
  "github.copilot.chat.codeGeneration.useInstructionFiles": true,
  "github.copilot.chat.useProjectTemplates": true,
  "chat.promptFiles": true,
  "chat.promptFilesLocations": {
    ".github/prompts": true
  },
  "chat.modeFilesLocations": {
    ".github/agents": true
  },
  "chat.useAgentsMdFile": true,
  "chat.useNestedAgentsMdFiles": true
}
```

### Environment Setup

1. **Gemini API Configuration**: Ensure API key is configured in settings
2. **Project Structure**: Follow the documented folder structure
3. **Git Integration**: Enable GitLens and Copilot Git integration

## 📋 Best Practices

### For Skills Development

1. **Kebab-case naming**: Use hyphens in folder and skill names
2. **Clear descriptions**: Provide detailed when-to-use guidance
3. **Bundled assets**: Include templates and reference materials
4. **Step-by-step workflows**: Clear, actionable instructions
5. **Troubleshooting**: Common issues and solutions

### For Rules Creation

1. **Specific patterns**: Use precise glob patterns for `applyTo`
2. **Context-aware**: Rules should match file types and scenarios
3. **Concise instructions**: Clear, actionable guidance
4. **Examples**: Provide good and bad examples
5. **References**: Link to documentation and standards

## 🎨 Agent Integration

### Available Agents

1. **C# Expert**: General C# development and best practices
2. **.NET Upgrade**: Framework migration and modernization
3. **API Architect**: RESTful API design and implementation
4. **Database Expert**: EF Core and database design
5. **Testing Specialist**: Unit and integration testing strategies

### Agent Configuration

Agents are defined in `.github/agents/*.agent.md` files:

```yaml
---
name: C#/.NET Expert
description: Expert in modern C#/.NET development with Gemini API integration
model: gpt-4
tools: ["editor", "terminal", "git"]
mcp-servers:
  - name: filesystem
    command: npx
    args: ["-y", "@modelcontextprotocol/server-filesystem"]
---
```

## 🔧 Advanced Features

### MCP Server Integration

Leverage Model Context Protocol servers for enhanced capabilities:

- **Filesystem**: File operations and project structure
- **Git**: Version control and repository management
- **Database**: Database schema and migrations
- **Web**: HTTP requests and API testing

### Custom Prompts

Create reusable prompts in `.github/prompts/*.prompt.md`:

```markdown
---
name: generate-repository-pattern
description: Generate Repository pattern implementation for Entity Framework Core
---

Generate a complete Repository pattern implementation with:
- Generic repository interface
- Specific repository implementations
- Unit of Work pattern
- Async methods
- Error handling
- Unit tests
```

## 📊 Performance Optimization

### Gemini API Optimization

1. **Context management**: Use efficient context windows
2. **Token optimization**: Minimize token usage in prompts
3. **Caching strategies**: Cache common responses
4. **Batch operations**: Group similar requests

### Development Workflow

1. **Skill chaining**: Combine multiple skills for complex tasks
2. **Agent collaboration**: Use multiple agents for different aspects
3. **Progressive enhancement**: Start with basic, add complexity gradually
4. **Feedback loops**: Continuously refine based on results

## 🚨 Troubleshooting

### Common Issues

1. **Skills not discovered**: Check folder structure and naming
2. **Rules not applying**: Verify glob patterns and file matching
3. **Agent not responding**: Check MCP server configuration
4. **Performance issues**: Optimize prompts and context usage

### Debug Tools

1. **Copilot logs**: Check VS Code developer tools
2. **Skill testing**: Use command palette to test skills
3. **Rule validation**: Verify rule syntax and patterns
4. **Agent diagnostics**: Check agent configuration and tools

## 📚 References

### Official Documentation
- [GitHub Copilot Documentation](https://docs.github.com/en/copilot)
- [GitHub Copilot Chat](https://docs.github.com/en/copilot/copilot-chat)
- [GitHub Copilot Agents](https://docs.github.com/en/copilot/working-with-copilot/copilot-agents)

### Community Resources
- [Awesome Copilot](https://github.com/github/awesome-copilot)
- [Copilot Cookbook](https://github.com/copilot-cookbook/cookbook)
- [Copilot Skills Marketplace](https://github.com/marketplace?type=skills)

### .NET Specific Resources
- [.NET Documentation](https://docs.microsoft.com/en-us/dotnet/)
- [C# Programming Guide](https://docs.microsoft.com/en-us/dotnet/csharp/)
- [ASP.NET Core Documentation](https://docs.microsoft.com/en-us/aspnet/core/)

## 🔄 Maintenance

### Regular Updates

1. **Review skills**: Update with latest .NET features
2. **Validate rules**: Ensure patterns still apply
3. **Test agents**: Verify agent performance and accuracy
4. **Update documentation**: Keep this guide current

### Community Contributions

1. **Share skills**: Contribute to the community
2. **Report issues**: Help improve existing skills
3. **Suggest improvements**: Provide feedback and ideas
4. **Document patterns**: Share successful implementations

---

## 🎉 Getting Started

1. **Clone this repository** to your workspace
2. **Configure Gemini API** in your VS Code settings
3. **Explore skills** in the `agents/skills/` directory
4. **Apply rules** to your projects
5. **Create custom agents** for your specific needs

**Happy coding with Gemini AI and GitHub Copilot!** 🚀

---

*Last updated: 2026-03-17*  
*Version: 1.0.0*  
*Compatible with: GitHub Copilot Chat, VS Code, Windsurf*
