set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set background=dark
set number
syntax enable

set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent

set showcmd
set ruler
nnoremap <esc> :noh<return><esc>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
Plug 'ap/vim-css-color'
call plug#end()

colorscheme nord
let g:airline_powerline_fonts = 1
let g:airline_theme = 'nord'

set mouse=a

command RealTab set shiftwidth=0 | set softtabstop=0 | set noexpandtab | set noautoindent
command SpaceTab set shiftwidth=4 | set softtabstop=4 | set expandtab | set autoindent
