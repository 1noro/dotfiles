#!/bin/bash

set -e

# previous config backup directory
BKP_DIR="$HOME/.dotfiles-bkp"
mkdir -p "$BKP_DIR"

# bash
if [ "$SHELL" = "/bin/bash" ]; then
    printf "bash\n"
    if [ -f "$HOME/.bashrc" ]; then
        printf " - .bashrc "
        mv "$HOME/.bashrc" "$BKP_DIR/"
        printf "[backuped] "
        ln -s "$PWD/.bashrc" "$HOME/"
        printf "[deployed]\n"
    fi
    if [ -f "$HOME/.bash_profile" ]; then
        printf " - .bash_profile "
        mv "$HOME/.bash_profile" "$BKP_DIR/"
        printf "[backuped] "
        ln -s "$PWD/.bash_profile" "$HOME/"
        printf "[deployed]\n"
    fi
fi

# zsh
if [ "$SHELL" = "/usr/bin/zsh" ]; then
    printf "zsh "
    mv "$HOME/.zshrc" "$BKP_DIR/"
    printf "[backuped] "
    ln -s "$PWD/.zshrc" "$HOME/"
    printf "[deployed]\n"
fi

# git
if [ -f "$HOME/.gitconfig" ]; then
    printf "git "
    mv "$HOME/.gitconfig" "$BKP_DIR/"
    printf "[backuped] "
    ln -s "$PWD/.gitconfig" "$HOME/"
    printf "[deployed]\n"
fi

# nvim
if [ -d "$HOME/.config/nvim" ]; then
    printf "nvim "
    mv "$HOME/.config/nvim" "$BKP_DIR/.config/"
    printf "[backuped] "
    ln -s "$PWD/.config/nvim" "$HOME/.config/"
    printf "[deployed]\n"
fi

#beets
if [ -d "$HOME/.config/beets" ]; then
    printf "beets "
    mv "$HOME/.config/beets" "$BKP_DIR/.config/"
    printf "[backuped] "
    ln -s "$PWD/.config/beets" "$HOME/.config/"
    printf "[deployed]\n"
fi

#mpv
if [ -d "$HOME/.config/mpv" ]; then
    printf "mpv "
    mv "$HOME/.config/mpv" "$BKP_DIR/.config/"
    printf "[backuped] "
    ln -s "$PWD/.config/mpv" "$HOME/.config/"
    printf "[deployed]\n"
fi

# starship prompt
if [ -f "$HOME/.config/starship.toml" ]; then
    printf "starship prompt "
    mv "$HOME/.config/starship.toml" "$BKP_DIR/.config/"
    printf "[backuped] "
    ln -s "$PWD/.config/starship.toml" "$HOME/.config/"
    printf "[deployed]\n"
fi
