
"Set shell to /bin/sh
set shell=/bin/sh

"Pathogen commands
execute pathogen#infect()
syntax on
filetype plugin indent on

"Airline configuration
set laststatus=2
let g:airline_theme='powerlineish'
let g:airline#extensions#branch#enabled = 1
"let g:airline_powerline_fonts = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

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

"Remap shift-k to insert a new line
nmap <S-k> i<CR><Esc>k$

