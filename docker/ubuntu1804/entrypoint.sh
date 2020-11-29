#!/bin/bash

OPTION_DIR="${HOME}/options"
mkdir -p ${OPTION_DIR}

for option_script in `ls ${OPTION_DIR}`
do
    chmod u+x ${OPTION_DIR}/${option_script}
done

source ${ZDOTDIR}/.zshrc

export PATH=$HOME/.local/bin:$PATH

exec /usr/bin/zsh
