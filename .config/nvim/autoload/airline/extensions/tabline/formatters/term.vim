" vim: et ts=2 sts=2 sw=2

scriptencoding utf-8

function! airline#extensions#tabline#formatters#term#format(bufnr, buffers)
  if getbufvar(a:bufnr, '&buftype', 'ERROR') == "terminal"
    return getbufvar(a:bufnr, 'term_title', 'ERROR')
  endif
  return airline#extensions#tabline#formatters#default#format(a:bufnr, a:buffers)
endfunction
