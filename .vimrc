syntax on
set nocompatible
set hidden
set relativenumber

set wildmenu
set wildmode=longest:full,full

set ignorecase
set smartcase
set incsearch

set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set smartindent
set scrolloff=4

let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"
set ttimeout
set ttimeoutlen=1
set ttyfast

nnoremap <S-l> :bn<CR>
nnoremap <S-h> :bp<CR>
nnoremap <S-l> :b#<CR>
nnoremap <Esc> :update<Cr>
nnoremap <CR> o<Esc>
