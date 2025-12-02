scriptencoding utf-8

" Disable undo history for certain kinds of files listed below
augroup vimrc_restrictundofile
autocmd!
autocmd FileType   *commit setlocal noundofile
autocmd FileType gitrebase setlocal noundofile
autocmd BufReadPre /boot/* setlocal noundofile
autocmd BufReadPre /etc/*  setlocal noundofile
autocmd BufReadPre /opt/*  setlocal noundofile
autocmd BufReadPre /run/*  setlocal noundofile
autocmd BufReadPre /srv/*  setlocal noundofile
autocmd BufReadPre /tmp/*  setlocal noundofile
autocmd BufReadPre /usr/*  setlocal noundofile
autocmd BufReadPre /var/*  setlocal noundofile
autocmd BufReadPre $HOME/Documents/* setlocal noundofile
autocmd BufReadPre $HOME/Downloads/* setlocal noundofile
autocmd BufReadPre $HOME/Images/*    setlocal noundofile
autocmd BufReadPre $HOME/Music/*     setlocal noundofile
autocmd BufReadPre $HOME/Videos/*    setlocal noundofile
augroup END

" Adjust options for special buffers
augroup vimrc_specialbuffers
autocmd!
autocmd BufRead,TerminalOpen,VimEnter *
    \ if !empty(&buftype)
    \ | setlocal colorcolumn=0 textwidth=0 nonumber nolist
    \ | let b:nostatusline_trailing_space = 1
    \ | endif
autocmd OptionSet buftype
    \ if !empty(v:option_new)
    \ | setlocal colorcolumn=0 textwidth=0 nonumber nolist
    \ | let b:nostatusline_trailing_space = 1
    \ | endif
augroup END

" Update listchars when shiftwidth changes
augroup vimrc_updatelistchars
autocmd!
autocmd OptionSet shiftwidth call s:UpdateListchars()
augroup END

" Enable spell checking in commit messages
augroup vimrc_spellcheckcommits
autocmd!
autocmd FileType *commit setlocal spell spelllang=en,ru
augroup END

" Automatically update diffs after edits
augroup vimrc_autoupdatediffs
autocmd!
autocmd BufWritePost,TextChanged * if &diff | diffupdate! | endif
augroup END

" Custom filetypes rules
augroup vimrc_customfiletypes
autocmd!
autocmd FileType *commit call cursor(1, 1)
autocmd FileType gitconfig setlocal noexpandtab
augroup END


" Helper functions {{{
function! s:UpdateListchars()
    let l:template = ' listchars=eol:↲,trail:·,nbsp:¬,tab:»\ ⎹,leadmultispace:'
    execute 'set'.v:option_type.l:template.repeat('\ ', shiftwidth() - 1).'⎹'
endfunction
" }}}
" vim:set foldenable foldmethod=marker:
