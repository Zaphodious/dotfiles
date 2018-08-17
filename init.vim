" This is standard pathogen and Vim setup
" runtime bundle/vim-pathogen/autoload-pathogen.vim
set nocompatible
" call pathogen#infect() 
set number relativenumber

" Begin executing Vundle script
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-vinegar'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'eraserhd/parinfer-rust'
" Plugin 'https://github.com/tpope/vim-fugitive.git'
Plugin 'ervandew/supertab'
Plugin 'https://github.com/tpope/vim-commentary.git'
Plugin 'flazz/vim-colorschemes'
Plugin 'https://gitlab.com/Lenovsky/nuake.git'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'gabrielelana/vim-markdown'
" Plugin 'godlygeek/tabular'

call vundle#end()
" Now that Vundle is over, we can make things look pretty again

syntax on
filetype plugin indent on

" If the plugins are installed, it will use alduin. If not, elflord
colorscheme elflord
let g:alduin_Shout_Dragon_Aspect = 1
colorscheme alduin

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15

let g:markdown_enable_spell_checking = 0

" Paredit
let g:paredit_mode = 0

autocmd BufRead,BufNewFile *.cljc setlocal filetype=clojure

autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure

" Finding Files

set path+=**
set wildmenu

let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 0

let g:airline#extensions#tabline#enabled = 1

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

syntax match clojureSymbol "*"

nnoremap <C-i> :Nuake<CR>
inoremap <C-i> <C-\><C-n>:Nuake<CR>
tnoremap <C-i> <C-\><C-n>:Nuake<CR>
nnoremap <C-c> :q<CR>
inoremap <C-c> <C-\><C-n>:q<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <C-\><C-n>:w<CR>

nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-l> <C-w>l 
