"
" Disable Vi-compatible mode
"
set nocompatible


"
" Encoding options
"
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,default,cp1251
scriptencoding utf-8


"
" General options
"
" Set end-of-line formats in the order of preference
set fileformats=unix,dos,mac

" Enable file type detection and load available plugin and indent files
filetype plugin indent on

" Enable syntax highlighting
syntax enable

" Change the current working directory to the directory containing the file
set autochdir

" Automatically read the file again when it has been changed outside of Vim
set autoread

" Disable all beeps
set belloff=all

" Disable swap files
set noswapfile
" Keep swap files in a single directory
set directory=~/.vim/swp

" Save undo history on buffer writes and restore it on buffer reads
set undofile
" Keep undo files in a single directory
set undodir=~/.vim/undo
" Disable undo history for certain kinds of files listed below
augroup restrictundofile
autocmd!
autocmd FileType   *commit setlocal noundofile
autocmd FileType gitrebase setlocal noundofile
autocmd BufReadPre /etc/*  setlocal noundofile
autocmd BufReadPre /opt/*  setlocal noundofile
autocmd BufReadPre /run/*  setlocal noundofile
autocmd BufReadPre /tmp/*  setlocal noundofile
autocmd BufReadPre /usr/*  setlocal noundofile
autocmd BufReadPre /var/*  setlocal noundofile
autocmd BufReadPre $HOME/Documents/* setlocal noundofile
autocmd BufReadPre $HOME/Downloads/* setlocal noundofile
autocmd BufReadPre $HOME/Music/*     setlocal noundofile
autocmd BufReadPre $HOME/Images/*    setlocal noundofile
autocmd BufReadPre $HOME/Videos/*    setlocal noundofile
augroup END


"
" UI options
"
" Disable the intro message
set shortmess+=I

" Disable the file info message after opening a file
set shortmess+=F

" Show search count message when searching
set shortmess-=S

" Do not redraw the screen for commands that have not been typed
set lazyredraw

" Enable fast terminal connection
set ttyfast

" Enable mouse in all available modes
set mouse=a

" Autohide mouse cursor
set mousehide

" Make the right mouse button pop up a menu and move the cursor
set mousemodel=popup_setpos

" Show partial command in the last line of the screen
set showcmd

" Display as much of the last line as possible and do not replace it with "@"
set display=lastline

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=3

" Highlight the 80th and 120th columns
set colorcolumn=80,120

" Color scheme
let g:zenburn_high_Contrast = 1
let g:zenburn_color_also_Ignore = 1
let g:zenburn_alternate_Visual = 1
let g:zenburn_old_Visual = 1
let g:zenburn_italic_Comment = 1
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


"
" Indentation options
"
" Set width for automatic line breaks while editing/formatting
set textwidth=79
" Do not break existing long lines, only prevent new ones
set formatoptions+=l
" Number of spaces that a <Tab> in the file counts for
set tabstop=4
" Number of spaces that a <Tab> counts for while editing
" When it is not zero, a mix of spaces and <Tab>s is used instead of <Tab>s
set softtabstop=0
" Number of spaces to use for each step of indent
set shiftwidth=4
" Do not round indent to a multiple of 'shiftwidth'
set noshiftround
" Make a <Tab> in front of a line insert blanks according to 'shiftwidth'
" Make a <BS> delete a 'shiftwidth' worth of space at the start of the line
set smarttab
" Use the appropriate number of spaces to insert a <Tab>
set expandtab
" Copy indent from the current line when starting a new line
set autoindent
" Allow backspacing over everything in Insert mode
set backspace=indent,eol,nostop


"
" Text editing options
"
" Highlight the screen line of the cursor
set cursorline
" Do not highlight the screen column of the cursor
set nocursorcolumn
" Print the line number in front of each line
set number
" Display signs in the number column
set signcolumn=number
" When a bracket is inserted, briefly jump to the matching one
" But typing a character will immediately move the cursor back
set showmatch cpoptions-=m
" Keep the cursor in the same column on line movement commands
set nostartofline
" Wrap long lines
set wrap
" Wrap long lines only at a character in 'breakat'
set linebreak
" Make wrapped lines visually indented, thus preserving horizontal blocks
set breakindent
" Show EOL characters, tabs, trailing spaces, non-breakable spaces
set list listchars=eol:↲,tab:»·,trail:·,nbsp:¬
" Show the start of lines that have been wrapped
set showbreak=↳
" Allow virtual editing in Visual block mode
" and moving the cursor to EOL characters
set virtualedit=block,onemore
" Do not insert two spaces after a sentence with a join command
set nojoinspaces
" When formatting text, recognize numbered lists
set formatoptions+=n
" Do not break a line after a one-letter word. Break before it instead
set formatoptions+=1
" Remove a comment leader when joining lines
set formatoptions+=j
" Automatically insert a comment leader after <Enter>
set formatoptions+=r
" Automatically insert a comment leader after o/O commands
set formatoptions+=o
" Use the register '+' for all yank, delete, change and put operations
set clipboard=unnamedplus
" Increase mappings timeout, decrease key codes timeout
set timeoutlen=3000 ttimeoutlen=100


"
" Search options
"
" Disable incremental (typeahead) search
set noincsearch
" Highlight search matches
set hlsearch
" Ignore case in the search pattern, unless it contains uppercase characters
set ignorecase smartcase


"
" Folding options
"
set nofoldenable
set foldmethod=indent
set foldminlines=2
set foldnestmax=10


"
" Misc options
"
" Number of commands to remember
set history=8192

" Use 'histogram' algorithm from git to get more readable diffs
set diffopt+=indent-heuristic,algorithm:histogram

" Splitting a window will put the new window below the current one
set splitbelow
" Splitting a window will put the new window right of the current one
set splitright

" Use the currently active spell checking for completion
set complete+=kspell
" Set the preferred completion options
set completeopt=menu,longest
" Set the parameters for the completion popup
set completepopup=height:20,width:80,highlight:PMenu,align:item,border:on

" Enable the enhanced command-line completion
set wildmenu wildmode=list:longest,list:full
" Ignore case during command-line completion
set wildignorecase
" Do not complete filenames with extensions listed below
set wildignore+=*.out,*.o,*.lo,*.so,*.ko,*.a,*.la,*.lai,*.bin,*.dll,*.exe
set wildignore+=*.jpg,*.png,*.tiff,*.pdf,*.djvu,*.dvi,*.ps,*.aux,*.zip
set wildignore+=*.pyc,*.pyo,__pycache__

" Fix common user typing problems
abbreviate № #
abbreviate teh the
abbreviate exmaple  example
abbreviate exmaples examples


"
" Status line
"
" Always show a status line
set laststatus=2

" Status line configuration {{{
" Preview window flag
set statusline=%w

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
" }}}


"
" Source additional configuration files
"
source ~/.vimrc.mappings
source ~/.vimrc.plugins


"
" Plugins
"
call plug#begin('~/.vim/plugins/')
" Core
Plug 'junegunn/vim-plug'
Plug 'jnurmine/Zenburn'
Plug 'Coacher/python-syntax'
Plug 'Coacher/python-indent'
Plug 'tpope/vim-repeat'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-visualrepeat'
Plug 'inkarkat/vim-SearchHighlighting'
Plug 'inkarkat/vim-SpellCheck'
Plug 'tpope/vim-unimpaired'
Plug 'Coacher/vim9-cutlass'
Plug 'Coacher/vim9-buckler'
Plug 'preservim/vim-indent-guides'
Plug 'preservim/nerdtree'
Plug 'rickhowe/diffchar.vim'
" Extra
Plug 'junegunn/vim-easy-align', {'on': '<Plug>(EasyAlign)'}
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'preservim/tagbar', {'on': 'TagbarToggle'}
Plug 'tpope/vim-fugitive', {'on': 'Git'}
" UI
Plug 'liuchengxu/vim-clap', {'do': ':Clap install-binary'}
" Development
Plug 'psf/black', {'branch': 'stable'}
Plug 'dense-analysis/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Coacher/vim-virtualenv'
Plug 'puremourning/vimspector'
" Completion
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc.vim'
Plug 'Shougo/ddc-ui-native'
Plug 'Shougo/ddc-ui-none'
Plug 'Shougo/ddc-filter-matcher_head'
Plug 'Shougo/ddc-filter-sorter_rank'
Plug 'Shougo/ddc-filter-converter_remove_overlap'
Plug 'Shougo/ddc-filter-converter_truncate_abbr'
Plug 'tani/ddc-fuzzy'
Plug 'Shougo/ddc-source-around'
Plug 'Shougo/neco-syntax'
Plug 'hokorobi/ddc-source-neco-syntax'
Plug 'delphinus/ddc-ctags'
Plug 'uga-rosa/ddc-source-dictionary'
Plug 'Shougo/neco-vim'
Plug 'Shougo/ddc-source-vim'
Plug 'matsui54/ddc-source-buffer'
Plug 'LumaKernel/ddc-source-file'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'Shougo/ddc-source-lsp'
Plug 'Shougo/echodoc.vim'
call plug#end()
"
" Source configuration files that require plugins in 'runtimepath'
"
source ~/.vimrc.last


" Status line functions {{{
" Return syntax highlight group under the cursor
function! StatuslineCurrentHighlight()
    let l:name = synIDattr(synID(line('.'), col('.'), 1), 'name')
    if empty(l:name)
        return ''
    else
        return '['.l:name.']'
    endif
endfunction

" Return '[expandtab]' if indentation does not match 'expandtab'
function! StatuslineExpandtabWarning()
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

augroup vimrcstatusline
autocmd!
autocmd BufWritePost,CursorHold * unlet! b:statusline_expandtab_warning
autocmd BufWritePost,CursorHold * unlet! b:statusline_mixed_indent_warning
autocmd BufWritePost,CursorHold * unlet! b:statusline_trailing_space_warning
augroup END
" }}}
" vim:set foldenable foldmethod=marker:
