set background=dark
set number
syntax enable
set ignorecase
"" Use system clipboard by default
"set clipboard+=unnamedplus

" Set tabs to default to four spaces
" This will be overridden by vim-sleuth and editorconfig
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent

" use j/k to move screen lines *useful for soft wrapping)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" wrap at word boundaries
set linebreak

" ==> Disable vim-polyglot's:
"   - 'vim-sleuth' feature
"   - vim-sensible (maybe enable later but not now)
let g:polyglot_disabled = ['autoindent', 'sensible']

" Map escape to clear search highlighting
nnoremap <esc> :noh<return><esc>

" Highlight current line number and line
" Makes it easier to find where the cursor is
set cursorline

" Enable mouse support
set mouse=a

" Change characters in `:set list`
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»


" ==> More natural split opening
set splitbelow
set splitright


" Italicize comments
highlight Comment cterm=italic


set scrolloff=5


" ==> Make navigation between splits easier
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>


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
call plug#begin(stdpath('data') . '/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-signify'
Plug 'mbbill/undotree'
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile' }
Plug 'fannheyward/coc-pyright', { 'do': 'yarn install --frozen-lockfile' }
Plug 'clangd/coc-clangd', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-rust-analyzer', {'do': 'yarn install --frozen-lockfile'}

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()


" ==> Completion keybinds
" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" use tab and shift-tab to move between autocomplete options
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nmap <leader>p <Plug>(coc-format)
vmap <leader>p <Plug>(coc-format-selected)

" Undo tree
nnoremap <F5> :UndotreeToggle<CR>


" ==> Theme settings
try
    colorscheme nord
catch
    echo "warning: Could not enable nord colorscheme, is nord-vim installed?"
endtry

hi StatusLine ctermbg=none


" ==> Tab setting keybinds
command RealTab set shiftwidth=0 | set softtabstop=0 | set noexpandtab | set noautoindent
command -nargs=1 SpaceTab set shiftwidth=<args> | set softtabstop=<args> | set expandtab | set autoindent

" Fix `<` syntax highlighting in markdown
" https://github.com/plasticboy/vim-markdown/issues/138
"syn clear htmlTag
"syn region htmlTag start=+<[^/]+ end=+>+ fold oneline contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster
