scriptencoding utf-8

" fzf.vim
let g:fzf_vim = {}
let g:fzf_vim.buffers_jump = 1

augroup vimrc_fzfvimcmd
autocmd!
autocmd VimEnter * command! -bang -nargs=* GR
    \ call fzf#vim#grep2('rg --pretty --no-heading --smart-case '.<q-args>.' -- ', '', fzf#vim#with_preview(), <bang>0)
augroup END

nmap <silent> <F4> :Buffers<CR>
imap <silent> <F4> <C-\><C-N>:Buffers<CR>

nmap <silent> <C-F> :GFiles<CR>
imap <silent> <C-F> <C-\><C-O>:GFiles<CR>

nmap <silent> <C-G> :Rg<CR>
imap <silent> <C-G> <C-\><C-O>:Rg<CR>
