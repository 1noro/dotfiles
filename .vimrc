let mapleader=" "
"some basics
    syntax on
    set encoding=utf-8
    set number relativenumber
"enable autocompletion
    set wildmode=longest,list,full
"show whitespaces
"(https://stackoverflow.com/questions/12534313/vim-set-list-as-a-toggle-in-vimrc)
"(https://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character)
    "set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
    set listchars=eol:¬,tab:--,trail:~,extends:>,precedes:<,space:·
    "set list
    "F5 remap in normal mode
    noremap <F5> :set list!<CR>
    "F5 remap in insert mode
    inoremap <F5> <C-o>:set list!<CR>
    "F5 remap in command mode
    cnoremap <F5> <C-c>:set list!<CR>
"disables automatic completion on new line
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o 
"spell-check set to <leader>o, 'o' for 'orthography'
    map <leader>o :setlocal spell! spelllang=es_es<CR>
"spaces instead of tabs
" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" expandtab:        When this option is enabled, vi will use spaces instead of tabs
    set tabstop     =4
    set softtabstop =4
    set shiftwidth  =4
    set expandtab
