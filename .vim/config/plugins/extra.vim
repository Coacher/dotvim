scriptencoding utf-8

" SpellCheck
let g:SpellCheck_DefineAuxiliaryCommands = 0

augroup vimrc_spellcheckcmd
autocmd!
autocmd VimEnter * delcommand SpellCheck
autocmd VimEnter * delcommand SpellLCheck
autocmd VimEnter * command! -bar -bang -range=% -nargs=*
    \ -complete=customlist,SpellCheckCompleteFunc Spell
    \ call SpellCheck#quickfix#List(<line1>, <line2>, <bang>1, 1, <q-args>)
augroup END

" EasyAlign
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" undotree
let g:undotree_WindowLayout = 4
let g:undotree_SplitWidth = 35
let g:undotree_DiffpanelHeight = 14
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_DiffCommand = 'git diff --no-color --no-ext-diff --no-index'

augroup vimrc_undotreediffui
autocmd!
autocmd BufWinEnter diffpanel* setlocal colorcolumn=0 textwidth=0
augroup END

nmap <silent> <leader>u :UndotreeToggle<CR>

" Visual-Multi
let g:VM_maps = {}
let g:VM_maps['Find Under'] = ''
let g:VM_maps['Find Subword Under'] = ''

" Tagbar
let g:tagbar_ctags_options = ['NONE']
let g:tagbar_width = 45
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 2
let g:tagbar_show_balloon = 0
let g:tagbar_show_visibility = 0
let g:tagbar_show_tag_count = 1
let g:tagbar_iconchars = ['+', '∼']
let g:tagbar_previewwin_pos = 'botright'
let g:tagbar_silent = 1
let g:tagbar_wrap = 2
let g:tagbar_highlight_method = 'scoped-stl'
let g:tagbar_map_togglefold = ['o', 'za', '<Space>']
let g:tagbar_map_showproto = []

nmap <silent> <F5> :TagbarToggle<CR>
imap <silent> <F5> <C-\><C-O>:TagbarToggle<CR>

" DiffChar
let g:DiffUnit = 'Word3'
let g:DiffDelPosVisible = 0
