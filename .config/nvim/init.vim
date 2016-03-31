call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'

" Load local plugins and their settings
if file_readable($HOME . "/.config/nvim/local_plugins.vim")
  so $HOME/.config/nvim/local_plugins.vim
endif

call plug#end()


let mapleader = " "
let maplocalleader = "\\"

set background=dark

set t_Co=256
set t_ZH=[3m
set t_ZR=[23m

set number
set cursorline

" retain undo's after closing files
set undofile

set nowrap
set nosmartindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set foldlevel=999
" this is for zero delay after quitting insert mode
set timeout timeoutlen=5000 ttimeoutlen=1

" cwd always set to current file
set autochdir

" make autocompletion work just like an IDE
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" load .vimrc from working directory if present
set exrc
set secure

" gui options
set guioptions-=m  " menu bar
set guioptions-=T  " menu toobar
set guioptions-=r  " menu right-hand scroll bar
set guioptions-=L  " menu left-hand scroll bar


" Use only underline to highlight search results
highlight Search       term=NONE cterm=underline ctermfg=NONE      ctermbg=NONE
highlight CursorLine   term=NONE cterm=NONE      ctermfg=NONE      ctermbg=232
highlight LineNr       term=NONE cterm=NONE      ctermfg=DarkGrey  ctermbg=235
highlight CursorLineNr term=NONE cterm=NONE      ctermfg=NONE      ctermbg=235
highlight ColorColumn  term=NONE cterm=NONE      ctermfg=NONE      ctermbg=Black
highlight MatchParen   term=NONE cterm=bold      ctermfg=NONE      ctermbg=232
highlight Folded       term=NONE cterm=italic    ctermfg=240       ctermbg=234

" quick navigation
nnoremap <C-J> 3j
nnoremap <C-K> 3k
vnoremap <C-J> 3j
vnoremap <C-K> 3k

nnoremap zt zt5<C-Y>
nnoremap zb zb5<C-E>

nnoremap <C-G> :echo expand('%:p')<CR>

nnoremap <Leader>re #*:%s//

" delete in insert mode
inoremap <C-D> <Del>

nnoremap <Leader>l :set list! list?<CR>
nnoremap <Leader>p :set number! cursorline! paste! paste?<CR>
nnoremap <Leader>8 :%s/.\{80}\($\)\@!/&\r/g<CR>:nohlsearch<CR>

nnoremap Y y$

" surround selection with symbols
"vnoremap " <ESC>`<i"<ESC>`>la"<ESC>l
"vnoremap ( <ESC>`<i(<ESC>`>la)<ESC>l
"vnoremap [ <ESC>`<i[<ESC>`>la]<ESC>l

" build
noremap <C-F9> :w<CR> :silent !clear; make<CR>
" make and run
noremap <S-F10> :w<CR> :silent !clear; make<CR> :!echo "--------------- Running ---------------"; echo; "./%<"<CR>
" print debug info after running
noremap <S-F9> :w<CR> :silent !clear; make<CR> :!echo "--------------- Running ---------------"; echo; command time -v "./%<"<CR>

noremap [[ 6H
noremap ]] 6L
noremap <CR> :nohlsearch<CR>

" reopen closed split
nnoremap <F12> :vs<bar>:b#<CR>

" vim-markdown fold level
let g:vim_markdown_initial_foldlevel=99
" let g:vim_markdown_folding_disabled=1

" netrw: don't show the banner
let g:netrw_banner=0



""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for vim-r-plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let vimrplugin_vsplit = 1 " For vertical tmux split
"let vimrplugin_rconsole_width = 80
"
"let g:ScreenImpl = 'Tmux'
"let g:ScreenShellInitialFocus = 'shell' 
"let g:vimrplugin_noscreenrc = 1
"let g:vimrplugin_screenplugin = 1
"let vimrplugin_conqueplugin = 0
"let g:vimrplugin_map_r = 1
"
"noremap <F1> <Esc>:call RAction("help")<CR>
"noremap <F2> <Esc>:call RAction("print")<CR>
"noremap <F3> <Esc>:call RAction("str")<CR>
"noremap <F4> <Esc>:call RAction("head")<CR>
"
"noremap <F7> <Esc>:call g:SendCmdToR("devtools::load_all()")<CR>
"noremap <F8> <Esc>:call StartR("vanilla")<CR>
"
"vnoremap <Down> <Esc>:call SendSelectionToR("echo", "down")<CR>
"nnoremap <Down> :call SendLineToR("down")<CR>
"inoremap <Down> <Esc>:call SendLineToR("down")<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''



""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load local rc
""""""""""""""""""""""""""""""""""""""""""""""""""""""

if file_readable($HOME . ".config/nvim/local.vim")
  so $HOME/.config/nvim/local.vim
endif
