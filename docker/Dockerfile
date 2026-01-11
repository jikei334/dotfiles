FROM ubuntu:26.04

ARG USERNAME=ubuntu
ARG UID=1000
ARG GID=1000

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt -y upgrade && \
    apt install -y \
        build-essential \
        ca-certificates \
        curl \
        git \
        libssl-dev \
        pkg-config \
        unzip \
        wget \
        zsh && \
    apt clean && \
    rm -rf /var/lib/apt/lists*

RUN apt update && \
    apt install -y \
        neovim \
        python3-dev \
        python3-pip && \
    rm -rf /var/lib/apt/lists*

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g\
        npm \
        neovim \
    && rm -rf /var/lib/apt/lists/*
RUN node --version && npm --version

ENV DENO_INSTALL=/usr/local/deno
ENV PATH=$DENO_INSTALL/bin:$PATH
RUN curl -fsSL https://deno.land/install.sh | sh \
    && deno --version

RUN if ! id -u ${USERNAME} > /dev/null 2>&1; then \
        groupadd -g ${GID} ${USERNAME} && \
        useradd -m -u ${UID} -g ${GID} -s /usr/bin/zsh ${USERNAME}; \
    fi

SHELL ["/usr/bin/zsh", "-c"]

USER ${USERNAME}

ENV RUSTUP_HOME=/home/${USERNAME}/.rustup \
    CARGO_HOME=/home/${USERNAME}/.cargo \
    PATH=/home/${USERNAME}/.cargo/bin:$PATH

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path \
    && rustup component add \
        rustfmt \
        clippy \
        rust-analyzer \
        rust-src \
    && cargo install \
        cargo-compete \
    && rustup toolchain install \
        1.42.0-x86_64-unknown-linux-gnu

WORKDIR /workspace

CMD ["/usr/bin/zsh"]
