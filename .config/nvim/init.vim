set nocompatible
filetype off
" plugins
source $HOME/.config/nvim/bundles.vim
" new keybindings
source $HOME/.config/nvim/mappings.vim
" The usual filetype plugins
filetype indent plugin on
" Syntax highlighting
syntax on

" Ignore the case when the search contains only lowercase letters
set ignorecase
set smartcase

" So I can actually see where I am going
set scrolloff=5
set sidescrolloff=5

" Usefull for stacking windows and only showing the statusline
set winminheight=0

" Better completion options
set wildmenu
set wildmode=longest,full
set completeopt=longest,menuone,preview
set shortmess+=c

" Indentation settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set shiftround
set smarttab

" Allows to backspace over indents, end/start of the line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Only search the first and last line for mode
set modelines=1

" Remove mode indicator
set noshowmode

" List mode
set list
set listchars=tab:>-,trail:-

" highlight column 80
set colorcolumn=80

" Show the command line
set showcmd

" Search settings
set incsearch
set hlsearch

" Show relative line numbers
set relativenumber
" Also show current line number
set number

" Path settings
" Swap
set directory=/tmp
" Backup
set backupdir=~/.vim/backup
set backup
" Undo
set undodir=~/.vim/undo
set undofile
set undolevels=1000
" Tags
set tags=./tags;

" Reload files when changed on disk but not in vim
set autoread

" Allow for hidden buffers
set hidden

" Folds are evil
set nofoldenable

" More history
set history=1000

" Allow the cursor to be everywhere in all modes
set virtualedit=all

" Always show tabs
set showtabline=2

" Colorscheme
set background=dark
colorscheme solarized
hi Variable ctermfg=13
hi Member ctermfg=45
hi Namespace ctermfg=9

let g:load_doxygen_syntax=1
let g:php_sql_query = 1

" Font and encoding
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
" set guifontwide=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
let g:airline_powerline_fonts = 1
set encoding=utf-8

" Language
set spelllang=

"Disable the annoying bell
set vb t_vb=

" diffopt ignore whitespace
set diffopt+=iwhite

" smart joining of comment lines
set formatoptions+=j

" fix zooming in konsole
set guicursor=

" enable mouse support
set mouse=a

" Statusline
source $HOME/.config/nvim/statusline.vim

" Plugin related stuff
source $HOME/.config/nvim/poptions.vim

if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
endif

let $VISUAL = '$(which nvr) -cc split -c "set bufhidden=delete" -c "lcd $PWD" --remote-wait'
" can be used with nvr in the sudoers file
" for some reason using a command with spaces there does not work, even when
" quoted
command Bufhiddendelete set bufhidden=delete

function! SetBufferOpts()
    if &buftype == 'terminal'
        setlocal nonumber
        setlocal norelativenumber
        setlocal scrolloff=0
    else
        set number
        set relativenumber
        set scrolloff=5
    endif
endfunction

" autocommands
if has("autocmd")
    augroup vimrc
        autocmd!
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

        autocmd Filetype ruby,puppet,yaml,cabal setlocal ts=2 sts=2 sw=2
        autocmd Syntax php set syntax=on
        autocmd TermOpen * set bufhidden=delete | startinsert
        autocmd TermOpen,BufWinEnter * call SetBufferOpts()
        autocmd BufWinEnter,WinEnter term://* resize -1 | resize +1 | startinsert
        autocmd Filetype fzf tnoremap <silent> <buffer> <esc> <C-\><C-n>:q<CR>
        autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
    augroup END
endif

" Diff
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif
