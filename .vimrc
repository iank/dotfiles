set nocompatible

if has('nvim')
    call plug#begin()
    Plug 'neovim/nvim-lspconfig'
    call plug#end()
endif

" Use 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4

" Show tabs, trailing spaces, etc
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Relative line numbers.
set relativenumber

" No mouse support
set mouse=

" Don't insert comment leader if I hit 'o' or <Enter>.
" set formatoptions alone wouldn't work here as it would be overridden by
" filetype plugin
au FileType * setl formatoptions-=ro

" Don't highlight search and don't jump while I'm typing
set nohlsearch
set noincsearch
