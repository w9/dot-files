abbreviate lpr liftIO . print $
abbreviate lpl liftIO . putStrLn $
abbreviate pl putStrLn $

nnoremap <Leader><Leader> :GhcModType<CR>
nnoremap <Leader><CR> :GhcModTypeClear<CR>
nnoremap <Leader><Backspace> :GhcModCheck<CR>
nmap     <Space>. / \. <CR>i<CR><Esc><Esc>l<CR>

set autoindent
set indentexpr=GetHaskellIndent()
set indentkeys=!^F,o,O,=where,0<Bar>

set softtabstop=4
set shiftwidth=4

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc


""""""""""""""""""""""""""""""""""""""""""""""""""
" Example vimrc file to bind a key to fix-imports.
""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <Leader>i :call FixImports()<CR>
