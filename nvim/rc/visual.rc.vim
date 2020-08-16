" filetype plugin indent on
set number
set ruler
set cursorline

set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

colorscheme molokai

set laststatus=2

set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L.\ col\ %c)\

" airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
