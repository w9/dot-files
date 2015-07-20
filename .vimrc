" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'bling/vim-airline'

NeoBundleLazy 'Valloric/YouCompleteMe'
NeoBundleLazy 'scrooloose/nerdcommenter'
NeoBundleLazy 'klen/python-mode'

autocmd FileType c,cpp NeoBundleSource YouCompleteMe
autocmd FileType c,cpp NeoBundleSource nerdcommenter
autocmd FileType python NeoBundleSource python-mode

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

syntax enable

" save and restore cursor and screen position
autocmd BufWinLeave * mkview
autocmd BufReadPost * silent loadview

let mapleader = " "
let maplocalleader = "\\"

" this solves ruby syntax being slow
set re=1

set backspace=indent,eol,start

set runtimepath+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set t_Co=256
set laststatus=2
set listchars=eol:$,tab:>-
set hlsearch
set incsearch

set relativenumber
set number
set cursorline

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

" search upwards until find tags
set tags=./tags;/

" auto add comment symbols
set formatoptions=rq

" accept mouse click
"set mouse=a

" load .vimrc from working directory if present
set exrc
set secure


" Use only underline to highlight search results
highlight Search term=NONE cterm=underline ctermbg=NONE ctermfg=NONE
highlight CursorLine term=NONE cterm=NONE ctermbg=Black ctermfg=NONE
highlight LineNr term=NONE cterm=NONE ctermfg=DarkGrey ctermbg=Black
highlight CursorLineNr term=NONE cterm=NONE ctermfg=NONE ctermbg=232
highlight ColorColumn term=NONE cterm=NONE ctermfg=NONE ctermbg=Black

" Make folded lines dimmer
highlight Folded ctermbg=red ctermfg=black

" quick navigation
nnoremap <C-J> 3j
nnoremap <C-K> 3k
vnoremap <C-J> 3j
vnoremap <C-K> 3k

" delete in insert mode
inoremap <C-D> <Del>

nnoremap <Leader>l :set list! list?<CR>
nnoremap <Leader>n :set number! relativenumber! number?<CR>
nnoremap <Leader>p :set paste! paste?<CR>

nnoremap Y y$

" surround selection with symbols
vnoremap " <ESC>`<i"<ESC>`>la"<ESC>l
vnoremap ( <ESC>`<i(<ESC>`>la)<ESC>l
vnoremap [ <ESC>`<i[<ESC>`>la]<ESC>l

" build
noremap <C-F9> :w<CR> :silent !clear; make<CR>
" make and run
noremap <S-F10> :w<CR> :silent !clear; make<CR> :!echo "--------------- Running ---------------"; echo; "./%<"<CR>
" print debug info after running
noremap <S-F9> :w<CR> :silent !clear; make<CR> :!echo "--------------- Running ---------------"; echo; command time -v "./%<"<CR>

noremap <CR> :nohlsearch<CR>

" reopen closed split
nnoremap <F12> :vs<bar>:b#<CR>

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
" load local rc
""""""""""""""""""""""""""""""""""""""""""""""""""""""

if findfile('.vimrc_local')
  so .vimrc_local
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerd tree
""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-n> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1


let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''


let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info


let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 1


let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'


nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>
