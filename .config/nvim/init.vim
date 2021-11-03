let mapleader=" "

"install vim-plug: https://github.com/junegunn/vim-plug#unix-linux
call plug#begin('~/.config/nvim/plugged')
    Plug 'preservim/nerdtree'
call plug#end()

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
    filetype plugin indent on
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab

"quick save!!
    map <leader><leader> :w<CR>

"Toggle line numbers
    nnoremap <F2> :set nonumber! norelativenumber!<CR>
    "inoremap <F2> <C-o> :set nonumber! norelativenumber!<CR>
    "cnoremap <F2> <C-c> :set nonumber! norelativenumber!<CR>

"NERDTreeToggle when <F3>    
    "F3 remap in normal mode
    noremap <F3> :NERDTreeToggle<CR>
    "F3 remap in insert mode
    "inoremap <F3> <C-o>:NERDTreeToggle<CR>
    "F3 remap in command mode
    "cnoremap <F3> <C-c>:NERDTreeToggle<CR>

"NERDTree show hidden files by default
    let NERDTreeShowHidden=1

