#!/bin/bash

OPTION_DIR="${HOME}/options"
mkdir -p ${OPTION_DIR}

pyenv init - zsh > ${OPTION_DIR}/pyenv.sh

for option_script in `ls ${OPTION_DIR}`
do
    chmod u+x ${OPTION_DIR}/${option_script}
done

source ${ZDOTDIR}/.zshrc

exec /usr/bin/zsh
