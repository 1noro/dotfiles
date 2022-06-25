#!/bin/bash
# ~/.bashrc
# Maintainer: 1noro <ppuubblliicc@protonmail..com>

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PROMPT
# - bash prompt
parse_git_branch() {
    if [[ -d ".git" ]]; then
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    fi
}
export PS1="\[\033[38;5;9m\][\[$(tput sgr0)\]\[\033[38;5;11m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;6m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;13m\]\W\[$(tput sgr0)\]\[\033[38;5;11m\]\$(parse_git_branch)\[$(tput sgr0)\]\[\033[38;5;9m\]]\[$(tput sgr0)\]\\$\[$(tput sgr0)\] "

# - starship prompt
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

# PACMAN UPDATE REMINDER
FLAG="/tmp/check_updates.flag"
if command -v pacman &> /dev/null; then
    if [[ $(pacman -Qu) ]]; then
        if [ ! -f $FLAG ]; then
            echo "sudo pacman -Syyu" >> ~/.histfile
            touch $FLAG
        fi
        echo -e "Have you checked the \e[92m\e[1mupdates\e[0m yet?"
    fi
fi

# NVM
if [ -f /usr/share/nvm/init-nvm.sh ]; then
    source /usr/share/nvm/init-nvm.sh
fi
if [ -f "$HOME/.nvm/nvm.sh" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# LF
# Change working dir in shell to last dir in lf on exit (adapted from ranger)
# (https://raw.githubusercontent.com/gokcehan/lf/master/etc/lfcd.sh)
if command -v lf &> /dev/null; then
    lfcd () {
        tmp="$(mktemp)"
        lf -last-dir-path="$tmp" "$@"
        if [ -f "$tmp" ]; then
            dir="$(cat "$tmp")"
            rm -f "$tmp"
            if [ -d "$dir" ]; then
                if [ "$dir" != "$(pwd)" ]; then
                    #cd "$dir"
                    cd "$dir" || return
                fi
            fi
        fi
    }

    # bind <C-o> to lfcd command
    bind '"\C-o":"lfcd\C-m"'
fi


# EXPORTS
# export ANDROID_SDK_ROOT=$HOME/Android/Sdk
#export TERM=xterm-256color
export COLORTERM=truecolor
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox
export VIDEO=mpv
export IMAGE=sxiv

export HISTSIZE=10000
export HISTFILESIZE=10000
# para que las aplicaciones qt usen wayland (creo que no funciona muy bien)
export QT_QPA_PLATFORM=wayland

#complete -c man which
complete -cf sudo

# ALIAS
# - color
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
# -- docker
alias di='docker images'
alias dirn='docker image rm $(docker images | grep none | awk "{print \$3}")'
alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"'
# - sxiv
alias img='sxiv -a' # -a para iniciar la animaciones auto
alias x='sxiv -at' # -at para iniciar la animaciones auto y abrir en thumbnail mode
# - quick access
alias p='sudo pacman'
alias lsp='pacman -Qett --color=always | less -R' # list packages
alias SS='sudo systemctl'
alias j='journalctl -xe'
alias Sjf='sudo journalctl -p 3 -xb'
alias e='$EDITOR'
alias v='$EDITOR'
alias vc='nvim ~/.config/nvim/init.vim'
alias yt="yt-dlp --add-metadata -i -o '%(upload_date)s-%(title)s.%(ext)s'"
alias m='make'
alias fuck='sudo !!'
alias b='xkbbell'
# alias pandoc="docker run --rm --volume \"$(pwd):/data\" --user $(id -u):$(id -g) pandoc/latex"
