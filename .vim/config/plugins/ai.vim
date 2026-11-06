scriptencoding utf-8

" vim-ai
let g:vim_ai_roles_config_file = expand('~/.vim-ai-roles.ini')
let g:vim_ai_chat = {'ui': {'open_chat_command': 'preset_right'}}
let g:vim_ai_open_chat_presets = {
    \ "preset_right":
        \ "rightbelow 80vnew | setlocal noequalalways | setlocal winfixwidth"
\}
