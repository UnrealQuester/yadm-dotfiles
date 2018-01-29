let mapleader=" "

" Toggle paste mode
set pastetoggle=<F2>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Might be nice if I could actually remember this mapping
inoremap jj <Esc>

" Jump tot he end of the pasted or yanked text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Copy to system clipboard
noremap <Leader>y "+y
vnoremap <Leader>y "+y

" Paste from system clipboard
noremap <Leader>p "+p
vnoremap <Leader>p "+p

" YCM FixIt
nnoremap <Leader>uf :YcmCompleter FixIt<CR>

" Fast window switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable terminal shortcuts
tnoremap <Esc> <C-\><C-n>
tnoremap <C-J> <C-\><C-N><C-W><C-J>
tnoremap <C-K> <C-\><C-N><C-W><C-K>
tnoremap <C-L> <C-\><C-N><C-W><C-L>
tnoremap <C-H> <C-\><C-N><C-W><C-H>
nnoremap <silent> <C-Space>c :$tabnew +:terminal<CR>
tnoremap <silent> <C-Space>c <C-\><C-n>:$tabnew +:terminal<CR>
nnoremap <silent> <C-Space>s :belowright :split +:terminal<CR>
tnoremap <silent> <C-Space>s <C-\><C-n>:belowright :split +:terminal<CR>
nnoremap <silent> <C-Space>v :belowright :vsplit +:terminal<CR>
tnoremap <silent> <C-Space>v <C-\><C-n>:belowright :vsplit +:terminal<CR>
nnoremap <silent> <C-Space>1 :1tabnext<CR>
tnoremap <silent> <C-Space>1 <C-\><C-n>:1tabnext<CR>
nnoremap <silent> <C-Space>2 :2tabnext<CR>
tnoremap <silent> <C-Space>2 <C-\><C-n>:2tabnext<CR>
nnoremap <silent> <C-Space>3 :3tabnext<CR>
tnoremap <silent> <C-Space>3 <C-\><C-n>:3tabnext<CR>
nnoremap <silent> <C-Space>4 :4tabnext<CR>
tnoremap <silent> <C-Space>4 <C-\><C-n>:4tabnext<CR>
nnoremap <silent> <C-Space>5 :5tabnext<CR>
tnoremap <silent> <C-Space>5 <C-\><C-n>:5tabnext<CR>
nnoremap <silent> <C-Space>6 :6tabnext<CR>
tnoremap <silent> <C-Space>6 :<C-\><C-n>6tabnext<CR>
nnoremap <silent> <C-Space>7 :7tabnext<CR>
tnoremap <silent> <C-Space>7 <C-\><C-n>:7tabnext<CR>
nnoremap <silent> <C-Space>8 :8tabnext<CR>
tnoremap <silent> <C-Space>8 <C-\><C-n>:8tabnext<CR>
nnoremap <silent> <C-Space>9 :9tabnext<CR>
tnoremap <silent> <C-Space>9 <C-\><C-n>:9tabnext<CR>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map * <Plug>(incsearch-nohl-*)
map # <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

nmap ]s <Plug>(altr-forward)
nmap [s <Plug>(altr-back)

nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Reselect pasted text
noremap gV `[v`]

" Hit Enter to go to end of file.
nnoremap <CR> G
" Hit Backspace to go to beginning of file.
nnoremap <BS> gg

" surround alias
nmap <Leader>s ys

" Disables the hightlightsearch
nmap <silent> <Leader>/ :nohlsearch<CR>

" Toggle Tagbar
nmap <silent> <Leader>tl :TagbarToggle<CR>

" Toggle Gundo
nmap <silent> <Leader>tg :GundoToggle<CR>

cmap w!! w !sudo tee > /dev/null %

" Save with Ctrl+S
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

let g:AutoPairsShortcutBackInsert = '<C-b>'
let g:targets_separators = '. ; : + - = ~ _ * # / | \ & $'

" unite
nnoremap <silent> <Leader>ag :Denite -buffer-name=search grep:.<CR>
nnoremap <silent> <Leader>aw :Denite -buffer-name=search grep:.:-w:<C-R><C-W><CR>
nnoremap <silent> <Leader>ar :Denite -buffer-name=search grep -resume<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Denite buffer<CR>
nnoremap <silent> <Leader>gs :Denite gitstatus<CR>
call denite#custom#map('normal', 'ga', '<denite:do_action:add>', 'noremap')
call denite#custom#map('normal', 'gp', '<denite:do_action:patch>', 'noremap')
call denite#custom#map('normal', 'gr', '<denite:do_action:reset>', 'noremap')

" Use Ag to search inf files and ingore the file name as a search result
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

autocmd FileType c noremap <buffer> <C-]> :call LanguageClient_textDocument_definition()<CR>
autocmd FileType cpp noremap <buffer> <C-]> :call LanguageClient_textDocument_definition()<CR>

nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gc :Gcommit -v<CR>
nnoremap <silent> <Leader>ga :Gcommit -v --amend<CR>
nnoremap <silent> <Leader>gb :Gblame -w<CR>

nnoremap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p``"
endfunction
