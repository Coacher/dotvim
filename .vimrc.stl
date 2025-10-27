scriptencoding utf-8
"
" Status line
"
" Always show a status line
set laststatus=2

" Status line configuration
" Preview window flag
set statusline=%w

" Current git HEAD
set statusline+=%.21{StatuslineCurrentHEAD()}

" Path to the file in the buffer, as typed or relative to the current directory
set statusline+=[%.42f]

" Display a warning if 'fileformat' is not 'unix'
set statusline+=%#WarningMsg#
set statusline+=%{&fileformat!='unix'?'['.&fileformat.']':''}
set statusline+=%*

" Display a warning if 'fileencoding' is not 'utf-8'
set statusline+=%#WarningMsg#
set statusline+=%{!empty(&fileencoding)&&&fileencoding!='utf-8'?'['.&fileencoding.']':''}
set statusline+=%*

" File type
set statusline+=%y

" Spell checking languages
set statusline+=%{&spell?'['.&spelllang.']':''}

" Display a warning if indentation does not match 'expandtab'
set statusline+=%#WarningMsg#
set statusline+=%{StatuslineExpandtabWarning()}
set statusline+=%*

" Display a warning if mixed indentation was found
set statusline+=%#WarningMsg#
set statusline+=%{StatuslineMixedIndentWarning()}
set statusline+=%*

" Display a warning if trailing space was found
set statusline+=%#WarningMsg#
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%*

" Readonly flag
set statusline+=%r

" Modified flag
set statusline+=%m

" Display a warning if 'diff' is set
set statusline+=%#WarningMsg#
set statusline+=%{&diff?'[diff]':''}
set statusline+=%*

" Display a warning if 'paste' is set
set statusline+=%#WarningMsg#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

" Everything else is aligned to the right
set statusline+=%=

" Current highlight
set statusline+=%{StatuslineCurrentHighlight()}

" Cursor line, column
set statusline+=%(\ (line\ %l,\ col\ %v)\ %)

" Percentage/total lines
set statusline+=%P/%L


" Status line functions {{{
" Return git HEAD of the current buffer
function! StatuslineCurrentHEAD()
    let l:head = fugitive#Head()
    return empty(l:head) ? '' : '╎'.l:head.'⟩'
endfunction

" Return syntax highlight group under the cursor
function! StatuslineCurrentHighlight()
    let l:name = synIDattr(synID(line('.'), col('.'), 1), 'name')
    return empty(l:name) ? '' : '['.l:name.']'
endfunction

" Return '[expandtab]' if indentation does not match 'expandtab'
function! StatuslineExpandtabWarning()
    if get(b:, 'nostatusline_expandtab', 0)
        return ''
    endif
    if !exists('b:statusline_expandtab_warning')
        let b:statusline_expandtab_warning = ''

        if (&readonly || !&modifiable)
            return b:statusline_expandtab_warning
        endif

        let l:tabs = (search('^\t', 'nw') > 0)
        let l:spaces = (search('^ \{'.shiftwidth().'}', 'nw') > 0)

        if (l:tabs && &expandtab) || (l:spaces && !&expandtab)
            let b:statusline_expandtab_warning = '[expandtab]'
        endif
    endif
    return b:statusline_expandtab_warning
endfunction

" Return '[mixed-indent]' if mixed indentation was found
function! StatuslineMixedIndentWarning()
    if get(b:, 'nostatusline_mixed_indent', 0)
        return ''
    endif
    if !exists('b:statusline_mixed_indent_warning')
        let b:statusline_mixed_indent_warning = ''

        if (&readonly || !&modifiable)
            return b:statusline_mixed_indent_warning
        endif

        if (search('^\%(\t\+ \| \+\t\)', 'nw') > 0)
            let b:statusline_mixed_indent_warning = '[mixed-indent]'
        endif
    endif
    return b:statusline_mixed_indent_warning
endfunction

" Return '[trailing-space]' if trailing space was found
function! StatuslineTrailingSpaceWarning()
    if get(b:, 'nostatusline_trailing_space', 0)
        return ''
    endif
    if !exists('b:statusline_trailing_space_warning')
        let b:statusline_trailing_space_warning = ''

        if (&readonly || !&modifiable)
            return b:statusline_trailing_space_warning
        endif

        if (search('\s\+$', 'nw') > 0)
            let b:statusline_trailing_space_warning = '[trailing-space]'
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

augroup vimrc_statusline
autocmd!
autocmd BufWritePost,CursorHold * unlet! b:statusline_expandtab_warning
autocmd BufWritePost,CursorHold * unlet! b:statusline_mixed_indent_warning
autocmd BufWritePost,CursorHold * unlet! b:statusline_trailing_space_warning
augroup END
" }}}
" vim:set foldenable foldmethod=marker:
