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

# abreviations (como alias pero muestra el comando)
abbr p 'sudo pacman'
abbr lsp 'pacman -Qett --color=always | less -R' # list packages
abbr SS 'sudo systemctl'
abbr j 'journalctl -xe'
abbr Sjf 'sudo journalctl -p 3 -xb'
abbr e "$EDITOR"
abbr v "$EDITOR"
abbr vc 'nvim ~/.config/nvim/init.vim'
abbr img 'sxiv -a' # -a para iniciar la animaciones auto
abbr x 'sxiv -at' # -at para iniciar la animaciones auto y abrir en thumbnail mode
abbr yt "youtube-dl --add-metadata -i -o '%(upload_date)s-%(title)s.%(ext)s'"

# starship prompt
starship init fish | source
