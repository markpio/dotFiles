
"Set shell to /bin/bash
set shell=/bin/bash

syntax on
set hidden
filetype plugin indent on

"Pathogen commands
execute pathogen#infect()

"Airline configuration
set laststatus=2
let g:airline_theme='powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1

let font_file = expand("~/.vim/airline_font_setting.vim")
if filereadable(font_file)
    source ~/.vim/airline_font_setting.vim
endif

"Syntastic settigns
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

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
set incsearch
set hlsearch
set showcmd
set wildmenu
set cursorline

"Colors stuff
set t_Co=256
colorscheme wombat256

"Search highlighting
nnoremap <CR> :nohlsearch<CR>

"Remap shift-k to insert a new line
nmap <S-k> i<CR><Esc>k$

"Remap shift-k to insert a new line
nmap <F2> :NERDTreeToggle<CR>

"buffer key remaps
nmap [ :bprevious<CR>
nmap ] :bnext<CR>
nmap <silent> <leader>q :bp <BAR> sp <BAR> bn <BAR> bd <CR>

"Write to protected files
nmap <silent> <leader>w :w !sudo tee % > /dev/null <CR>

"Indent and unindent a block
nmap <silent> <leader>i >i{
nmap <silent> <leader>u <i{

"Remove trailing whitespace and tabs
nmap <silent> <leader>s :%s/\s\+$//g <BAR> nohlsearch <BAR> w <CR> <C-o>
nmap <silent> <leader>t :%s/\t/    /g <BAR> nohlsearch <BAR> w <CR> <C-o>

"Insert a tab in normal mode
nmap <TAB> i<TAB><ESC>l

"Ctags shortcuts
nmap <silent> <leader>f <C-]>
nmap <silent> <leader>F <C-w><C-]>
nmap <silent> <leader>b <C-t>
