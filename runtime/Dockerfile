# Alternative: Using .NET SDK base image (smaller)
FROM mcr.microsoft.com/dotnet/sdk:10.0.201-bookworm-slim

# Set environment variables for OpenHands
ENV NODE_VERSION=20
ENV NVM_DIR=/root/.nvm
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Install dependencies for NVM and Python
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    wget \
    ca-certificates \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev \
    python3-openssl \
    git \
    sudo \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Install Python 3.12
RUN wget https://www.python.org/ftp/python/3.12.7/Python-3.12.7.tgz \
    && tar xzf Python-3.12.7.tgz \
    && cd Python-3.12.7 \
    && ./configure --enable-optimizations \
    && make -j$(nproc) \
    && make altinstall \
    && cd .. \
    && rm -rf Python-3.12.7 Python-3.12.7.tgz \
    && update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.12 1 \
    && update-alternatives --install /usr/bin/python python /usr/local/bin/python3.12 1 \
    && update-alternatives --install /usr/bin/pip3 pip3 /usr/local/bin/pip3.12 1

# Install OpenHands agent and dependencies
RUN pip3.12 install --no-cache-dir openhands-agent

# Install NVM (Node Version Manager)
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Add NVM to PATH and enable it
ENV PATH="$NVM_DIR/versions/node/v${NODE_VERSION}/bin:$PATH"

# Install Node.js 20 as default
RUN bash -c '. $NVM_DIR/nvm.sh && nvm install ${NODE_VERSION} && nvm use ${NODE_VERSION} && nvm alias default ${NODE_VERSION}'

# Create workspace directory
RUN mkdir -p /workspace && chmod 777 /workspace

# Set working directory
WORKDIR /workspace

# Verify installations
RUN dotnet --version && \
    bash -c '. $NVM_DIR/nvm.sh && node --version && npm --version' && \
    python3.12 --version && \
    pip3.12 --version && \
    openhands-agent --version

# Add NVM initialization to bash profile
RUN echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc && \
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc && \
    echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.bashrc

# Default command
CMD ["/bin/bash"]
