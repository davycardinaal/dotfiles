" ==============================================================================
" Plugins using vim-plug
" ==============================================================================

call plug#begin()
Plug 'ervandew/supertab'                " tab completion
Plug 'ntpeters/vim-better-whitespace'   " show trailing whitespaces
Plug 'tpope/vim-bundler'                " bundle commands
Plug 'tpope/vim-fugitive'               " git commands
Plug 'tpope/vim-commentary'             " easy commenting
Plug 'tpope/vim-endwise'                " auto add 'end'
Plug 'tpope/vim-rails'                  " rails commands
Plug 'tpope/vim-rake'                   " rake commands
Plug 'tpope/vim-repeat'                 " more repeatings with .
Plug 'tpope/vim-surround'               " surroundings
Plug 'vim-ruby/vim-ruby'                " ruby commands
Plug 'janko/vim-test'                   " Test commands
Plug 'tpope/vim-dispatch'               " Dispatching commands
Plug 'ConradIrwin/vim-bracketed-paste'  " No more `:set paste`

Plug 'dense-analysis/ale'
Plug 'dracula/vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" ==============================================================================
" Colors
" ==============================================================================
if (has('termguicolors'))
  set termguicolors
endif
syntax enable
colorscheme dracula


" ==============================================================================
" Ruby stuff
" ==============================================================================

syntax on                 " Enable syntax highlighting

" Enable built-in matchit plugin
runtime macros/matchit.vim

" Run RSpec with bin/rspec
let test#ruby#use_binstubs = 1


" ==============================================================================
" Asynchronous Lint Engine
" ==============================================================================

let g:ale_linters = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'ruby': ['rubocop', 'standardrb'],
\  'vue': ['eslint'],
\  'python': ['black'],
\  'javascript': ['eslint']
\}

let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'scss': ['prettier'],
\  'javascript': ['eslint', 'prettier'],
\  'json': ['prettier'],
\  'python': ['black'],
\  'vue': ['eslint', 'prettier'],
\  'ruby': ['prettier', 'rubocop', 'standardrb']
\}

let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1


" ==============================================================================
" General settings
" ==============================================================================

set nobackup                    " Don't keep backups of files
set nowritebackup               " Don't make backups when writing to files
set history=500                 " keep 500 lines of command line history
set ruler                       " show the cursor position all the time
set showmode                    " show insert, replace or visual status
set showcmd                     " display incomplete commands
set nocursorline                " don't highlight current line
set incsearch                   " do incremental searching
set hlsearch                    " highlight search matches
set backspace=indent,eol,start  " backspace over everything in insert mode
set wildmenu                    " enhanced command line completion
set wildmode=list:longest,full  " list all, complete to longest, cycle full
set autoindent                  " Automatically indent new lines
set encoding=utf-8              " Best for MacVim/gVim and utf-8 terminals
set autoread                    " Automatically reread externally changed files
set gdefault                    " Always set g flag on regexes
set matchpairs+=<:>             " Match <> with %
set vb t_vb=                    " Disable beeping completely
set splitbelow                  " Enable split below
set splitright                  " Enable split right
set ignorecase                  " Ignore case in search patterns
set smartcase                   " Don't ingore case if searching with upper case
set scrolloff=3                 " Number of lines to keep above/below the cursor
set bg=dark                     " Always use dark background
set guifont=Ayuthaya:h18        " Set a default font
set laststatus=2                " Always display the status line
set tabstop=2                   " Number of spaces that for a <Tab>
set shiftwidth=2                " Number of spaces to use for (auto)indent
set shiftround                  " Round indent to multiple of 'shiftwidth'
set expandtab                   " Convert tabs to spaces in insert mode
set smarttab                    " Insert blanks (shiftwidth amount) on newline
set wrap                        " Wrap by default
set whichwrap=b,s,<,>,[,]       " Cursor keys move from eol to start of next line


" ==============================================================================
" Leader mappings
" ==============================================================================

let mapleader = ","

nnoremap <Leader>bi :Bundle<CR>
nnoremap <Leader>bs :Bsplit<Space>
nnoremap <Leader>da :ALEDisable<CR>
nnoremap <Leader>ex :Explore<CR>
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gst :Gstatus<CR>
nnoremap <Leader>h :nohlsearch<CR>
nnoremap <Leader>n :cn<CR>
nnoremap <Leader>p :cp<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>r :redraw!<CR>
nnoremap <Leader>sw :StripWhitespace<CR>
nnoremap <Leader>tn :TestNearest<CR>
nnoremap <Leader>tf :TestFile<CR>
nnoremap <Leader>ts :TestSuite<CR>
nnoremap <Leader>tl :TestLast<CR>
nnoremap <Leader>tg :TestVisit<CR>
nnoremap <Leader>ve :tabe ~/.vimrc<CR>
nnoremap <Leader>vi :source ~/.vimrc<CR>:PlugInstall!<CR>
nnoremap <Leader>vs :source ~/.vimrc<CR>
nnoremap <Leader>w :w<CR>
map <Leader>/ gcc


" ==============================================================================
" Other mappings
" ==============================================================================

" Easy access to the start of the line
nnoremap 0 ^

" Disable Ex mode, remap Q to formatting
nnoremap Q gq<CR>

" Indent and automatically re-select
vnoremap > >gv
vnoremap < <gv

" Save text to clipboard in visual mode by hitting ctrl-c
vnoremap <C-c> :w !pbcopy<CR><CR>


" ==============================================================================
" Telescope
" ==============================================================================
" telescope.nvim is a highly extendable fuzzy finder over lists.

" Move up and down through the results using <C-k> and <C-j>
lua << EOF
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
        ["<C-j>"] = require('telescope.actions').move_selection_next
      }
    }
  }
}
EOF

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope git_files<cr>
nnoremap <leader>fa <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope resume<cr>

" Search for the string under your cursor with Telescope
nnoremap K :lua require('telescope.builtin').grep_string()<cr>


" ==============================================================================
" LSP Config
" ==============================================================================
" LSP facilitates features like go-to-definition, find-references, hover,
" completion, rename, format, refactor, etc., using semantic whole-project
" analysis.


" ==============================================================================
" Treesitter
" ==============================================================================

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "bash", "c", "comment", "css", "dockerfile", "help",
  "javascript", "json", "lua", "markdown", "pug", "ruby", "scss", "tsx",
  "typescript", "vim", "yaml" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
    --     local max_filesize = 100 * 1024 -- 100 KB
    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --     if ok and stats and stats.size > max_filesize then
    --         return true
    --     end
    -- end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
