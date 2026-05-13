# .NET Warning Correction

**Role:** Senior SRE Engineer

**Focus:** Quality, stability, and technical debt reduction

## Mission

Perform a comprehensive intervention in the specified repository to stabilize the build, achieve coverage goals, and apply high-level architectural patterns.

## 1. Scope and Context

- **Target Repository:** `{REPO_NAME}`
- **Stack:** .NET 8.0/10.0, xUnit.Net v2, MediatR, AutoMapper, EF Core
- **Source Branch:** `develop`

## 2. Mandatory Workflow

### Phase 1: Preparation and Environment

1. Clone the repository `{REPO_NAME}`
2. Create a working branch: `feature/{YYYYMMDD}-{function-name}}`
3. Ensure the variable `Environment.SetEnvironmentVariable("Testing", "true");` is used only within test execution context

### Phase 2: Analysis and Correction (Code & Warnings)

Systematically correct the following diagnostics and code smells:

|Category|Codes|Description|
|---|---|---|
|**Logging**|CA2017, S2629, CA2254|Static templates and placeholder consistency|
|**Asynchronism**|CS4014, CS1998|Await in async calls / Remove unnecessary async|
|**Cleanup**|CS0105, CS0219|Duplicate usings / Unused variables|
|**Exceptions**|S3445, S2139|Replace `throw ex;` with `throw;` / Context in rethrow|
|**Web/API**|ASP0019|Use `.Append` in headers|
|**Security**|NU1903|Resolve package vulnerabilities (High Priority)|
|**Documentation**|-|Add `/// <summary>` to all public classes and methods|

### Phase 3: Architecture and Style

Refactor code to strictly adhere to pillars:

#### SOLID

- Justify refactorings via **SRP** (Single Responsibility)
- Justify refactorings via **DIP** (Dependency Inversion)

#### DDD

- Identify and separate **Aggregates**, **Entities**, **Value Objects**, and **Repositories**

#### Clean Architecture

- Validate separation between **Domain**, **Application**, **Infrastructure**, and **Presentation**
- Domain must be isolated and independent of external frameworks

### Phase 4: Tests and Coverage

#### Execution

```bash
dotnet test --collect:"XPlat Code Coverage" --results-directory ./TestResults
```

#### Stabilization

- Fix existing failures before creating new tests
- Problematic infrastructure tests (e.g., JWT) can be removed if they require deep changes

#### BDD

New tests must follow the style: **Given, When, Then**

#### Goal

Achieve **90%** line and branch coverage using `dotnet-reportgenerator-globaltool`

## 3. Documentation and Delivery

### README.md

Update the file including:

- **Repository Structure:** Hierarchical tree with brief descriptions
- **Test Coverage:** Table with Total Tests, % Lines, and % Branches
- **Technical Stack:** List of technologies and components (DataDog, OpenTelemetry, etc)
- **Views:** "Business Vision" (strategic) and "Technical Vision" (architecture) sections

### CHANGELOG.md

- Follow **Keep a Changelog** and **Semantic Versioning (SemVer)** standards
- Analyze previous commits to consolidate history
- Link Changelog in README

### Finalization (Commits)

Use **Conventional Commits**:

- `feat:` - New features
- `fix:` - Bug fixes
- `test:` - Tests
- `docs:` - Documentation
- `refactor:` - Refactorings
- `chore:` - Maintenance tasks

**Restriction:** Do not open Pull Request automatically. Prepare the commit and generate a Detailed Technical Summary containing all changes so I can perform the manual opening.

---

**Status:** Awaiting task start. Analyze the repository and report the initial action plan.
