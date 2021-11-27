#!/bin/bash

BKP_DIR="$HOME/.dotfiles-bkp"

mkdir -p $BKP_DIR

if [ "$SHELL" = "/bin/bash" ]; then
    mv "$HOME/.bash_profile" "$BKP_DIR/"
    ln -s "$PWD/.bash_profile" "$HOME/"
    mv "$HOME/.bashrc" "$BKP_DIR/"
    ln -s "$PWD/.bashrc" "$HOME/"
fi

if [ "$SHELL" = "/usr/bin/zsh" ]; then
    mv "$HOME/.zshrc" "$BKP_DIR/"
    ln -s "$PWD/.zshrc" "$HOME/"
fi

if [ -f "$HOME/.vimrc" ]; then
    mv "$HOME/.vimrc" "$BKP_DIR/"
    ln -s "$PWD/.vimrc" "$HOME/"
    mkdir -p "$HOME/.vim/ftplugin/"
    mkdir -p "$HOME/dotfiles-bkp/.vim/ftplugin/"
    mv "$HOME/.vim/ftplugin/*" "$HOME/dotfiles-bkp/.vim/ftplugin/" 2> /dev/null
    ln -s "$PWD/.vim/ftplugin/*" "$HOME/.vim/ftplugin/"
fi

