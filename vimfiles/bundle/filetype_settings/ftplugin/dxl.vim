setlocal makeprg=python\ ~\Vim\vimfiles\ftplugin\ParseAndRunDxlFile.py\ %:p
"setlocal efm=-E-\ DXL: \ <Line:%l>\ %m,-E-\ DXL:\ <%f:%l>\ %m,-R-E-\ DXL:\ <Line:%l>\ %m,-R-E\ DXL:\ <%f:%l>\ %m
nnoremap <buffer> <F5> :make<cr>

setlocal tabstop=4
setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal nowrap

setlocal foldmethod=indent
setlocal foldenable
setlocal foldlevel=0
setlocal foldcolumn=0

" autocommands
autocmd! bufwritepost source %
