#!/bin/bash

OPTION_DIR="${HOME}/options"
mkdir -p ${OPTION_DIR}

# git clone https://github.com/pyenv/pyenv.git ${HOME}/.pyenv
# echo 'export PYENV_ROOT="${HOME}/.pyenv"' >> ${OPTION_DIR}/pyenv.sh
# echo 'export PATH="${PYENV_ROOT}/bin:${PATH}"' >> ${OPTION_DIR}/pyenv.sh
# echo 'eval "$(pyenv init -)"' >> ${OPTION_DIR}/pyenv.sh
# chmod u+x ${OPTION_DIR}/pyenv.sh
# source ${ZDOTDIR}/.zshrc
# pyenv install $PYTHON3_VERSION
# pyenv install $PYTHON2_VERSION
# pyenv global $PYTHON3_VERSION $PYTHON2_VERSION
pyenv init - zsh > ${OPTION_DIR}/pyenv.sh

for option_script in `ls ${OPTION_DIR}`
do
    chmod u+x ${OPTION_DIR}/${option_script}
done

source ${ZDOTDIR}/.zshrc

exec /usr/bin/zsh
