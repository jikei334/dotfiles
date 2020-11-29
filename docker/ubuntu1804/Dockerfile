FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y \
        automake \
        build-essential \
        git \
        curl \
        locales \
        zsh \
        sed \
        zlib1g-dev \
        libssl-dev \
        sudo \
        wget \
        software-properties-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists*

RUN add-apt-repository ppa:neovim-ppa/unstable &&\
    apt-get update && \
    apt-get install -y \
        neovim \
        python-dev \
        python-pip \
        python3-dev \
        python3-pip

SHELL ["/usr/bin/zsh", "-c"]

ENV SHELL /usr/bin/zsh
ENV LOGIN_USER jikei334
ENV PASSWORD password
ENV HOME /home/$LOGIN_USER
# ENV PYENV_ROOT $HOME/.pyenv
# ENV PYTHON3_VERSION=3.6.1 \
#     PYTHON2_VERSION=2.7.11
# ENV PATH $PYENV_ROOT/bin:$PATH

RUN echo "ja_JP UTF-8" > /etc/locale.gen && \
    locale-gen

RUN sed -i.bak "s|$HOME:|$HOME:$SHELL|" /etc/passwd

ENV CLANGD_FILENAME clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-16.04
RUN curl -L https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/$CLANGD_FILENAME.tar.xz | \
    unxz | \
    tar x --strip-components=1 $CLANGD_FILENAME/ && \
    ln -sf bin/clangd /usr/bin/clangd

RUN useradd -m --groups sudo -d $HOME ${LOGIN_USER} && \
    echo $LOGIN_USER:$PASSWORD | chpasswd && \
    echo "HOME: $HOME(User: $LOGIN_USER)"
USER $LOGIN_USER
WORKDIR $HOME

# RUN git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv && \
#     eval "$(pyenv init - zsh)" && \
#     pyenv install $PYTHON3_VERSION && \
#     pyenv install $PYTHON2_VERSION && \
#     pyenv global $PYTHON3_VERSION $PYTHON2_VERSION && \
RUN pip2 install neovim && \
    pip3 install \
        neovim \
        'python-language-server[all]'

RUN echo "export ZDOTDIR=/dotfiles/zsh" > $HOME/.zshenv

COPY entrypoint.sh /tmp

ENTRYPOINT ["/tmp/entrypoint.sh"]
