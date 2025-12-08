scriptencoding utf-8

" python-indent
let g:python_indent_line_up_closing_bracket_with_last_line = 0

" SearchHighlighting
nmap <silent> <leader>hh <Plug>SearchHighlightingToggleHlsearch
imap <silent> <leader>hh <C-\><C-O><Plug>SearchHighlightingToggleHlsearch
vmap <silent> <leader>hh <Plug>SearchHighlightingToggleHlsearch
nmap <silent> <leader>ah <Plug>SearchHighlightingAutoSearch
imap <silent> <leader>ah <C-\><C-O><Plug>SearchHighlightingAutoSearch
vmap <silent> <leader>ah <Plug>SearchHighlightingAutoSearch

" vim9-cutlass
let g:vim9cutlass_cut = 'x'
if has('nvim')
    let g:vim9cutlass_loaded = 1
endif

" vim9-buckler
if has('nvim')
    let g:vim9buckler_loaded = 1
    xnoremap <silent> p P`]
endif

" cutlass.nvim
function! s:InitCutlass()
if has('nvim')
lua << EOF
require("cutlass").setup({
    cut_key = 'x',
    override_del = true,
})
EOF
endif
endfunction

augroup vimrc_initcutlass
autocmd!
autocmd VimEnter * call s:InitCutlass()
augroup END

" NERDTree
let g:NERDTreeNaturalSort = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '∼'
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapPreviewSplit = 'gs'
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeMapPreviewVSplit = 'gv'

nmap <silent> <F3> :NERDTreeToggle<CR>
imap <silent> <F3> <C-\><C-N>:NERDTreeToggle<CR>
nmap <silent> <leader>nf :NERDTreeFind<CR>
imap <silent> <leader>nf <C-\><C-N>:NERDTreeFind<CR>
