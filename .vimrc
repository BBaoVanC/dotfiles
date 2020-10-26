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

if has('nvim')
  if empty(glob('${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ""autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
elseif empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ""autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:airline_powerline_fonts = 1
let g:airline_theme = 'cobalt2'
