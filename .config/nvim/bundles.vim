" Manage all of my plugins
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'chase/vim-ansible-yaml'
Plug 'chemzqm/vim-easygit'
Plug 'chemzqm/denite-git'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'elzr/vim-json'
Plug 'haya14busa/incsearch.vim'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-altr'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'leafgarland/typescript-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'PeterRincker/vim-argumentative'
Plug 'Quramy/vim-js-pretty-template'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'SirVer/ultisnips'
Plug 'sjl/gundo.vim'
Plug 'tmhedberg/matchit'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'xolox/vim-shell'
Plug 'xolox/vim-misc'
Plug 'Yggdroot/indentLine'
Plug 'carlitux/deoplete-ternjs'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
call plug#end()
