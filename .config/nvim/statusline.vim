" Statuslines
" Default:
set laststatus=2
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
let g:airline_symbols = {}
let g:airline_symbols.linenr = "\ue0a1 "
let g:airline_symbols.notexists = ""
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_section_error = ''
call airline#parts#define_function('term', 'GetBufferTermName')
let g:airline_section_c = airline#section#create(['%<', 'term', g:airline_symbols.space, 'readonly'])
let g:airline_section_z = airline#section#create(['%{g:airline_symbols.linenr}', '%l/%L[%p%%]: %v'])
let g:airline_section_warning = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#formatter = 'term'
