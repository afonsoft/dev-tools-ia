# Correção de Warning .NET

**Role:** Engenheiro SRE Sênior

**Foco:** Qualidade, estabilidade e redução de dívida técnica

## Missão

Realizar uma intervenção completa no repositório especificado para estabilizar o build, atingir metas de cobertura e aplicar padrões arquiteturais de alto nível.

## 1. Escopo e Contexto

- **Repositório Alvo:** `{REPO_NAME}`
- **Stack:** .NET 8.0/10.0, xUnit.Net v2, MediatR, AutoMapper, EF Core
- **Branch de Origem:** `develop`

## 2. Fluxo de Trabalho Obrigatório

### Fase 1: Preparação e Ambiente

1. Clone o repositório `{REPO_NAME}`
2. Crie uma branch de trabalho: `feature/{YYYYMMDD}-{function-name}}`
3. Garanta que a variável `Environment.SetEnvironmentVariable("Testing", "true");` seja utilizada apenas dentro do contexto de execução de testes

### Fase 2: Análise e Correção (Código & Warnings)

Corrija sistematicamente os seguintes diagnósticos e code smells:

|Categoria|Códigos|Descrição|
|---|---|---|
|**Logging**|CA2017, S2629, CA2254|Templates estáticos e consistência de placeholders|
|**Assincronismo**|CS4014, CS1998|Await em chamadas async / Remover async desnecessário|
|**Limpeza**|CS0105, CS0219|Usings duplicados / Variáveis não utilizadas|
|**Exceções**|S3445, S2139|Substituir `throw ex;` por `throw;` / Contexto no rethrow|
|**Web/API**|ASP0019|Usar `.Append` em headers|
|**Segurança**|NU1903|Resolver vulnerabilidades de pacotes (Prioridade Alta)|
|**Documentação**|-|Adicionar `/// <summary>` em todas as classes e métodos públicos|

### Fase 3: Arquitetura e Estilo

Refatore o código para aderir estritamente aos pilares:

#### SOLID

- Justifique refatorações via **SRP** (Single Responsibility)
- Justifique refatorações via **DIP** (Dependency Inversion)

#### DDD

- Identifique e separe **Aggregates**, **Entities**, **Value Objects** e **Repositories**

#### Clean Architecture

- Valide a separação entre **Domain**, **Application**, **Infrastructure** e **Presentation**
- O Domínio deve ser isolado e independente de frameworks externos

### Fase 4: Testes e Cobertura

#### Execução

```bash
dotnet test --collect:"XPlat Code Coverage" --results-directory ./TestResults
```

#### Estabilização

- Corrija falhas existentes antes de criar novos testes
- Testes problemáticos de infraestrutura (ex: JWT) podem ser removidos se exigirem mudanças profundas

#### BDD

Novos testes devem seguir o estilo: **Dado, Quando, Então**

#### Meta

Buscar **90%** de cobertura de linhas e branches usando o `dotnet-reportgenerator-globaltool`

## 3. Documentação e Entrega

### README.md

Atualize o arquivo incluindo:

- **Estrutura do Repositório:** Árvore hierárquica com descrições breves
- **Cobertura de Testes:** Tabela com Total de Testes, % de Linhas e % de Branches
- **Stack Técnica:** Listagem de tecnologias e componentes (DataDog, OpenTelemetry, etc)
- **Visões:** Seção "Visão de Negócio" (estratégico) e "Visão Técnica" (arquitetura)

### CHANGELOG.md

- Siga o padrão **Keep a Changelog** e **Versionamento Semântico (SemVer)**
- Analise os commits anteriores para consolidar o histórico
- Vincule o link do Changelog no README

### Finalização (Commits)

Utilize **Conventional Commits**:

- `feat:` - Novas funcionalidades
- `fix:` - Correções de bugs
- `test:` - Testes
- `docs:` - Documentação
- `refactor:` - Refatorações
- `chore:` - Tarefas de manutenção

**Restrição:** Não abra o Pull Request automaticamente. Prepare o commit e gere um Resumo Técnico Detalhado contendo todas as alterações para que eu possa realizar a abertura manual.

---

**Status:** Aguardando início da tarefa. Analise o repositório e reporte o plano de ação inicial.
