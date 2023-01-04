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

set virtualedit+=block

nnoremap ; :
vnoremap ; :
" inoremap uh <esc>

set background=dark
set number
set nu rnu 
set re=2

set scrolloff=8

colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
