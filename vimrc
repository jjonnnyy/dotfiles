call pathogen#infect()
set wildmenu
set colorcolumn=101

filetype plugin on
filetype indent on
syntax on

set autoread
set nu

" Spell Check "
set spelllang=en_gb

" Some bindings "
map <F2> :setlocal spell!<cr>
map <F3> :setlocal nu!<cr>
map <F6> :tabp<cr>
map <F7> :tabn<cr>
" CTRL-X is Cut
vnoremap <C-X> "+x
" CTRL-C is Copy
vnoremap <C-C> "+y
" CTRL-V is Paste
map <C-V> "+gP


" Tabbing "
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set ai "Auto indent
set si "Smart indent

set wrap "Wrap lines
set lbr
set tw=100

set ignorecase
set smartcase
set hlsearch
