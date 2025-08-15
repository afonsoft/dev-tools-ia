Análise e Correção de Código C#/.NET
 
Objetivo
	Como engenheiro SRE, este agente de IA deve clonar e analisar o repositório `{REPO_NAME}` para:

	1. Corrigir *warnings* e *code smells*.
	2. Garantir que o projeto compila e os testes passam.
	3. Aplicar boas práticas de engenharia (SOLID, DDD, Clean Architecture).
	4. Preparar um commit e um resumo para abertura manual de Pull Request.

	Tarefas Técnicas
		Correções de *Warnings*

	Corrigir os seguintes avisos:
		- `CA2017`: Mismatch entre placeholders e parâmetros de log 
		🔗 https://learn.microsoft.com/dotnet/fundamentals/code-analysis/quality-rules/ca2017
		- `CS0105`: Diretiva `using` duplicada
		- `CS4014`: Chamada assíncrona não aguardada
		- `CS0219`: Variável não utilizada
		- `CS1998`: Método `async` sem `await`
		- `xUnit2003`: Não usar `Assert.Equal()` para verificar `null` 
		🔗 https://xunit.github.io/xunit.analyzers/rules/xUnit2003
		- `S2629`: Templates de log devem ser constantes 
		🔗 https://rules.sonarsource.com/csharp/RSPEC-2629
		- `CA2254`: Templates de log devem ser expressões estáticas 
		🔗 https://learn.microsoft.com/dotnet/fundamentals/code-analysis/quality-rules/ca2254
		- `S2139`: Exceções devem ser tratadas ou relançadas com contexto
		- `ASP0019`: Usar `IHeaderDictionary.Append` ao invés de `Add`
		- `S3445`: Evitar `throw ex;` — usar `throw;`
		- Adicionar `/// <summary>` nas classes públicas 
		🔗 https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/language-specification/documentation-comments

	Build e Testes
		- Garantir que o projeto compila com sucesso.
		- Executar todos os testes automatizados.
		- Corrigir falhas de build ou testes, se houver.

	Fluxo de Trabalho no Repositório
		1. Clonar o repositório `{REPO_NAME}` (usar token do segredo, se necessário).
		2. Criar branch a partir da `develop` com o padrão: 
		 `feature/20250730-ajustes-warnings`
		3. Realizar as correções e melhorias.
		4. Commitar seguindo o padrão de commits.
		5. Gerar um resumo técnico para abertura manual do Pull Request.

	Regras de Estilo e Arquitetura

	SOLID
	- Aplicar os 5 princípios com justificativas práticas.
	- Exemplo: SRP para separar validações de lógica de negócio.

	DDD
	- Utilizar: `Aggregate`, `Entity`, `Value Object`, `Repository`.
	- Domínio isolado da infraestrutura.

	Clean Architecture
	- Separação clara entre camadas:
	- `Domain`, `Application`, `Infrastructure`, `Presentation`
	- Inversão de dependência via interfaces.

	Padrão de Commits
	- Seguir [Conventional Commits](https://www.conventionalcommits.org/pt-br/v1.0.0/):
	- feat(usuario): adicionar validação de e-mail no cadastro
	- fix(auth): corrigir token expirado
	- docs(readme): atualizar instruções de instalação

	 
	Restrições
	- Não analisar nenhum outro repositório além do informado.
	- Não criar PR automaticamente. Apenas preparar o commit e relatar as mudanças.