set background=dark
set number
set smartcase
set ignorecase
set incsearch
"" Use system clipboard by default
"set clipboard+=unnamedplus
set indentkeys=""
" allow indenting of preprocessor macros
set cinkeys-=0#

" Set tabs to default to four spaces
" This will be overridden by vim-sleuth and editorconfig
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent


" prevent indentation from being deleted if line starts with `#`
inoremap # X#


" use j/k to move screen lines *useful for soft wrapping)
"noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
"noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" soft wrap at word boundaries to look nicer
"set linebreak

" Map escape to clear search highlighting
nnoremap <esc> :noh<return>

" highlight current line number and line
" makes it easier to find where the cursor is
set cursorline

" enable mouse support
set mouse=a

" display characters for `:set list`
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»


" more natural split opening
set splitbelow
set splitright


" leave some lines of space behind/in front of cursor line when scrolling
set scrolloff=5


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
Plug 'BBaoVanC/bobascheme', { 'rtp': 'neovim' }
Plug 'ap/vim-css-color'
Plug 'mhinz/vim-signify'
Plug 'mbbill/undotree'
Plug 'tpope/vim-sleuth'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'whiteinge/diffconflicts'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'stevearc/oil.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" https://github.com/rust-lang/rust.vim#installation
syntax enable
filetype plugin indent on


nnoremap <F5> :UndotreeToggle<CR>


" telescope.nvim binds
nnoremap <Leader>ff <Cmd>Telescope find_files<CR>
nnoremap <Leader>fg <Cmd>Telescope live_grep<CR>
nnoremap <Leader>fG <Cmd>Telescope grep_string<CR>
nnoremap <Leader>fb <Cmd>Telescope buffers<CR>
nnoremap <Leader>fh <Cmd>Telescope help_tags<CR>


try
  colorscheme bobaschemedark
catch
  echo "Error loading color scheme: " . v:exception
endtry

" is default with regular vim, only show statusline if multiple splits
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


" vim-signify
let g:signify_sign_add      = '┃'
let g:signify_sign_delete   = '┃'
let g:signify_sign_change   = '┃'


" vimtex
let g:vimtex_view_method = 'zathura'


" markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_auto_insert_bullets = 0
" vim-markdown readme says I want this but it doesnt make any difference, I'll
" keep it here just in case
" let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_strikethrough = 1


" use tab to move between autocomplete options
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <down> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <up> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" use enter to accept completion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>


" disable auto indent
let g:sleuth_no_filetype_indent_on = 1
filetype indent off


" F10 to see highlight group under cursor, for theme debug
nnoremap <F10> :Inspect<CR>
nnoremap <S-F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


" snippets
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" treesitter config
lua << EOF
require("nvim-treesitter.configs").setup({
  -- no need for ensure_installed since auto_install covers it
  auto_install = true,
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,

    -- covered by vimtex plugin
    disable = { "latex" }
  },
})
--vim.wo.foldmethod = 'expr'
--vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
EOF

lua require("oil").setup()
