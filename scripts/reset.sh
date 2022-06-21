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

# delete backup directory
rm -rf "$BKP_DIR"
