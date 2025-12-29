set nocompatible

" Use 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4

" Show tabs, trailing spaces, etc
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Remap leader
let mapleader = ","

" Relative line numbers and a mapping to toggle it
set relativenumber
nnoremap <leader>rn :set relativenumber!<CR>

" No mouse support
set mouse=

" Don't insert comment leader if I hit 'o' or <Enter>.
" set formatoptions alone wouldn't work here as it would be overridden by
" filetype plugin
au FileType * setl formatoptions-=ro

" Don't highlight search and don't jump while I'm typing
set nohlsearch
set noincsearch
