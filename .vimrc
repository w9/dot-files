call pathogen#infect()
call pathogen#helptags()

syntax enable
filetype plugin indent on

set backspace=indent,eol,start

set runtimepath+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set t_Co=256
set laststatus=2
set listchars=eol:$,tab:>-
set hlsearch
set incsearch

" retain undo's after closing files
set undofile

set nowrap
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set foldlevel=999
" this is for zero delay after quitting insert mode
set timeout timeoutlen=5000 ttimeoutlen=1

" cwd always set to current file
set autochdir

" automatically reload the file when it gets changed
set autoread

" accept mouse click
"set mouse=a

" Use only underline to highlight search results
highlight Search cterm=underline ctermbg=NONE ctermfg=NONE

" Make folded lines dimmer
highlight Folded ctermbg=red ctermfg=black

" quick navigation
noremap <C-J> 3j
noremap <C-K> 3k
noremap H ^
noremap L $

" quick quitting insert mode
inoremap jk <esc>

" delete in insert mode
inoremap <C-D> <Del>

nnoremap <Leader>l :set list! list?<CR>
nnoremap <Leader>n :noh<CR>
nnoremap <Leader>p :set paste! paste?<CR>

nnoremap Y y$

" surround selection with symbols
vnoremap " <esc>`<i"<esc>`>la"<esc>l
vnoremap ( <esc>`<i(<esc>`>la)<esc>l
vnoremap [ <esc>`<i[<esc>`>la]<esc>l

" reopen closed split
nnoremap <c-s-t> :vs<bar>:b#<CR>

let mapleader=" "
let maplocalleader="\\"

" vim-markdown fold level
let g:vim_markdown_initial_foldlevel=99
" let g:vim_markdown_folding_disabled=1

" netrw: don't show the banner
let g:netrw_banner=0




""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for vim-latex
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_CompileRule_pdf="pdflatex -interaction=nonstopmode -file-line-error-style -p $*"
" let g:Tex_ViewRule_pdf="okular"

au FileType tex,latex,context,plaintex nm <C-H> <Plug>IMAP_JumpForward
au FileType tex,latex,context,plaintex im <C-H> <Plug>IMAP_JumpForward
au FileType tex,latex,context,plaintex vm <C-H> <Plug>IMAP_JumpForward




""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for vim-r-plugin 
""""""""""""""""""""""""""""""""""""""""""""""""""""""

let vimrplugin_vsplit = 1 " For vertical tmux split
let vimrplugin_rconsole_width = 80

let g:ScreenImpl = 'Tmux'
let g:ScreenShellInitialFocus = 'shell' 
let g:vimrplugin_noscreenrc = 1
let g:vimrplugin_screenplugin = 1
let vimrplugin_conqueplugin = 0
let g:vimrplugin_map_r = 1

nnoremap <F1> <Esc>:call RAction("help")<CR>
nnoremap <F2> <Esc>:call RAction("print")<CR>
nnoremap <F3> <Esc>:call RAction("str")<CR>
nnoremap <F4> <Esc>:call RAction("head")<CR>
nnoremap <F8> <Esc>:call StartR("vanilla")<CR>

vnoremap <Space><Space> <Esc>:call SendSelectionToR("echo", "down")<CR>
nnoremap <Space><Space> :call SendLineToR("down")<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load local rc
""""""""""""""""""""""""""""""""""""""""""""""""""""""

if findfile('.vimrc_local')
  so .vimrc_local
endif

