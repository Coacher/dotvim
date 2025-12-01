scriptencoding utf-8

let g:mapleader = ','


"
" Keymap options
"
set keymap=russian-jcukenwin
set iminsert=0 imsearch=-1
inoremap <silent> `` <C-^>
cnoremap <silent> `` <C-^>


"
" General mappings
"
" Toggle Normal mode without moving the cursor
nmap <silent> <leader><leader> :startinsert<CR>
imap <silent> <leader><leader> <C-\><C-O>:stopinsert<CR>
vmap <silent> <leader><leader> <C-\><C-N>
tmap <silent> <leader><leader> <C-\><C-N>

nmap <silent> <F1> :startinsert<CR>
imap <silent> <F1> <C-\><C-O>:stopinsert<CR>
vmap <silent> <F1> <C-\><C-N>
tmap <silent> <F1> <C-\><C-N>

" Save
nmap <F2> :w!<CR>
imap <F2> <C-\><C-O>:w!<CR>
vmap <F2> <C-\><C-N>:w!<CR>gv

" Quit
nmap <F10> :q<CR>
imap <F10> <C-\><C-O>:q<CR>
vmap <F10> <C-\><C-N>:q<CR>

" Terminal
nmap <silent> <leader><F1> :terminal<CR>
imap <silent> <leader><F1> <C-\><C-O>:terminal<CR>
vmap <silent> <leader><F1> <C-\><C-N>:terminal<CR>

" Equalize keypad <Enter> and regular <Enter>
map <kEnter> <CR>

" Execute one command, return to Insert mode
imap \\ <C-O>

" Use Q for text formatting, except for Select mode
map Q gq
sunmap Q

" Neutralize q:
nmap q: :q

" Make Y yank text from the cursor to the end of the line
nmap Y y$

" Make S delete text from the cursor to the end of the line
nmap S C

" Start Visual mode from pasted text
noremap <leader>vp `[v`]


"
" Movement mappings
"
" Make <PageUp>/<PageDown> scroll half a screen at a time,
" thus preserving the screen line of the cursor
" and allowing to move the cursor to the first/last line
noremap  <PageUp>   <C-U>
noremap  <PageDown> <C-D>
inoremap <PageUp>   <C-\><C-O><C-U>
inoremap <PageDown> <C-\><C-O><C-D>

" Make j/k/<Up>/<Down> move through screen lines
noremap j gj
noremap k gk
map <Down> j
map <Up>   k

" Make <Left>/<Right> produce h/l to help with plugins
map <Left>  h
map <Right> l

" Make 0/<k0> move the cursor to the first non-blank character of the line
noremap 0 ^
map  <k0> 0

" Make $/<End> in Visual mode consistent with Normal mode
vnoremap $ $<Left>
vmap <End> $

" Move the cursor to the beginning/end of the line
map  <C-B> 0
map  <C-E> $

" Preserve the selected area on line shifts
vnoremap > >gv
vnoremap < <gv

" Make </> shift lines in Normal mode
nnoremap > >>
nnoremap < <<

" Use <leader>; instead of ,
noremap <leader>; ,

" Use <leader>g; instead of g,
noremap <leader>g; g,

" Use -/= instead of (/)
noremap - (
noremap = )

" Use <C-P> instead of <C-I>, see ':help <Tab>'
noremap <C-P> <C-I>


"
" Window mappings
"
" Window movement
map <silent> <leader><C-H> :wincmd H<CR>
map <silent> <leader><C-J> :wincmd J<CR>
map <silent> <leader><C-K> :wincmd K<CR>
map <silent> <leader><C-L> :wincmd L<CR>

" Cursor movement
map <silent> <C-H> :wincmd h<CR>
map <silent> <C-J> :wincmd j<CR>
map <silent> <C-K> :wincmd k<CR>
map <silent> <C-L> :wincmd l<CR>

map <silent> <A-Left>  :wincmd h<CR>
map <silent> <A-Down>  :wincmd j<CR>
map <silent> <A-Up>    :wincmd k<CR>
map <silent> <A-Right> :wincmd l<CR>

" MRU cursor movement
map <silent> <Tab> <C-\><C-N>:call <SID>MRUWindow()<CR>


"
" Spell checking mappings
"
nmap <leader>ss :setlocal spell! spelllang=en,ru<CR>
nmap <leader>se :setlocal spell  spelllang=en<CR>
nmap <leader>sr :setlocal spell  spelllang=ru<CR>

nmap <silent> <leader>sa zg
nmap <silent> <leader>sd zw
nmap <silent> <leader>sq z=


"
" Diff mode mappings
"
nmap <silent> <leader>dd :call <SID>ToggleDiffMode()<CR>
nmap <silent> <leader>du :diffupdate!<CR>


"
" Misc mappings
"
" Toggle location list
nmap <silent> <leader>ll :call <SID>ToggleWindow('location')<CR>
imap <silent> <leader>ll <C-\><C-O>:call <SID>ToggleWindow('location')<CR>
" Toggle quickfix list
nmap <silent> <leader>qq :call <SID>ToggleWindow('quickfix')<CR>
imap <silent> <leader>qq <C-\><C-O>:call <SID>ToggleWindow('quickfix')<CR>

" Toggle cursor line/column highlighting
nmap <silent> <leader>cl :setlocal cursorline!<CR>
nmap <silent> <leader>cc :setlocal cursorcolumn!<CR>
imap <silent> <leader>cl <C-\><C-O>:setlocal cursorline!<CR>
imap <silent> <leader>cc <C-\><C-O>:setlocal cursorcolumn!<CR>
vmap <silent> <leader>cl <C-\><C-N>:setlocal cursorline!<CR>gv
vmap <silent> <leader>cc <C-\><C-N>:setlocal cursorcolumn!<CR>gv

" Toggle indent guides highlighting
nmap <silent> <leader>ig :setlocal list!<CR>
imap <silent> <leader>ig <C-\><C-O>:setlocal list!<CR>
vmap <silent> <leader>ig <C-\><C-N>:setlocal list!<CR>gv

" Toggle Paste mode
nmap <silent> <leader>pp :setlocal paste!<CR>


" Mapping functions {{{
function! s:MRUWindow()
    let l:current = winnr()
    let l:target = winnr('#')
    if (l:target > 0)
        wincmd p
        if (winnr() == l:current)
            wincmd w
        endif
    else
        wincmd w
    endif
endfunction

function! s:ToggleDiffMode()
    if !&diff
        diffthis
    else
        diffoff!
    endif
endfunction

function! s:BufferCount()
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction

function! s:ToggleWindow(windowtype)
    let l:prefix = a:windowtype[:0]
    if (a:windowtype ==# 'quickfix')
        let l:prefix = 'c'
    endif

    let l:buffer_count_before = s:BufferCount()
    execute 'silent! '.l:prefix.'close'

    if (s:BufferCount() == l:buffer_count_before && l:prefix !=# 'p')
        execute 'silent! '.l:prefix.'open'
    endif
endfunction
" }}}
" vim:set foldenable foldmethod=marker:
