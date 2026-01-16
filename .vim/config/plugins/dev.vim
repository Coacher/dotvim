scriptencoding utf-8

" Black
let g:black_use_virtualenv = 0

" ALE
let g:ale_cache_executable_check_failures = 1
let g:ale_floating_preview = 1
let g:ale_floating_window_border = ['│', '─', '┌', '┐', '┘', '└', '│', '─']
let g:ale_hover_cursor = 0
let g:ale_keep_list_window_open = 1
let g:ale_linters_ignore = {'vim': ['vint']}
let g:ale_set_balloons = 0
let g:ale_sign_error = '✘›'
let g:ale_sign_warning = '‼›'
let g:ale_sign_info = '*›'
let g:ale_sign_style_error = '✗›'
let g:ale_sign_style_warning = '⁈›'
let g:ale_virtualtext_cursor = 0
let g:ale_python_pylint_options = '--enable-all-extensions'
let g:airline#extensions#ale#enabled = 0

highlight link ALEError   SpellBad
highlight link ALEWarning SpellCap
highlight link ALEInfo    SpellRare

highlight ALEErrorSign   cterm=standout ctermfg=196 gui=standout guifg=Red
highlight ALEWarningSign cterm=bold     ctermfg=220 gui=bold     guifg=Gold

nmap <silent> <F6> :ALEToggle<CR>
imap <silent> <F6> <C-\><C-O>:ALEToggle<CR>

" Gutentags
let g:gutentags_cache_dir = expand('~/.vim/tags')

" vim-virtualenv
let g:virtualenv#directory = expand('~/Dev/.virtualenvs')
let g:virtualenv#auto_activate_everywhere = 1
let g:virtualenv#enable_gutentags_support = 1

" Vimspector
let g:vimspector_enable_auto_hover = 0
let g:vimspector_bottombar_height = 20

nmap <F7>         <Plug>VimspectorStepOver
nmap <leader><F7> <Plug>VimspectorStepInto
nmap <F8>         <Plug>VimspectorToggleBreakpoint
nmap <leader><F8> <Plug>VimspectorToggleConditionalBreakpoint
nmap <F9>         <Plug>VimspectorContinue
nmap <leader><F9> <Plug>VimspectorReset

" helpful.vim
nmap <silent> <leader>bh :let b:helpful = !get(b:, 'helpful')<CR>
