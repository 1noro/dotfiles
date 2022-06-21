#!/bin/bash
# ~/.bashrc
# mantained by 1noro for the purpose of personal use

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PROMPT
# - bash prompt
# parse_git_branch() {
#     if [[ -d ".git" ]]; then
#         git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#     fi
# }
# export PS1="\[\033[38;5;9m\][\[$(tput sgr0)\]\[\033[38;5;11m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;6m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;13m\]\W\[$(tput sgr0)\]\[\033[38;5;11m\]\$(parse_git_branch)\[$(tput sgr0)\]\[\033[38;5;9m\]]\[$(tput sgr0)\]\\$\[$(tput sgr0)\] "

# - starship prompt
eval "$(starship init bash)"

# updates reminder
FLAG="/tmp/check_updates.flag"
if [[ $(pacman -Qu) ]]; then
    if [ ! -f $FLAG ]; then
        echo "sudo pacman -Syyu" >> ~/.histfile
        touch $FLAG
    fi
    echo -e "Have you checked the \e[92m\e[1mupdates\e[0m yet?"
fi

# check for evolution (email)
# FLAG="/tmp/check_updates.flag"
# if [[ ! $(pgrep evolution -x) ]]; then
#     echo -e "[ info ]: \e[91m\e[1mEvolution no está abierto.\e[0m"
# fi

# SOURCES
source /usr/share/nvm/init-nvm.sh

# EXPORTS
# export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export EDITOR=nvim
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
# - quick access
alias p='sudo pacman'
alias lsp='pacman -Qett --color=always | less -R' # list packages
alias SS='sudo systemctl'
alias j='journalctl -xe'
alias Sjf='sudo journalctl -p 3 -xb'
alias e='$EDITOR'
alias v='$EDITOR'
alias vc='nvim ~/.config/nvim/init.vim'
alias img='sxiv -a' # -a para iniciar la animaciones auto
alias x='sxiv -at' # -at para iniciar la animaciones auto y abrir en thumbnail mode
alias yt="yt-dlp --add-metadata -i -o '%(upload_date)s-%(title)s.%(ext)s'"
alias m='make'
