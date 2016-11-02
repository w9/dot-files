abbreviate lpr liftIO . print $
abbreviate lpl liftIO . putStrLn $
abbreviate pl putStrLn $

nnoremap <Leader><Leader> :GhcModType<CR>
nnoremap <Leader><CR> :GhcModTypeClear<CR>
nnoremap <Leader><Backspace> :GhcModCheck<CR>
nmap     <Space>. / \. <CR>i<CR><Esc><Esc>l<CR>

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc


""""""""""""""""""""""""""""""""""""""""""""""""""
" Example vimrc file to bind a key to fix-imports.
""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <Leader>i :call FixImports()<CR>

