set background=dark
set number
syntax enable
"" set expandtab
"" set shiftwidth=2
"" set softtabstop=2
"" set autoindent
set showcmd
set ruler
nnoremap <esc> :noh<return><esc>
nnoremap <C-a> ggVG

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:airline_powerline_fonts = 1
let g:airline_theme = 'cobalt2'
