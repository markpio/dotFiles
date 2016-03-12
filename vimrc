
"Pathogen commands
execute pathogen#infect()
syntax on
filetype plugin indent on

"Airline configuration
set laststatus=2
let g:airline_theme='powerlineish'
let g:airline#extensions#branch#enabled = 1
"let g:airline_powerline_fonts = 1

"bufferline key remaps
nmap [ :bprevious<CR>
nmap ] :bnext<CR>

"Set tabs/spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set autoindent
set smartindent
set cindent

set number
set nowrap

"Search highlighting
set hlsearch
nnoremap <cr> :nohlsearch<cr>

"Colors stuff
set t_Co=256
colorscheme wombat256

let @i = 'v%€ku><<'

"Remap shift-J to insert a new line
nmap <S-h> i<CR><Esc>k$

