" This is standard pathogen and Vim setup
" runtime bundle/vim-pathogen/autoload-pathogen.vim
set nocompatible
call pathogen#infect() 
set number
syntax on
filetype plugin indent on

let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Paredit
let g:paredit_mode = 0

autocmd BufRead,BufNewFile *.cljc setlocal filetype=clojure

autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure

" Finding Files

set path+=**
set wildmenu

" File Browsing

