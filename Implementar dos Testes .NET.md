Objetivo:
	Atuar como engenheiro SRE com foco em qualidade e estabilidade de software.
	Sua missão é analisar e estabilizar o repositório .NET especificado abaixo:

Repositório: {REPO_NAME}


	Tarefas Obrigatórias:
 
	1. Criação de Branch:
	- Base: develop
	- Nome: feature/{timestamp}-{function-name}
	Exemplo: feature/20250730-ajuste-testes

	2. Testes Unitários:
	- Framework: xUnit.Net v2
	- Cobertura: dotnet-reportgenerator-globaltool
	- Estilo: BDD em português (Dado, Quando, Então)
	- Cobertura Alvo: ~90% (flexível em caso de limitações técnicas ou de tempo)

	Diretrizes:
	- Priorizar estabilização dos testes existentes.
	- Corrigir erros de build e falhas de testes antes de novos testes.
	- Validar todos os métodos e fluxos de uso dos componentes.
	- É aceitável remover testes problemáticos (ex: validação de JWT) se exigirem mudanças estruturais profundas.
	- A variável de ambiente 'Testing' só pode ser true nos testes:
		Environment.SetEnvironmentVariable("Testing", "true");

	Comando para cobertura:
		dotnet test --collect:"XPlat Code Coverage" --results-directory ./TestResults

	3. Atualização do README:
	Adicionar seção "Cobertura de Testes" com:

	- Total de Testes Executados
	- Cobertura de Linhas (%)
	- Cobertura de Branches (%)

	4. Changelog:
	- Analisar os commits do repositório.
	- Criar ou atualizar o CHANGELOG.md no formato Keep a Changelog
	- Seguir Versionamento Semântico
	- Adicionar link para o changelog no README.md

	5. Finalização:
	- Realizar commit com mensagem clara e técnica sobre os ajustes realizados.
	- Informar o conteúdo do commit para abertura manual do Pull Request.
	- Utilizar o token armazenado no segredo para autenticação, se necessário.

	Stack Tecnológica:
	- .NET Core 8.0: https://builds.dotnet.microsoft.com/dotnet/Sdk/8.0.412/dotnet-sdk-8.0.412-linux-x64.tar.gz
	- xUnit.Net v2: https://xunit.net/docs/getting-started/v2/getting-started
	- MediatR, AutoMapper, Entity Framework

	Regras de Estilo e Arquitetura

		SOLID
		- Aplicar os 5 princípios com exemplos reais em C#
		- Justificar decisões de design com base em responsabilidade única, inversão de dependência, etc.

		DDD (Domain-Driven Design)
		- Utilizar conceitos como Aggregate, Entity, Value Object, Repository
		- Separar domínios com clareza e aplicar lógica de negócio no núcleo

		Clean Architecture
		- Separação clara entre camadas: Domain, Application, Infrastructure, Presentation
		- Inversão de dependência entre camadas
		- Evitar acoplamento entre infraestrutura e domínio

		Padrões de Commit

		- Seguir o padrão Conventional Commits:
		- feat: nova funcionalidade
		- fix: correção de bug
		- docs: alterações na documentação
		- style: formatação, ponto e vírgula, etc.
		- refactor: refatoração de código
		- test: adição ou correção de testes
		- chore: tarefas de build ou configurações

		- Exemplo:
		feat(usuario): adicionar validação de e-mail no cadastro

	Restrições:
	- Não analisar nenhum outro repositório além do informado.
	- Não criar PR automaticamente. Apenas preparar o commit e relatar as mudanças.
