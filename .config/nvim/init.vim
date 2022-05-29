set background=dark
set number
syntax enable
set ignorecase
set incsearch
"" Use system clipboard by default
"set clipboard+=unnamedplus
set indentkeys=""

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
"set linebreak

" ==> Disable vim-polyglot's:
"   - 'vim-sleuth' feature
"   - vim-sensible (maybe enable later but not now)
let g:polyglot_disabled = ['autoindent', 'sensible']

" Map escape to clear search highlighting
nnoremap <esc> :noh<return>

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
Plug 'BBaoVanC/onehalf', { 'rtp': 'vim', 'branch': 'bbaovanc' }
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-signify'
Plug 'mbbill/undotree'
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'sbdchd/neoformat'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


" Undo tree
nnoremap <F5> :UndotreeToggle<CR>


" ==> Theme settings
try
    autocmd vimenter * ++nested colorscheme onehalfdark
catch
    echo "warning: Could not enable colorscheme, is it installed?"
endtry

"hi StatusLine ctermbg=none
"set laststatus=1


" ==> https://github.com/morhetz/gruvbox/wiki/Terminal-specific#0-recommended-neovimvim-true-color-support
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


" ==> Tab setting keybinds
command RealTab set shiftwidth=0 | set softtabstop=0 | set noexpandtab | set noautoindent
command -nargs=1 SpaceTab set shiftwidth=<args> | set softtabstop=<args> | set expandtab | set autoindent

" Fix `<` syntax highlighting in markdown
" https://github.com/plasticboy/vim-markdown/issues/138
"syn clear htmlTag
"syn region htmlTag start=+<[^/]+ end=+>+ fold oneline contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster


" Italicize comments
highlight Comment cterm=italic


" markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_auto_insert_bullets = 0
" vim-markdown readme says I want this but it doesnt make any difference, I'll
" keep it here just in case
" let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_strikethrough = 1


" ==> coc.nvim
let g:coc_global_extensions = ['coc-json', 'coc-tsserver']
" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" use tab to move between autocomplete options
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <down> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <up> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" use \p to format text
nmap <leader>p <Plug>(coc-format)
vmap <leader>p <Plug>(coc-format-selected)
