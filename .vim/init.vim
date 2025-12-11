let s:basedir = fnamemodify(resolve(expand('<script>')), ':h')
let &runtimepath = s:basedir.','.&runtimepath
let &packpath = &runtimepath
execute 'source '.s:basedir.'/vimrc'
