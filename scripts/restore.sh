#!/bin/bash

set -e

# previous config backup directory
BKP_DIR="$HOME/.dotfiles-bkp"
if [ ! -d "$BKP_DIR" ]; then
    exit 0
fi

# bash
if [ "$SHELL" = "/bin/bash" ]; then
    printf "bash\n"
    if [ -f "$BKP_DIR/.bashrc" ]; then
        printf " - .bashrc "
        cp "$BKP_DIR/.bashrc" "$HOME/"
        printf "[restored]\n"
    fi
    if [ -f "$BKP_DIR/.bash_profile" ]; then
        printf " - .bash_profile "
        cp "$BKP_DIR/.bash_profile" "$HOME/"
        printf "[restored]\n"
    fi
fi

# zsh
if [ "$SHELL" = "/usr/bin/zsh" ] && [ -f "$BKP_DIR/.zshrc" ]; then
    printf "zsh "
    cp "$BKP_DIR/.zshrc" "$HOME/"
    printf "[restored]\n"
fi

# git
if [ -f "$BKP_DIR/.gitconfig" ]; then
    printf "git "
    cp "$BKP_DIR/.gitconfig" "$HOME/"
    printf "[restored]\n"
fi

# nvim
if [ -d "$BKP_DIR/.config/nvim" ]; then
    printf "nvim "
    rm -rf "$HOME/.config/nvim" || true
    cp -R "$BKP_DIR/.config/nvim" "$HOME/.config/"
    printf "[restored]\n"
fi

# beets
if [ -d "$BKP_DIR/.config/beets" ]; then
    printf "beets "
    rm -rf "$HOME/.config/beets" || true
    cp -R "$BKP_DIR/.config/beets" "$HOME/.config/"
    printf "[restored]\n"
fi

# mpv
if [ -d "$BKP_DIR/.config/mpv" ]; then
    printf "mpv "
    rm -rf "$HOME/.config/mpv" || true
    cp -R "$BKP_DIR/.config/mpv" "$HOME/.config/"
    printf "[restored]\n"
fi

# starship prompt
if [ -f "$BKP_DIR/.config/starship.toml" ]; then
    printf "git "
    cp "$BKP_DIR/.config/starship.toml" "$HOME/.config/"
    printf "[restored]\n"
fi

# delete backup directory
rm -rf "$BKP_DIR"
