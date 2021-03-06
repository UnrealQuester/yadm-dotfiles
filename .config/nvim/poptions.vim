" Author
let g:snips_author = "Quester"

" haskell-vim
let g:haskell_indent_if = 0

" latex
let g:tex_conceal = ""

" vim-json
" fixes interaction with indentLine
let g:vim_json_syntax_conceal = 0

" auto pairs
" let g:AutoPairsFlyMode = 1

" targets
let g:targets_nlNL = '    '
let g:targets_aiAI = 'a  i'

let g:tcomment_opleader1 = '<Leader>c'

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_previous_completion = ['<S-Tab>']
let g:ycm_confirm_extra_conf = 0
let g:ycm_max_diagnostics_to_display = 400

" Denite
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', ''])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--smart-case'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#option('_', 'mode', 'normal')
call denite#custom#option('_', 'direction', 'dynamicbottom')

" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('ultisnips', 'rank', 9999)
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])
let g:echodoc#enable_at_startup = 1
call deoplete#custom#option({
            \ 'auto_complete_delay': 200,
            \ 'auto_refresh_delay': 200,
            \})

let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1

let g:nvim_typescript#max_completion_detail = 100

let g:LanguageClient_serverCommands = { 'cpp': ['clangd'], 'c': ['clangd'] }
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_hasSnippetSupport = 0


" Ultisnips
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" Incsearch
let g:incsearch#auto_nohlsearch = 1

" tcomment
call tcomment#type#Define('cabal', '-- %s')

" easytags
let g:easytags_updatetime_warn = 0
let g:easytags_dynamic_files = 1
:autocmd FileType cpp,c let b:easytags_auto_highlight = 0

let g:easytags_languages = {
    \ 'javascript' : {
        \ 'cmd' : 'jsctags'
    \ }
\ }

" ale
let g:ale_linters = {
\   'cpp': ['clangtidy', 'clang'],
\   'asm': [],
\}

let g:ale_fixers = {
\   'cpp': ['clang-format'],
\}
let g:ale_cpp_clangtidy_checks = ['']
let g:ale_cpp_clangtidy_options = '-x c++ -std=c++17 -I.'
let g:ale_cpp_clang_options = '-x c++ -std=c++17 -I.'
