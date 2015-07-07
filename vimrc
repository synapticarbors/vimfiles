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
"Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'mileszs/ack.vim'
Plugin 'ervandew/supertab'
Plugin 'JuliaLang/julia-vim'

" vim-scripts repos
"Bundle 'UltiSnips'
call vundle#end()

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

scriptencoding utf-8
set encoding=utf-8

set lines=50 columns=120
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
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['html'] }
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_python_flake8_args='--ignore=E128,E501'
"let g:syntastic_error_symbol       = '✗'
"let g:syntastic_warning_symbol     = '⚠'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Ack
nnoremap <leader>a :Ack!<space>

" Powerline
"let g:Powerline_symbols = 'fancy'
set guifont=Inconsolata\ for\ Powerline:h15
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
if has("win32")
	set term=xterm
else
	set term=xterm-256color
endif

set termencoding=utf-8

if has("gui_running")
   let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set guifont=Inconsolata\ for\ Powerline:h15
       endif
   endif


func! WordProcessorMode()
    setlocal formatoptions=t1
    setlocal textwidth=80
    map j gj
    map k gk
    set complete+=s
    set formatprg=par
    setlocal smartindent
    setlocal spell spelllang=en_us
    setlocal noexpandtab
endfu
com! WP call WordProcessorMode()
