" settings
setlocal nowrap
setlocal foldmethod=syntax
setlocal shiftwidth=3
setlocal softtabstop=3
setlocal tabstop=3
setlocal expandtab
setlocal colorcolumn=80

" mappings
" inoremap <buffer> { {<C-[>o}<C-[>O<C-Q><Tab>
" inoremap <buffer> ( ()<C-[>i
" inoremap <buffer> [ []<C-[>i
" inoremap <buffer> < <><C-[>i

" inoremap <buffer> <silent>) <C-[>:call g:GetPair('(',')')<CR>a
" inoremap <buffer> <silent>] <C-[>:call g:GetPair('[',']')<CR>a
" inoremap <buffer> <silent>> <C-[>:call g:GetPair('<','>')<CR>a

nnoremap <buffer> <F12> :silent !ctags_c_generate<CR>

nnoremap <buffer> <Leader>pl :e ~/vim/vimfiles/bundle/filetype_settings/ftplugin/c.vim<CR>

" autocommands
autocmd! bufwritepost source %
