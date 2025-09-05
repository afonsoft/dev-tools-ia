# Usa a imagem base fornecida, que já inclui um runtime e possivelmente outras ferramentas.
FROM docker.all-hands.dev/all-hands-ai/runtime:0.55-nikolaik

# Define variáveis de ambiente para o locale, ajudando a evitar avisos de locale em alguns comandos.
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

## Instalação de Dependências Essenciais e Ferramentas de Build
# Atualiza o índice de pacotes e instala ferramentas comuns e bibliotecas de desenvolvimento.
# Consolidado para reduzir camadas e limpar o cache do apt de forma mais eficiente.
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    ffmpeg \
    git \
    curl \
    ca-certificates \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libncursesw5-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev \
    libfontconfig1 \
    libfreetype6

# Limpa o cache do apt para reduzir o tamanho da imagem.
RUN rm -rf /var/lib/apt/lists/*

## Instalação do NVM (Node Version Manager) e Node.js
# Baixa e executa o script de instalação do NVM e instala as versões do Node.js.
# Nota: Para produção, considere instalar Node.js diretamente ou usar uma imagem base específica.
# Adicionei um método mais robusto para obter a versão LTS e garantir que o PATH seja atualizado.
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && \
    export NVM_DIR="/root/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    nvm install --lts && \
    nvm use --lts && \
    nvm alias default $(nvm ls --lts | head -n 1 | grep -o 'v[0-9.]*')

## Instalação dos SDKs do .NET
# Baixa e instala o repositório de pacotes da Microsoft para Ubuntu 22.04 e os SDKs do .NET.
RUN wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    dotnet-sdk-8.0 \
    dotnet-sdk-9.0 

# Limpa o cache do apt para reduzir o tamanho da imagem.
RUN apt-get clean && \
    apt-get autoremove -y && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# Configuração do GIT
RUN git config --global http.sslVerify false && \
    git config --global https.sslVerify false && \
    git config --global core.longpaths true

# Configuração do NPM
RUN npm config set strict-ssl false

## Configuração de Variáveis de Ambiente e Ferramentas Globais do .NET
# Adiciona os caminhos ao PATH e configura as variáveis de ambiente do NVM.
# Instala as ferramentas globais do .NET.
# O comando para obter a versão LTS do Node.js no PATH é mais direto.
ENV NVM_DIR="/root/.nvm"
ENV PATH="$NVM_DIR/versions/node/$(nvm ls --lts | grep -o 'v[0-9]*\.[0-9]*\.[0-9]*' | head -1)/bin:$PATH"
ENV PATH="$PATH:/root/.dotnet/tools:/usr/local/bin"

# Configura as variáveis de ambiente do NVM no .bashrc para sessões interativas.
# Instala as ferramentas globais do .NET no mesmo RUN.
RUN echo "export NVM_DIR=\"/root/.nvm\"" >> /root/.bashrc && \
    echo "[ -s \"$NVM_DIR/nvm.sh\" ] && . \"$NVM_DIR/nvm.sh\"" >> /root/.bashrc && \
    echo "[ -s \"$NVM_DIR/bash_completion\" ] && . \"$NVM_DIR/bash_completion\"" >> /root/.bashrc 

ENV DOTNET_CLI_TELEMETRY_OPTOUT=true
ENV NODE_TLS_REJECT_UNAUTHORIZED=0

## Definição do Diretório de Trabalho e Comando Padrão
# Define o diretório de trabalho padrão dentro do contêiner.
WORKDIR /app

