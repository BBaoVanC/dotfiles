set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Set colors to dark mode
set background=dark
" Show line numbers
set number
" Enable syntax highlighting
syntax enable

" Set tabs to four spaces
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent

set showcmd
set ruler

" Map escape to clear search highlighting
nnoremap <esc> :noh<return><esc>

" Enable mouse support
set mouse=a

" Change characters in `:set list`
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»


" ==> More natural split opening
set splitbelow
set splitright


" ==> Make navigation between splits easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" ==> Keybinds to search for selected text, forwards or backwards using * and #
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


" ==> Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-signify'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-sleuth'
Plug 'preservim/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin' |
    \ Plug 'ryanoasis/vim-devicons'

" Debug (currently not working)
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Plug 'idanarye/vim-vebugger'
call plug#end()


" ==> Nerd Tree settings
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0
let NERDTreeShowHidden=1


" ==> Completion keybinds
" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" use tab and shift-tab to move between autocomplete options
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nmap <leader>p <Plug>(coc-format)
vmap <leader>p <Plug>(coc-format-selected)


" ==> Theme settings
colorscheme nord
let g:airline_powerline_fonts = 1
let g:airline_theme = 'nord'


" ==> Tab setting keybinds
command RealTab set shiftwidth=0 | set softtabstop=0 | set noexpandtab | set noautoindent
command -nargs=1 SpaceTab set shiftwidth=<args> | set softtabstop=<args> | set expandtab | set autoindent
