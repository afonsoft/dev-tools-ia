# Usa a imagem base fornecida, que já inclui um runtime e possivelmente outras ferramentas.
FROM docker.openhands.dev/openhands/runtime:1.3-nikolaik

# Define variáveis de ambiente para o locale e otimizações
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    NODE_ENV=production \
    NPM_CONFIG_LOGLEVEL=warn \
    NPM_CONFIG_PROGRESS=false

## Instalação de Dependências Essenciais e Ferramentas de Build
# Atualiza o índice de pacotes e instala ferramentas comuns e bibliotecas de desenvolvimento.
# Consolidado para reduzir camadas e limpar o cache do apt de forma mais eficiente.
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    ffmpeg \
    git \
    libbz2-dev \
    libffi-dev \
    libfontconfig1 \
    libfreetype6 \
    liblzma-dev \
    libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxmlsec1-dev \
    python3-pip \
    python3-setuptools \
    python3-venv \
    zlib1g-dev && \
    apt-get clean && apt-get autoremove -y && apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

## Instalação do NVM (Node Version Manager) e Node.js
# Baixa e executa o script de instalação do NVM e instala as versões do Node.js.
# Nota: Para produção, considere instalar Node.js diretamente ou usar uma imagem base específica.
# Adicionei um método mais robusto para obter a versão LTS e garantir que o PATH seja atualizado.
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash && \
    export NVM_DIR="/root/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    nvm install --lts && \
    nvm use --lts && \
    nvm alias default $(nvm ls --lts | head -n 1 | grep -o 'v[0-9.]*') && \
    npm config set strict-ssl false

## Instalação dos SDKs do .NET
# Baixa e instala o repositório de pacotes da Microsoft para Ubuntu 22.04 e os SDKs do .NET.
RUN curl -sSL https://builds.dotnet.microsoft.com/dotnet/scripts/v1/dotnet-install.sh -o /tmp/dotnet-install.sh && \
    chmod +x /tmp/dotnet-install.sh && \
    /tmp/dotnet-install.sh --channel 10 --install-dir /usr/share/dotnet && \
    ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet || true && \
    rm /tmp/dotnet-install.sh

# Limpa o cache do apt para reduzir o tamanho da imagem.
RUN apt-get clean && \
    apt-get autoremove -y && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# Configuração do GIT
RUN git config --global http.sslVerify false && \
    git config --global https.sslVerify false && \
    git config --global core.longpaths true

## Instalação do Astral UV e pacotes OpenHands via venv (evita PEP 668)
# Cria um virtualenv em /opt/venv, instala os pacotes requerido, instala o uv e o tool
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip setuptools && \
    /opt/venv/bin/pip install --no-cache-dir openhands-agent-server openhands-sdk openhands-tools openhands-workspace && \
    curl -LsSf https://astral.sh/uv/install.sh | sh && \
    /root/.local/bin/uv tool install openhands || true && \
    rm -rf /root/.cache/pip

## Configuração de Variáveis de Ambiente Otimizadas
# Configurações de ambiente consolidadas e otimizadas
ENV NVM_DIR="/root/.nvm" \
    DOTNET_ROOT=/usr/share/dotnet \
    DOTNET_CLI_TELEMETRY_OPTOUT=true \
    PATH="/opt/venv/bin:/usr/share/dotnet:/root/.dotnet/tools:/root/.local/bin:$PATH"

# Configura o ambiente NVM no .bashrc para sessões interativas
RUN echo 'export NVM_DIR="/root/.nvm"' >> /root/.bashrc && \
    echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"' >> /root/.bashrc && \
    echo 'export PATH="/opt/venv/bin:/usr/share/dotnet:$PATH"' >> /root/.bashrc 


## Definição do Diretório de Trabalho e Comando Padrão
# Define o diretório de trabalho padrão dentro do contêiner.
WORKDIR /app

