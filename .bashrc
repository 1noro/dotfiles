#
# ~/.bashrc
#

parse_git_branch() {
    if [[ -d ".git" ]]; then
        # git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
        # BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'`
        # BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`

        # UPSTREAM=${1:-'@{u}' 2> /dev/null}
        # LOCAL=$(git rev-parse @ 2> /dev/null) 
        # REMOTE=$(git rev-parse "$UPSTREAM" 2> /dev/null)
        # BASE=$(git merge-base @ "$UPSTREAM" 2> /dev/null)

        # if [ $LOCAL = $REMOTE ]; then
        #     #echo "$BRANCH Up-to-date"
        #     echo " ($BRANCH)"
        # elif [ $LOCAL = $BASE ]; then
        #     # echo "$BRANCH Need to pull"
        #     echo " ($BRANCH🔻)"
        # elif [ $REMOTE = $BASE ]; then
        #     # echo "$BRANCH Need to push"
        #     echo " ($BRANCH🔺)"
        # else
        #     # echo "$BRANCH Diverged"
        #     echo " ($BRANCH⛔)"
        # fi
    fi
}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# export PS1="[\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;33m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;201m\]\W\[$(tput sgr0)\]]\\$ \[$(tput sgr0)\]"
# export PS1="\[\033[38;5;196m\][\[$(tput sgr0)\]\[\033[38;5;214m\]\u\[$(tput sgr0)\]\[\033[38;5;142m\]@\[$(tput sgr0)\]\[\033[38;5;67m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;135m\]\W\[$(tput sgr0)\]\[\033[38;5;196m\]]\[$(tput sgr0)\]\\$\[$(tput sgr0)\] "
# export PS1="\[\033[38;5;196m\][\[$(tput sgr0)\]\[\033[38;5;214m\]\u\[$(tput sgr0)\]\[\033[38;5;142m\]@\[$(tput sgr0)\]\[\033[38;5;67m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;135m\]\W\[$(tput sgr0)\]\[\e[91m\]\$(parse_git_branch)\[\033[38;5;196m\]]\[$(tput sgr0)\]\\$\[$(tput sgr0)\] "
export PS1="\[\033[38;5;9m\][\[$(tput sgr0)\]\[\033[38;5;11m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;6m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;13m\]\W\[$(tput sgr0)\]\[\033[38;5;11m\]\$(parse_git_branch)\[$(tput sgr0)\]\[\033[38;5;9m\]]\[$(tput sgr0)\]\\$\[$(tput sgr0)\] "
# color es predeterminados:
# texto: #EBDDC9, #A3998A
# fondo: #272931

#complete -c man which
complete -cf sudo

# Alias
## Color
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
## Quick Access
alias s='systemctl'
alias j='journalctl -xe'
alias jf='sudo journalctl -p 3 -xb'

# --- Check for updates
FLAG="/tmp/check_updates.flag"
if [[ $(pacman -Qu) ]]; then
    if [ ! -f $FLAG ]; then
        # echo "sudo pacman -Sy; pacman -Qu" >> ~/.bash_history
        echo "sudo pacman -Syyu" >> ~/.bash_history
        echo -e "[ info ]: \e[92m\e[1mHay actualizaciones pendientes!\e[0m"
        echo -e " 1. Ejecuta '\e[1msudo pacman -Sy; pacman -Qu\e[0m' (en el historial)."
        # echo -e " 1. Ejecuta 'sudo pacman -Syu' (en el historial)."
        echo -e " 2. Visita \e[96mwww.archlinux.org\e[0m y \e[96mhttps://bbs.archlinux.org\e[0m."
        echo -e " 3. Comprueba que no hay conflictos con dichos paquetes."
        echo -e " 4. Asegúrate de \e[91m\e[1mtener tiempo\e[0m para solucionar posibles errores."
        echo -e " 5. Instala las actualizaciones."
        echo -e " 6. Comprueba los paquetes AUR y actualízalos si es necesario."
        touch $FLAG
    else
        echo -e "[ info ]: \e[92m\e[1mHay actualizaciones pendientes!\e[0m"
        # echo -e "Asegúrate de \e[91m\e[1mtener tiempo\e[0m para solucionar posibles errores."
    fi
fi

# --- Check for Evolution
FLAG="/tmp/check_updates.flag"
if [[ ! $(pgrep evolution -x) ]]; then
    echo -e "[ info ]: \e[91m\e[1mEvolution no está abierto.\e[0m"
fi

# --- Git fetch if is a repository
# if [[ -d ".git" ]]; then
#     echo -e "[ info ]: fetching repository"
#     git fetch 2> /dev/null
# fi

# para que steam no se minimice en el 'tray' inexistente de Gnome Shell y se
# cierre completamente al pulsar X
# (parece que no funciona)
#STEAM_FRAME_FORCE_CLOSE=1
#export STEAM_FRAME_FORCE_CLOSE=1

# --- para no olvidares del comando SXIV
alias img='sxiv -a' # -a para iniciar la animaciones auto
source /usr/share/nvm/init-nvm.sh
