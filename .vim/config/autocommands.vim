scriptencoding utf-8

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
