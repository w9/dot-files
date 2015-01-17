call pathogen#infect()
call pathogen#helptags()

syntax enable
filetype plugin indent on

set rtp+=$HOME/.local/lib/python2.6/site-packages/powerline/bindings/vim/
set t_Co=256
set laststatus=2

let mapleader=" "

" use soft tabs
set nowrap ts=2 si sw=2 et sts=2

" Use only underline to highlight search results
hi Search cterm=underline ctermbg=NONE ctermfg=NONE
set hls      " search higlight
set is       " incremental search

" Make folded lines dimmer
hi Folded ctermbg=red ctermfg=black
" set foldlevel=3

" quick navigation
nn <C-J> 3j
nn <C-K> 3k
vn <C-J> 3j
vn <C-K> 3k

" delete in insert mode
ino <C-D> <Del>

" vim-markdown fold level
let g:vim_markdown_initial_foldlevel=99
" let g:vim_markdown_folding_disabled=1

" netrw: don't show the banner
let g:netrw_banner=0

set listchars=eol:$,tab:>-
nn <Leader>l :set list! list?<CR>
nn <Leader>n :noh<CR>
nn <Leader>p :set paste! paste?<CR>

nn Y y$

" retain undo's after closing files
set undofile

let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_CompileRule_pdf="pdflatex -interaction=nonstopmode -file-line-error-style -p $*"
" let g:Tex_ViewRule_pdf="okular"

nm <C-H> <Plug>IMAP_JumpForward
im <C-H> <Plug>IMAP_JumpForward
vm <C-H> <Plug>IMAP_JumpForward

" accept mouse click
"set mouse=a

" this is for zero delay after quitting insert mode
set timeout timeoutlen=5000 ttimeoutlen=1

nmap <c-s-t> :vs<bar>:b#<CR>

" cwd always set to current file
se autochdir

set backspace=indent,eol,start

let vimrplugin_vsplit = 1
let vimrplugin_rconsole_width = 80

set autoread
