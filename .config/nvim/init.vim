" ==============================================================================
" Plugins using vim-plug
" ==============================================================================

call plug#begin()

Plug 'ervandew/supertab'                " tab completion
Plug 'ngmy/vim-rubocop'                 " rubocop integration
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
Plug 'dense-analysis/ale'               " Asynchronous Lint Engine
Plug 'pangloss/vim-javascript'          " React


Plug 'tpope/vim-haml'                   " syntax highlight .haml
Plug 'tpope/vim-markdown'               " syntax highlight .md
Plug 'kchmck/vim-coffee-script'         " syntax highlight .coffee
Plug 'groenewege/vim-less'              " syntax highlight .less
Plug 'leafgarland/typescript-vim'       " syntax highlight .ts
Plug 'posva/vim-vue'                    " syntax highlight .vue
Plug 'keith/rspec.vim'                  " Better highlighting for rspec
Plug 'maxmellon/vim-jsx-pretty'         " Better highlighting for jsx

Plug 'dracula/vim'


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

" Set RuboCop config
let g:vimrubocop_config = '.rubocop.yml'


" ==============================================================================
" Linters
" ==============================================================================

let g:ale_linters = {
\  'ruby': ['standardrb'],
\  'vue': ['eslint'],
\  'python': ['black'],
\  'javascript': ['eslint']
\}

let g:ale_fixers = {
\  'scss': ['prettier'],
\  'javascript': ['prettier'],
\  'json': ['prettier'],
\  'python': ['black'],
\  'vue': ['prettier', 'eslint'],
\  'ruby': ['prettier']
\}

let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0


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
"
" telescope.nvim is a highly extendable fuzzy finder over lists.

call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

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
nnoremap F :lua require('telescope.builtin').grep_string()<cr>
