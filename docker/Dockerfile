FROM ubuntu:16.04

RUN apt-get update && apt-get -y upgrade && \
	apt-get install -y \
		automake \
		build-essential \
		git \
		curl \
		zsh \
		sed \
		zlib1g-dev \
		libssl-dev \
		software-properties-common

RUN add-apt-repository ppa:neovim-ppa/stable &&\
	apt-get update && \
	apt-get install -y \
		neovim \
		python3-dev \
		python3-pip

ENV SHELL /usr/bin/zsh
ENV HOME /root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/bin:$PATH
ENV PYTHON_VERSION 3.6.1

RUN sed -i.bak "s|$HOME:|$HOME:$SHELL|" /etc/passwd

WORKDIR /root

RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv && \
	eval "$(pyenv init -)" && \
	pyenv install $PYTHON_VERSION && \
	pyenv global $PYTHON_VERSION && \
	pip install neovim

COPY entrypoint.sh /tmp

ENTRYPOINT ["/tmp/entrypoint.sh"]
