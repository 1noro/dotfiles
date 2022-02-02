# install fisher (https://github.com/jorgebucaran/fisher)
# curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# remove fish wellcome message
set fish_greeting

# global vars
set -gx EDITOR nvim
set -gx ANDROID_SDK_ROOT $HOME/Android/Sdk

# nvm
function nvm
    # fisher install edc/bass
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

if status is-interactive
    # Commands to run in interactive sessions can go here

    # update reminder (fish version)
    set FLAG "/tmp/check_updates.flag"
    set PQU (pacman -Qu)
    if test -n "$PQU"
        if ! test -f $FLAG
            # (not working in fish)
            # echo "sudo pacman -Syyu" >> ~/.histfile
            touch $FLAG
        end
        echo -e "Have you checked the \e[92m\e[1mupdates\e[0m yet?"
    end

    if test (ps -A | grep claws-mail) && test (claws-mail --status INBOX | awk '{print $2}') -gt 0
        echo -e "You have \e[92m\e[1mnew\e[0m mail!"
    end

    # aliases
    alias fuck "sudo $history[1]"

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
    abbr yt "yt-dlp --add-metadata -i -o '%(upload_date)s-%(title)s.%(ext)s'"
    # abbr msync "rsync -avu --delete --no-perms '/home/cosmo/Música/' '/nfs/Homedir/a'"

    # starship prompt
    starship init fish | source
end
