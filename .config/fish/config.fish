# install fisher (https://github.com/jorgebucaran/fisher)
# curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# update reminder (fish version)
set FLAG "/tmp/check_updates.flag"
if ! test -z (pacman -Qu)
    if ! test -f $FLAG
        # (not woringg in fish)
        # echo "sudo pacman -Syyu" >> ~/.histfile
        touch $FLAG
    end
    echo -e "Have you checked the \e[92m\e[1mupdates\e[0m yet?"
end

# nvm
function nvm
    # fisher install edc/bass
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# remove wellcome message
set fish_greeting

# global vars
set -gx EDITOR nvim
set -gx ANDROID_SDK_ROOT $HOME/Android/Sdk

# alias
alias s='systemctl'
alias j='journalctl -xe'
alias jf='sudo journalctl -p 3 -xb'
alias img='sxiv -a' # -a para iniciar la animaciones auto
alias nvimconf='nvim ~/.config/nvim/init.vim'

# starship prompt
starship init fish | source
