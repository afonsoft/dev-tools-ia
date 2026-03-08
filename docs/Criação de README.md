Instruções para Geração de README e CHANGELOG
 
Contexto:
	Como engenheiro SRE, você deve analisar o repositório {REPO_NAME} para gerar ou atualizar os arquivos README.md e CHANGELOG.md, seguindo as diretrizes abaixo.
 
README.md – Diretrizes de Geração
 
	Estrutura e Conteúdo
		- Atualizar o README com base na estrutura de diretórios e arquivos do repositório.
		- Utilizar boas práticas de formatação Markdown e template padrão.
		- Preencher a seção "Descrição do Projeto" com o máximo de informações relevantes.
		- Se já existir um README, reutilizar e incrementar as informações existentes.
		- Corrigir erros de digitação e adicionar anotações de idioma nos blocos de código.
		- Transformar referências internas em links navegáveis.
		- Garantir que o README tenha:
		- Título # no topo
		- Seções separadas por títulos claros
		- Identação correta na seção "Estrutura do Repositório", respeitando a hierarquia de pastas
 
	Estrutura do Repositório
		- Para cada pasta/arquivo, incluir uma descrição breve com base no conteúdo e contexto.
		- Manter a hierarquia de diretórios conforme apresentada no repositório.

	Seções Condicionais
		- Desenvolvedores/Contribuintes: incluir apenas se houver referência explícita.
		- Licença: se ausente, informar que é uso interno exclusivo.
		- Status do Projeto: se não houver progresso indicado, marcar como "Concluído".
		- Tarefas em aberto, Pré-requisitos, Como rodar a aplicação: incluir apenas se houver dados concretos.

	Informações Técnicas
	- Incluir:
		- Cobertura de código
		- Fluxo do projeto e dos Controllers (gráficos)
		- Stack tecnológica
		- Variáveis de ambiente
		- Grupos de usuários (se existirem)
	- Analisar os seguintes componentes:
		- DataDog, QuickConfig, OpenTelemetry
		- Controllers, Middlewares, Filters
		- Dockerfile, AWS, Azure, GitHub Actions
		- Terraform

	Visões Distintas
		- Negócio: visão funcional e estratégica
		- Técnico: arquitetura, dependências, implementação
 
	CHANGELOG.md – Diretrizes de Geração
 
	- Analisar os commits do repositório para gerar um changelog detalhado.
	- Utilizar o formato Keep a Changelog (https://keepachangelog.com/pt-BR/1.1.0/)
	- Adotar Versionamento Semântico (https://semver.org/lang/pt-BR/)
	- Linkar o CHANGELOG.md no README.md
 
	Operações no Repositório

	  1. Clonar o repositório usando o token de acesso (se necessário).
	  2. Criar uma branch baseada na develop com o nome:
		 feature/{data}-readme-changelog
	  3. Realizar os ajustes nos arquivos.
	  4. Criar um Pull Request para develop.
		 Se houver falhas, gerar um resumo para criação manual do PR.
	  5. Utilizar o token armazenado no segredo para autenticação, se necessário.

	Regras de Estilo e Arquitetura
 
	SOLID
	- Aplicar os 5 princípios com exemplos reais em C#
	- Justificar decisões com base em responsabilidade única, inversão de dependência, etc.

	DDD
	- Utilizar Aggregate, Entity, Value Object, Repository
	- Separar domínios e aplicar lógica de negócio no núcleo

	Clean Architecture
	- Separação clara entre camadas: Domain, Application, Infrastructure, Presentation
	- Inversão de dependência e baixo acoplamento

	Padrão de Commits
 
	- Seguir Conventional Commits (https://www.conventionalcommits.org/pt-br/v1.0.0/)
	- Exemplos:
		- feat(usuario): adicionar validação de e-mail no cadastro
		- fix(auth): corrigir token expirado
		- docs(readme): atualizar instruções de instalação

	Restrições

	- Não analisar nenhum outro repositório além do informado.
	- Não criar PR automaticamente. Apenas preparar o commit e relatar as mudanças.