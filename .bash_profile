#!/bin/bash
# ~/.bash_profile
# Maintainer: 1noro <ppuubblliicc@protonmail..com>

[[ -f ~/.bashrc ]] && . ~/.bashrc
export GPG_TTY=$(tty)

# GO
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# NVM
if [ -f /usr/share/nvm/init-nvm.sh ]; then
    source /usr/share/nvm/init-nvm.sh
elif [ -f "$HOME/.nvm/nvm.sh" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# CUSTOM EXPORTS
#export TERM=xterm-256color
export COLORTERM=truecolor
export EDITOR=nvim
export VISUAL=nvim
export READER=evince
export BROWSER=firefox
export VIDEO=mpv
export IMAGE=sxiv
