scriptencoding utf-8

" Zenburn
let g:zenburn_high_Contrast = 1
let g:zenburn_color_also_Ignore = 1
let g:zenburn_alternate_Visual = 1
let g:zenburn_old_Visual = 1
let g:zenburn_italic_Comment = 1

" seoul256
let g:seoul256_background = 233

" Custom colorscheme
colorscheme zenburn

" Highlight the current line number with bold in cterm
highlight CursorLineNr cterm=bold

" Use contrast colors in diff mode
highlight DiffDelete cterm=bold ctermbg=NONE  ctermfg=9
highlight DiffAdd    cterm=bold ctermbg=23    ctermfg=NONE
highlight DiffText   cterm=bold ctermbg=17    ctermfg=NONE
highlight DiffDelete gui=bold   guibg=NONE    guifg=#ff0000
highlight DiffAdd    gui=bold   guibg=#005f5f guifg=NONE
highlight DiffText   gui=bold   guibg=#00005f guifg=NONE
