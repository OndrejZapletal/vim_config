" settings
setlocal nospell
" mappings

nnoremap <buffer> <cr> :q<cr> <bar> :AirlineToggleWhitespace<cr> 

" autocommands
autocmd! bufwritepost test.vim source %
