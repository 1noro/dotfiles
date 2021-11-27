#
# ~/.zshrc
#

# AUTO CONFIG

## Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt beep
bindkey -e

## The following lines were added by compinstall
zstyle :compinstall filename '/home/cosmo/.zshrc'
autoload -Uz compinit
compinit

# CUSTOM CONFIG

## Sources
source /usr/share/nvm/init-nvm.sh # for NodeJS versions
source ~/.gitstatus/gitstatus.prompt.zsh # (https://github.com/romkatv/gitstatus)

## Prompt
# (https://zsh-prompt-generator.site)
# PROMPT='%F{214}%n%f@%F{153}%m%f:%F{183}%~%f%# '
# RPROMPT='$GITSTATUS_PROMPT'
eval "$(starship init zsh)"

## Update reminder
FLAG="/tmp/check_updates.flag"
if [[ $(pacman -Qu) ]]; then
    if [ ! -f $FLAG ]; then
        echo -e "Have you checked the \e[92m\e[1mupdates\e[0m yet?"
        echo "sudo pacman -Syyu" >> ~/.histfile
        touch $FLAG
    else
        echo -e "Have you checked the \e[92m\e[1mupdates\e[0m yet?"
    fi
fi

## Alias
### Color
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
### Quick Access
alias s='systemctl'
alias j='journalctl -xe'
alias jf='sudo journalctl -p 3 -xb'
alias img='sxiv -a' # -a para iniciar la animaciones auto
alias pacamn='pacman' # fix the typo
alias pacaman='pacman' # fix the typo
alias nvimconf='nvim ~/.config/nvim/init.vim'

## ANDROID
#export ANDROID_HOME=$HOME/Android/Sdk
#export PATH=$PATH:$ANDROID_HOME/tools
#export PATH=$PATH:$ANDROID_HOME/platform-tools
export ANDROID_SDK_ROOT=$HOME/Android/Sdk

# Alias for the Contemporary-z program
alias z='. ~/.local/share/cz/cz.zsh'

