set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Bundler for vim, use :BundleInstall to install these bundles and
" :BundleUpdate to update all of them
Plugin 'gmarik/Vundle.vim'

" Github based bundles
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'mileszs/ack.vim'
Plugin 'ervandew/supertab'
Plugin 'JuliaLang/julia-vim'
Plugin 'PProvost/vim-ps1'
Plugin 'rust-lang/rust.vim'

" vim-scripts repos
"Bundle 'UltiSnips'
call vundle#end()
filetype plugin indent on

filetype plugin indent on
filetype on

syntax enable

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set modelines=0

set hidden

set ruler
if version >= 703
    set relativenumber
else
    set number
endif

set cursorline
set laststatus=2

set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

inoremap jk <esc>
let mapleader = ","

noremap j gj
noremap k gk

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 "textwidth=79

" yaml indentation
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" Color scheme
let g:solarized_contrast="high"
colorscheme solarized

if has('gui_running')
    set background=light
    set guifont=Menlo:h12

else
    set background=dark
endif

" Enable syntastic syntax checking
let g:syntastic_check_on_open = 1
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': ['python', 'cython'],
    \ 'passive_filetypes': ['html'] }
let g:syntastic_enable_signs=1
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_aggregate_errors = 1
"let g:syntastic_quiet_messages = {'level': 'warnings'}
"let g:syntastic_python_checker_args='--ignore=E128,E501'
let g:syntastic_python_pep8_args = "--ignore=E126,E127,E128,E501"
let g:syntastic_error_symbol       = '✗'
let g:syntastic_warning_symbol     = '⚠'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Ack
nnoremap <leader>a :Ack!<space>

" Powerline
let g:Powerline_symbols = 'fancy'
set guifont=Inconsolata\ for\ Powerline:h15
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

if has("gui_running")
   let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set guifont=Inconsolata\ for\ Powerline:h15
       endif
   endif


" CDC = Change to directory of the current file
command CDC lcd %:p:h


" Macro for QTP consolation types
let @q = 'yyppppkkk:.s/ex5/qu5/gj:.s/ex5/b4/gj:.s/ex5/b4s5/gj:.s/ex5/b3/g'

autocmd BufWritePre *.py,*.pyx %s/\s\+$//e


" Rust
let g:rustfmt_autosave = 1
