set nocompatible
filetype plugin indent on

" Language server plugin
call plug#begin()
Plug 'prabirshrestha/vim-lsp'
call plug#end()

" Use 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4

" Show tabs, trailing spaces, etc
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Relative line numbers.
set relativenumber

" Don't insert comment leader if I hit 'o' or <Enter>.
" set formatoptions alone wouldn't work here as it would be overridden by
" filetype plugin
au FileType * setl formatoptions-=ro

" Don't highlight search and don't jump while I'm typing
set nohlsearch
set noincsearch

" Set up verilog language server if available
if executable('svls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'svls',
        \ 'cmd': {server_info->['svls']},
        \ 'whitelist': ['systemverilog'],
        \ })
endif
