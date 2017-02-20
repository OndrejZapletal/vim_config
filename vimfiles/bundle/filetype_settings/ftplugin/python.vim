" settings
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal list

setlocal colorcolumn=99
setlocal nowrap

setlocal foldmethod=indent
setlocal foldenable
setlocal foldlevel=10
setlocal foldcolumn=0

" mappings
nnoremap <buffer> <F5> :exec '!c:\Python27\python.exe' shellescape(@%, 1)<cr>
nnoremap <buffer> <F6> :w<cr> <bar> :exec '!c:\Python35\python.exe' shellescape(@%, 1)<cr>
nnoremap <buffer> <F8> :w<cr> <bar> :AirlineToggleWhitespace<cr> <bar> :Shell py.test %<cr>
nnoremap <buffer> <F10> :exec '!c:\Python35\python.exe' shellescape(@%, 1)<cr>
nnoremap <buffer> <F12> :silent !ctags_PY_generate<CR>

nnoremap <buffer> <Leader>bi  Oipdb.set_trace(context=15)  # #BREAKPOINT#<ESC>
nnoremap <buffer> <Leader>pl :e ~/vim/vimfiles/bundle/filetype_settings/ftplugin/python.vim<CR>

" inoremap <buffer> ( ()<C-[>i
" inoremap <buffer> [ []<C-[>i
" inoremap <buffer> < <><C-[>i
" inoremap <buffer> { {}<C-[>i

" inoremap <buffer> <silent>) <C-[>:call g:GetPair('(',')')<CR>a
" inoremap <buffer> <silent>] <C-[>:call g:GetPair('[',']')<CR>a
" inoremap <buffer> <silent>> <C-[>:call g:GetPair('<','>')<CR>a
" inoremap <buffer> <silent>} <C-[>:call g:GetPair('{','}')<CR>a

" autocommands
autocmd! bufwritepost python.py source %

" -------
" testing
" -------
" inoremap <buffer> <silent>" <C-o>:call g:GetQuotes()<CR>
" let g:QuotePressed = 1
" inoremap <buffer> " ""<C-[>i
