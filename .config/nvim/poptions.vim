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

let g:tcommentMapLeaderOp1 = '<Leader>c'

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_previous_completion = ['<S-Tab>']
let g:ycm_confirm_extra_conf = 0
let g:ycm_max_diagnostics_to_display = 400

" Denite
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#option('_', 'mode', 'normal')
call denite#custom#option('_', 'direction', 'dynamicbottom')

" Ultisnips
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" Incsearch
let g:incsearch#auto_nohlsearch = 1

" tcomment
call tcomment#DefineType('cabal', '-- %s')

" airline
function! GetBufferTermName()
  if getbufvar("%", '&buftype', 'ERROR') == "terminal"
    return getbufvar("%", 'term_title', 'ERROR')
  endif
  let name = bufname('%')
  if empty(name)
      let name = '[No Name]'
  endif
  let name = fnamemodify(name, ':~:.')
  if getbufvar('%', '&modifiable') == 0
    let name .= '[-]'
  elseif getbufvar('%', '&modified') == 1
    let name .= '[+]'
  endif
  return name
endfunction
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 0
let g:airline_symbols.linenr = "\ue0a1 "
let g:airline_symbols.notexists = ""
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_section_error = ''
call airline#parts#define_function('term', 'GetBufferTermName')
let g:airline_section_c = airline#section#create(['%<', 'term', g:airline_symbols.space, 'readonly'])

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'term'

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
\   'cpp': ['clangtidy'],
\}

let g:ale_fixers = {
\   'cpp': ['clang-format'],
\}
let g:ale_cpp_clangtidy_checks = ['']
let g:ale_cpp_clangtidy_options = '-x c++ -std=c++17 -I.'

let g:hardtime_default_on = 1

" promptline
" let g:promptline_preset = {
"         \'a': [ promptline#slices#user(), promptline#slices#host() ],
"         \'b' : [ '%~' ],
"         \'c' : [ '%#' ],
"         \'y' : [ promptline#slices#vcs_branch({ 'svn' : 1 }) ],
"         \'warn' : [ promptline#slices#last_exit_code() ]}

" tmuxline
" let g:tmuxline_preset = {
"       \'a'    : '#S',
"       \'win'  : ['#I', '#W'],
"       \'cwin' : ['#I', '#W'],
"       \'y'    : ['%a', '%d.%m.%Y', '%R'],
"       \'z'    : '#H'}
