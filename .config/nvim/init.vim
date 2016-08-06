call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'

" Load local plugins and their settings
if file_readable($HOME . "/.config/nvim/local_plugins.vim")
  so $HOME/.config/nvim/local_plugins.vim
endif

call plug#end()

" save and restore cursor and screen position
" complex logic for special cases, copied from Wikia
let g:skipview_files = [
            \ '[EXAMPLE PLUGIN BUFFER]'
            \ ]
function! MakeViewCheck()
    if has('quickfix') && &buftype =~ 'nofile'
        " Buffer is marked as not a file
        return 0
    endif
    if empty(glob(expand('%:p')))
        " File does not exist on disk
        return 0
    endif
    if len($TEMP) && expand('%:p:h') == $TEMP
        " We're in a temp dir
        return 0
    endif
    if len($TMP) && expand('%:p:h') == $TMP
        " Also in temp dir
        return 0
    endif
    if index(g:skipview_files, expand('%')) >= 0
        " File is in skip list
        return 0
    endif
    return 1
endfunction
augroup vimrcAutoView
    autocmd!
    " Autosave & Load Views.
    autocmd BufWritePost,BufLeave,WinLeave ?* if MakeViewCheck() | mkview | endif
    autocmd BufWinEnter ?* if MakeViewCheck() | silent! loadview | endif
augroup end

" fix syntax error when the file is loaded from middle
autocmd BufEnter * :syntax sync fromstart


let mapleader = " "
let maplocalleader = "\\"

set background=dark

set mouse=
set number
set cursorline
set listchars=tab:>-,trail:-,nbsp:+,eol:$

" retain undo's after closing files
set undofile

set nowrap
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set foldlevel=999

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
highlight CursorLine   term=NONE cterm=NONE      ctermfg=NONE      ctermbg=234
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

" select pasted text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

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

nnoremap <CR> :nohlsearch<CR>

" reopen closed split
nnoremap <F12> :vs<bar>:b#<CR>

" vim-markdown fold level
let g:vim_markdown_initial_foldlevel=99
" let g:vim_markdown_folding_disabled=1

" netrw: don't show the banner
"let g:netrw_banner=0


" Search for selected text.
" http://vim.wikia.com/wiki/VimTip171
let s:save_cpo = &cpo | set cpo&vim
if !exists('g:VeryLiteral')
  let g:VeryLiteral = 0
endif
function! s:VSetSearch(cmd)
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  normal! gvy
  if @@ =~? '^[0-9a-z,_]*$' || @@ =~? '^[0-9a-z ,_]*$' && g:VeryLiteral
    let @/ = @@
  else
    let pat = escape(@@, a:cmd.'\')
    if g:VeryLiteral
      let pat = substitute(pat, '\n', '\\n', 'g')
    else
      let pat = substitute(pat, '^\_s\+', '\\s\\+', '')
      let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
      let pat = substitute(pat, '\_s\+', '\\_s\\+', 'g')
    endif
    let @/ = '\V'.pat
  endif
  normal! gV
  call setreg('"', old_reg, old_regtype)
endfunction
vnoremap <silent> * :<C-U>call <SID>VSetSearch('/')<CR>/<C-R>/<CR>
vnoremap <silent> # :<C-U>call <SID>VSetSearch('?')<CR>?<C-R>/<CR>
vmap <kMultiply> *
nmap <silent> <Plug>VLToggle :let g:VeryLiteral = !g:VeryLiteral
  \\| echo "VeryLiteral " . (g:VeryLiteral ? "On" : "Off")<CR>
if !hasmapto("<Plug>VLToggle")
  nmap <unique> <Leader>vl <Plug>VLToggle
endif
let &cpo = s:save_cpo | unlet s:save_cpo

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for terminal
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" exit terminal by ESC
tnoremap <Esc> <C-\><C-n>

" save ther job ID of last terminal
augroup Terminal
  au!
  au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
augroup END

function! GetVisualSelection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return lines
endfunction

" send current line to last terminal
function! REPLSend(lines)
  call jobsend(g:last_terminal_job_id, add(a:lines, ''))
endfunction

command! REPLSendLine call REPLSend([getline('.')])
command! REPLSendSelection call REPLSend(GetVisualSelection())

nnoremap <silent> <C-\> :REPLSendLine<cr><cr>
vnoremap <silent> <C-\> :<C-U>REPLSendSelection<cr>gv


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
