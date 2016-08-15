" ==============================================================================
" Vundle
" ==============================================================================

set nocompatible " Required by vundle
filetype off     " Required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'             " let Vundle manage Vundle, required

Plugin 'ctrlpvim/ctrlp.vim'               " full path fuzzy finder
Plugin 'ervandew/supertab'                " tab completion
Plugin 'ngmy/vim-rubocop'                 " rubocop integration
Plugin 'ntpeters/vim-better-whitespace'   " show trailing whitespaces
Plugin 'tpope/vim-bundler'                " bundle commands
Plugin 'tpope/vim-fugitive'               " git commands
Plugin 'tpope/vim-jdaddy'                 " format JSON with gqaj
Plugin 'tpope/vim-rails'                  " rails commands
Plugin 'tpope/vim-rake'                   " rake commands
Plugin 'tpope/vim-repeat'                 " more repeatings with .
Plugin 'tpope/vim-surround'               " surroundings
Plugin 'vim-ruby/vim-ruby'                " ruby commands

Plugin 'tpope/vim-haml'                   " syntax highlight .haml
Plugin 'tpope/vim-markdown'               " syntax highlight .md
Plugin 'kchmck/vim-coffee-script'         " syntax highlight .coffee
Plugin 'groenewege/vim-less'              " syntax highlight .less
Plugin 'slim-template/vim-slim.git'       " syntax highlight .slim

Plugin 'nanotech/jellybeans.vim'          " colorscheme

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Use the colorscheme from above
colorscheme jellybeans


" ==============================================================================
" Ruby stuff
" ==============================================================================

synax on                 " Enable syntax highlighting

" Enable built-in matchit plugin
runtime macros/matchit.vim


" ==============================================================================
" Leader mappings
" ==============================================================================

let mapleader = ","

nmap <Leader>vi :source ~/.vimrc<CR>:PluginInstall<CR>
map <Leader>ve :tabe ~/.vimrc<CR>
