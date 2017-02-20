" settings
setlocal list
setlocal foldmethod=marker
setlocal foldlevel=0

" mappings
" inoremap <buffer> ( ()<C-[>i
" inoremap <buffer> [ []<C-[>i
" inoremap <buffer> < <><C-[>i

" inoremap <buffer> <silent>) <C-[>:call g:GetPair('(',')')<CR>a
" inoremap <buffer> <silent>] <C-[>:call g:GetPair('[',']')<CR>a
" inoremap <buffer> <silent>> <C-[>:call g:GetPair('<','>')<CR>a

nnoremap <buffer> <Leader>pl :e ~/vim/vimfiles/bundle/filetype_settings/ftplugin/vim.vim<CR>

" autocommands
autocmd! bufwritepost source %
