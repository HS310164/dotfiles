#!/bin/bash

DOT_DIRECTORY="${HOME}/dotfiles"
PYENV_ROOT="${HOME}/.pyenv"
TMUX_PLUGIN="${HOME}/.tmux/plugins/tpm"
cd ${DOT_DIRECTORY}

#tmux plugin(TPM)
git clone https://github.com/tmux-plugins/tpm ${TMUX_PLUGIN}

#pyenv and plugins
git clone https://github.com/pyenv/pyenv ${PYENV_ROOT}
git clone https://github.com/pyenv/pyenv-virtualenv ${PYENV_ROOT}/plugins/pyenv-virtualenv
git clone https://github.com/pyenv/pyenv-update.git ${PYENV_ROOT}/plugins/pyenv-update

for f in .??*
do
  # 無視したいファイルやディレクトリ
  [[ ${f} = ".git" ]] && continue
  [[ ${f} = ".gitignore" ]] && continue
  [[ ${f} = ".DS_Store" ]] && continue

  ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
  # echo ${DOT_DIRECTORY}/${f} to ${HOME}/${f}
done
echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)