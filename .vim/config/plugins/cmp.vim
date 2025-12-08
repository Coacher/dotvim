scriptencoding utf-8

" ddc
function! s:InitDDC()
    call ddc#custom#patch_global('ui', 'none')

    call ddc#custom#patch_global('sourceOptions', {
        \ '_': {
        \   'maxItems': 10,
        \   'minAutoCompleteLength': 3,
        \   'minManualCompleteLength': 2,
        \   'keywordPattern': '\k+',
        \   'matchers': ['matcher_head'],
        \   'sorters': ['sorter_rank'],
        \   'converters': ['converter_remove_overlap', 'converter_truncate_abbr'],
        \ },
    \})

    " Local to the cursor: around
    " Local to the file: necosyntax, ctags / necovim, dictionary, vim
    " Local to the buffers: buffer
    " Local to the project: file, lsp
    call ddc#custom#patch_global('sources', [
        \ 'lsp', 'buffer', 'ctags', 'necosyntax', 'around', 'dictionary', 'file'
    \])

    call ddc#custom#patch_global('sourceOptions', {
        \ 'around': {
        \   'mark': '[around]',
        \   'maxItems': 6,
        \ },
    \})

    call ddc#custom#patch_global('sourceOptions', {
        \ 'necosyntax': {
        \   'mark': '[syntax]',
        \ },
    \})

    call ddc#custom#patch_global('sourceOptions', {
        \ 'ctags': {
        \   'mark': '[ctags]',
        \   'isVolatile': v:true,
        \   'matchers': ['matcher_fuzzy'],
        \   'sorters': ['sorter_fuzzy'],
        \ },
    \})

    call ddc#custom#patch_global('sourceOptions', {
        \ 'dictionary': {
        \   'mark': '[spell]',
        \   'maxItems': 8,
        \   'keywordPattern': '\S+',
        \   'isVolatile': v:true,
        \   'enabledIf': '!empty(&spell)',
        \ },
    \})

    call ddc#custom#patch_global('sourceParams', {
        \ 'dictionary': {
        \   'paths': [
        \       expand('~/.vim/spell/en.words'),
        \       expand('~/.vim/spell/ru.words'),
        \   ],
        \   'firstCaseInsensitive': v:true,
        \ },
    \})

    call ddc#custom#patch_global('sourceOptions', {
        \ 'buffer': {
        \   'mark': '[buffer]',
        \   'maxItems': 6,
        \ },
    \})
    call ddc#custom#patch_global('sourceParams', {
        \ 'buffer': {
        \   'bufNameStyle': 'basename',
        \   'requireSameFiletype': v:false,
        \ },
    \})

    call ddc#custom#patch_global('sourceOptions', {
        \ 'file': {
        \   'mark': '[file]',
        \   'maxItems': 32,
        \   'isVolatile': v:true,
        \   'forceCompletionPattern': '\S+\/\S*',
        \ },
    \})
    call ddc#custom#patch_global('sourceParams', {
        \ 'file': {
        \   'mode': 'os',
        \   'trailingSlash': v:true,
        \   'followSymlinks': v:true,
        \   'disableMenu': v:true,
        \ },
    \})

    call ddc#custom#patch_global('sourceOptions', {
        \ 'lsp': {
        \   'mark': '[lsp]',
        \   'isVolatile': v:true,
        \   'matchers': ['matcher_fuzzy'],
        \   'sorters': ['sorter_fuzzy'],
        \ },
    \})

    call ddc#custom#patch_global('sourceParams', {
        \ 'lsp': {
        \   'lspEngine': 'vim-lsp',
        \   'confirmBehavior': 'replace',
        \   'enableAdditionalTextEdit': v:true,
        \   'enableResolveItem': v:true,
        \ },
    \})

    call ddc#custom#patch_filetype('vim', {
        \ 'sources': ['vim', 'buffer', 'necovim', 'around', 'dictionary', 'file'],
    \})

    call ddc#custom#patch_global('sourceOptions', {
        \ 'necovim': {
        \   'mark': '[viml]',
        \ },
    \})

    call ddc#custom#patch_global('sourceOptions', {
        \ 'vim': {
        \   'mark': '[vim]',
        \   'isVolatile': v:true,
        \   'matchers': ['matcher_fuzzy'],
        \   'sorters': ['sorter_fuzzy'],
        \ },
    \})

    call ddc#enable()
endfunction

augroup vimrc_initddc
autocmd!
autocmd VimEnter * call s:InitDDC()
augroup END

" <Tab> selects the next candidate
inoremap <expr> <Tab> pumvisible() ? "\<C-N>" : <SID>MapComplete()
" <Esc> cancels the completion
inoremap <expr> <Esc> pumvisible() ? "\<C-E>" : "\<Esc>"
" <CR>  inserts the current candidate
inoremap <expr> <CR>  pumvisible() ? "\<C-Y>" : "\<CR>"

" neco-syntax
let g:necosyntax#max_syntax_lines = 500

" vim-lsp
let g:lsp_use_native_client = 1
let g:lsp_completion_documentation_enabled = 0
let g:lsp_diagnostics_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_peek_alignment = 'top'

augroup vimrc_vimlsppopupconfig
autocmd!
autocmd User lsp_float_opened
    \ call popup_setoptions(
    \   lsp#ui#vim#output#getpreviewwinid(),
    \   {'borderchars': ['─', '│', '─', '│', '┌', '┐', '┘', '└']}
    \ )
autocmd User lsp_float_opened
    \ call setwinvar(lsp#ui#vim#output#getpreviewwinid(), '&conceallevel', 2)
augroup END

" vim-lsp-settings
let g:lsp_settings_enable_suggestions = 0

" mason.nvim & mason-lspconfig.nvim
function! s:InitMason()
if has('nvim')
lua << EOF
require("mason").setup()
require("mason-lspconfig").setup()
EOF
endif
endfunction

augroup vimrc_initmason
autocmd!
autocmd VimEnter * call s:InitMason()
augroup END


" Helper functions {{{
function! s:MapComplete()
    let l:col = col('.') - 1
    if (l:col <= 0) || (getline('.')[l:col - 1] =~# '\s')
        " If the cursor is at the beginning of a line or after a space,
        " then insert <Tab>.
        return "\<Tab>"
    endif

    " Otherwise begin the completion process.
    return ddc#map#manual_complete({'ui': 'native'})
endfunction
" }}}
" vim:set foldenable foldmethod=marker:
