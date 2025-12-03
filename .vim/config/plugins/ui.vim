scriptencoding utf-8

" fzf.vim
let g:fzf_vim = {}
let g:fzf_vim.buffers_jump = 1

augroup vimrc_fzfvimcmd
autocmd!
autocmd VimEnter * delcommand RG
autocmd VimEnter * command! -bang -nargs=* RG
    \ call fzf#vim#grep2(
    \   'rg --pretty --column --no-heading --smart-case '.<q-args>.' -- ', '',
    \   fzf#vim#with_preview(),
    \   <bang>0)
autocmd VimEnter * command! -bang -nargs=* GGrep
    \ call fzf#vim#grep(
    \   'git grep --line-number --column --color=always -- '.fzf#shellescape(<q-args>),
    \   fzf#vim#with_preview({'dir': trim(system('git rev-parse --show-toplevel'))}),
    \   <bang>0)
augroup END

nmap <silent> <F4> :Buffers<CR>
imap <silent> <F4> <C-\><C-N>:Buffers<CR>
nmap <silent> <C-F> :GFiles<CR>
imap <silent> <C-F> <C-\><C-O>:GFiles<CR>
nmap <silent> <C-G> :GGrep<CR>
imap <silent> <C-G> <C-\><C-O>:GGrep<CR>
