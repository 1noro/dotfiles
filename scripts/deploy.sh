#!/bin/bash

set -e

# previous config backup directory
BKP_DIR="$HOME/.dotfiles-bkp"
mkdir -p "$BKP_DIR"

# bash
if [ "$SHELL" = "/bin/bash" ]; then
    mv "$HOME/.bash_profile" "$BKP_DIR/"
    ln -s "$PWD/.bash_profile" "$HOME/"
    mv "$HOME/.bashrc" "$BKP_DIR/"
    ln -s "$PWD/.bashrc" "$HOME/"
fi

# zsh
if [ "$SHELL" = "/usr/bin/zsh" ]; then
    mv "$HOME/.zshrc" "$BKP_DIR/"
    ln -s "$PWD/.zshrc" "$HOME/"
fi

# git
if [ -f "$HOME/.gitconfig" ]; then
    mv "$HOME/.gitconfig" "$BKP_DIR/"
    ln -s "$PWD/.gitconfig" "$HOME/"
fi

# vim
# if [ -f "$HOME/.vimrc" ]; then
#     mv "$HOME/.vimrc" "$BKP_DIR/"
#     ln -s "$PWD/.vimrc" "$HOME/"
#     mkdir -p "$HOME/.vim/ftplugin/"
#     mkdir -p "$HOME/dotfiles-bkp/.vim/ftplugin/"
#     mv "$HOME/.vim/ftplugin/*" "$HOME/dotfiles-bkp/.vim/ftplugin/" 2> /dev/null
#     ln -s "$PWD/.vim/ftplugin/*" "$HOME/.vim/ftplugin/"
# fi

# nvim
if [ -d "$HOME/.config/nvim" ]; then
    mv "$HOME/.config/nvim" "$BKP_DIR/.config/"
    ln -s "$PWD/.config/nvim" "$HOME/.config/"
fi

#beets
if [ -d "$HOME/.config/beets" ]; then
    mv "$HOME/.config/beets" "$BKP_DIR/.config/"
    ln -s "$PWD/.config/beets" "$HOME/.config/"
fi

#mpv
if [ -d "$HOME/.config/mpv" ]; then
    mv "$HOME/.config/mpv" "$BKP_DIR/.config/"
    ln -s "$PWD/.config/mpv" "$HOME/.config/"
fi

# starship
if [ -f "$HOME/.config/starship.toml" ]; then
    mv "$HOME/.config/starship.toml" "$BKP_DIR/.config/"
    ln -s "$PWD/.config/starship.toml" "$HOME/.config/"
fi
