setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal guifont=Consolas:h10:cEASTEUROPE
setlocal linebreak
setlocal nolist
setlocal nornu 
setlocal nonu 
setlocal wrap
setlocal textwidth=110
setlocal wrapmargin=110

" mappings
nnoremap <buffer> <Leader>pl :e ~/vim/vimfiles/bundle/_general_vim_settings_/ftplugin/text.vim<CR>

" autocommands
autocmd! bufwritepost source % 
:IndentLinesDisable<cr>
