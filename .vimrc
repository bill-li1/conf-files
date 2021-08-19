set nocompatible
filetype off
syntax on

" annoying
set autoindent
set shiftround
set noswapfile
set cindent
set tabstop=2
set shiftwidth=2

" search stuff
set ignorecase 
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault
noremap <space><space> :noh<cr>:call clearmatches()<cr>

set virtualedit+=block

nnoremap ; :
vnoremap ; :
inoremap uh <esc>

map <F1> :w <CR> :!g++-11 % -o a <CR>

set number
set guicursor=

colorscheme gruvbox


