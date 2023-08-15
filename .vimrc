set nocompatible
filetype plugin indent on

" Use 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4

" Show tabs, trailing spaces, etc
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Relative line numbers. One thing I don't like about this is copying text
" with the mouse now includes line numbers. I don't like 'mouse=a' for various
" reasons, so that leaves me with clipboard support: use vim-gtk3 and "+y
"
" Or I can use block select (cmd+drag or alt+drag in some terminals)
set relativenumber

" Don't insert comment leader if I hit 'o' or <Enter>.
" set formatoptions alone wouldn't work here as it would be overridden by
" filetype plugin
au FileType * setl formatoptions-=ro

" Don't highlight search and don't jump while I'm typing
set nohlsearch
set noincsearch
