" ==============================================================================
" Plugins using vim-plug
" ==============================================================================

call plug#begin()
Plug 'ConradIrwin/vim-bracketed-paste'  " No more `:set paste`
Plug 'digitaltoad/vim-pug'              " syntax highlight for pug language
Plug 'janko/vim-test'                   " Test commands
Plug 'ntpeters/vim-better-whitespace'   " show trailing whitespaces
Plug 'tpope/vim-bundler'                " bundle commands
Plug 'tpope/vim-commentary'             " easy commenting
Plug 'tpope/vim-dispatch'               " Dispatching commands
Plug 'tpope/vim-endwise'                " auto add 'end'
Plug 'tpope/vim-fugitive'               " git commands
Plug 'tpope/vim-rails'                  " rails commands
Plug 'tpope/vim-rake'                   " rake commands
Plug 'tpope/vim-repeat'                 " more repeatings with .
Plug 'tpope/vim-surround'               " surroundings
Plug 'vim-ruby/vim-ruby'                " ruby commands

" New plugins after migrating to neovim
Plug 'RRethy/nvim-treesitter-endwise'
Plug 'dense-analysis/ale'
Plug 'dracula/vim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'glepnir/lspsaga.nvim'

Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'metakirby5/codi.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'run': 'make'}
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'onsails/lspkind.nvim'
Plug 'tzachar/fuzzy.nvim', {'requires': 'nvim-telescope/telescope-fzf-native.nvim'}
Plug 'zbirenbaum/copilot.lua'
Plug 'zbirenbaum/copilot-cmp'

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

" Run javascript with vitest
let g:test#javascript#runner = "vitest"

" Use the dispatch strategy
let test#strategy = "dispatch"


" ==============================================================================
" Asynchronous Lint Engine
" ==============================================================================

" let g:ale_linters = {
" \  '*': ['remove_trailing_lines', 'trim_whitespace'],
" \  'ruby': ['standardrb', 'rubocop'],
" \  'yaml': ['actionlint'],
" \  'vue': ['eslint'],
" \  'python': ['black'],
" \  'javascript': ['eslint']
" \}

let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['eslint'],
\  'json': ['eslint'],
\  'ruby': ['standardrb', 'rubocop'],
\  'scss': ['eslint'],
\  'vue': ['eslint', 'volar'],
\}

let g:ale_ruby_rubocop_options = "--config .rubocop.yml"

let g:ale_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 0
" let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
" let g:ale_lint_on_enter = 1

" Disable and enable fixers
command! ALEDisableFixers       let g:ale_fix_on_save=0
command! ALEEnableFixers        let g:ale_fix_on_save=1
command! ALEDisableFixersBuffer let b:ale_fix_on_save=0
command! ALEEnableFixersBuffer  let b:ale_fix_on_save=1


" ==============================================================================
" General settings
" ==============================================================================

language en_US

set clipboard+=unnamedplus      " Fix clipboard for neovim
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

nnoremap <Leader>ad :ALEDisable<CR>
nnoremap <Leader>bi :Bundle<CR>
nnoremap <Leader>bs :Bsplit<Space>

nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <Leader>d :Lspsaga hover_doc<CR>
nnoremap <Leader>sa :Lspsaga code_action<CR>
nnoremap <Leader>sd :Lspsaga show_cursor_diagnostics<CR>
nnoremap <Leader>sp :Lspsaga peek_definition<CR>

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
nnoremap <Leader>ve :tabe ~/.config/nvim/init.vim<CR>
nnoremap <Leader>vi :source ~/.config/nvim/init.vim<CR>:PlugInstall<CR>
nnoremap <Leader>vs :source ~/.config/nvim/init.vim<CR>
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

lua << EOF
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-a>"] = { "<home>", type = "command" },
        ["<C-e>"] = { "<end>", type = "command" },
      }
    }
  },
  pickers = {
    find_files = {
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
  },
}
EOF

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
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

lua << EOF
  -- Setup Ruby Solargraph
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  require('lspconfig').solargraph.setup({
    capabilities = capabilities
  })

  -- Setup Typescript Language Server
  require('lspconfig').tsserver.setup({
    capabilities = capabilities
  })

  -- Setup Volar for vue
  require('lspconfig').volar.setup({
    capabilities = capabilities,
    filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
    init_options = {
      typescript = {
        tsdk = '/usr/local/lib/node_modules/typescript/lib'
      }
    }
  })
EOF

" ==============================================================================
" Treesitter
" ==============================================================================

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = "all",

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

  -- Use endwise to automatically add `end` for Ruby
  endwise = {
    enable = true,
  },
}
EOF


" ==============================================================================
" Auto Completion
" ==============================================================================

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
  end

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      ["<Tab>"] = vim.schedule_wrap(function(fallback)
        if cmp.visible() and has_words_before() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end),

      -- ["<Tab>"] = cmp.mapping(function(fallback)
      --   if cmp.visible() then
      --     cmp.select_next_item()
      --   elseif vim.fn["vsnip#available"](2) == 1 then
      --     feedkey("<Plug>(vsnip-expand-or-jump)", "")
      --   elseif has_words_before() then
      --     cmp.complete()
      --   else
      --     fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      --   end
      -- end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          feedkey("<Plug>(vsnip-jump-prev)", "")
        end
      end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
      { name = 'copilot', group_index = 2 },
      { name = 'nvim_lsp', group_index = 2 },
      { name = 'fuzzy_buffer', group_index = 2 },
      { name = 'vsnip', group_index = 2 },
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'fuzzy_buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
EOF


" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
" nmap        s   <Plug>(vsnip-select-text)
" xmap        s   <Plug>(vsnip-select-text)
" nmap        S   <Plug>(vsnip-cut-text)
" xmap        S   <Plug>(vsnip-cut-text)

" let g:vsnip_filetypes = {}
" let g:vsnip_filetypes.javascriptreact = ['javascript']
" let g:vsnip_filetypes.typescriptreact = ['typescript']
" let g:vsnip_filetypes.ruby = ['rails']

" ==============================================================================
" Lspsaga
" ==============================================================================

lua <<EOF
local saga = require('lspsaga')

saga.setup({
  debug = true,
  symbol_in_winbar = {
    enable = false,
  },
  use_saga_diagnostic_sign = false,
  finder_action_keys = {
    open = "o",
    vsplit = "v",
    split = "s",
    quit = {"q", [[\<ESC>]]}
  }
})
EOF

" ==============================================================================
" Copilot
" ==============================================================================

lua << EOF
require('copilot').setup({
  panel = { enabled = false },
  suggestion = { enabled = false },
  filetypes = {
    javascript = true,
    typescript = true,
    ruby = true,
    ["*"] = false,
  },
  copilot_node_command = 'node',
  server_opts_overrides = {},
})

require('copilot_cmp').setup({
  formatters = {
    label = require("copilot_cmp.format").format_label_text,
    insert_text = require("copilot_cmp.format").format_insert_text,
    preview = require("copilot_cmp.format").deindent,
  },
})
EOF
