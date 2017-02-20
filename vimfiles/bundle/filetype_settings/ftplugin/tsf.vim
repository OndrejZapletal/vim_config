" Vim filetype plugin file
" Language:	TATS (ft=tsf)
" Maintainer:	Ondrej Zapletal
" Last Change:	Mon, 06 Dec 2015 00:32:14 W. Europe Standard Time

if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1

setlocal com=sr:'\ -,mb:'\ \ ,el:'\ \ ,:'

" we need this wrapper, as call doesn't allow a count
fun! <SID>TsfSearch(pattern, flags)
	let cnt = v:count1
	while cnt > 0
		call search(a:pattern, a:flags)
		let cnt = cnt - 1
	endwhile
endfun

let s:cpo_save = &cpo
set cpo&vim

" NOTE the double escaping \\|
nnoremap <buffer> <silent> [[ :call <SID>TsfSearch('^\s*\(\(private\|public\)\s\+\)\=\(function\\|sub\)', 'bW')<cr>
nnoremap <buffer> <silent> ]] :call <SID>TsfSearch('^\s*\(\(private\|public\)\s\+\)\=\(function\\|sub\)', 'W')<cr>
nnoremap <buffer> <silent> [] :call <SID>TsfSearch('^\s*\<end\>\s\+\(function\\|sub\)', 'bW')<cr>
nnoremap <buffer> <silent> ][ :call <SID>TsfSearch('^\s*\<end\>\s\+\(function\\|sub\)', 'W')<cr>

" matchit support
if exists("loaded_matchit")
	let b:match_ignorecase=1
	let b:match_words=
		\ '\%(^\s*\)\@<=\<if\>.*\<then\>\s*\(''.*\)\?$:\%(^\s*\)\@<=\<else\>:\%(^\s*\)\@<=\<elseif\>:\%(^\s*\)\@<=\<end\>\s\+\<if\>,' .
		\ '\%(^\s*\)\@<=\<for\>:\%(^\s*\)\@<=\<next\>,' .
		\ '\%(^\s*\)\@<=\<while\>:\%(^\s*\)\@<=\<wend\>,' .
		\ '\%(^\s*\)\@<=\<do\>:\%(^\s*\)\@<=\<loop\>\s\+\<while\>,' .
		\ '\%(^\s*\)\@<=\<select\>\s\+\<case\>:\%(^\s*\)\@<=\<case\>:\%(^\s*\)\@<=\<end\>\s\+\<select\>,' .
		\ '\%(^\s*\)\@<=\<enum\>:\%(^\s*\)\@<=\<end\>\s\<enum\>,' .
		\ '\%(^\s*\)\@<=\<with\>:\%(^\s*\)\@<=\<end\>\s\<with\>,' .
		\ '\%(^\s*\)\@<=\%(\<\%(private\|public\)\>\s\+\)\=\<function\>\s\+\([^ \t(]\+\):\%(^\s*\)\@<=\<\1\>\s*=:\%(^\s*\)\@<=\<end\>\s\+\<function\>,' .
		\ '\%(^\s*\)\@<=\%(\<\%(private\|public\)\>\s\+\)\=\<sub\>\s\+:\%(^\s*\)\@<=\<end\>\s\+\<sub\>'
endif

let &cpo = s:cpo_save
unlet s:cpo_save

" settings
setlocal foldmethod=indent
setlocal foldenable
setlocal foldlevel=10
setlocal foldcolumn=0
setlocal colorcolumn=100
setlocal list
setlocal nowrap
setlocal ts=3 sts=3 sw=3 expandtab
retab

" mappings
nnoremap <buffer> <F5> :silent !tatsexpress localhost %<CR>
nnoremap <buffer> <F12> :silent !ctags_TSF_generate<CR>
nnoremap <buffer> <Leader>pl :e ~/vim/vimfiles/bundle/filetype_settings/ftplugin/tsf.vim<CR>

" inoremap <buffer> ( ()<C-[>i
" inoremap <buffer> [ []<C-[>i
" inoremap <buffer> < <><C-[>i
" inoremap <buffer> " ""<C-[>i

" inoremap <buffer> <silent>) <C-[>:call g:GetPair('(',')')<CR>a
" inoremap <buffer> <silent>] <C-[>:call g:GetPair('[',']')<CR>a
" inoremap <buffer> <silent>> <C-[>:call g:GetPair('<','>')<CR>a

" autocommands
autocmd! bufwritepost source %

" -------
" testing
" -------
" fun! Foldexpr_Tsf(lnum)
" 	let thisLineIndent  =  indent(a:lnum)/shiftwidth()
" 	let previusLineIndent =  indent(a:lnum - 1)/shiftwidth()
" 	let lineDifference = previusLineIndent - thisLineIndent
" 	if lineDifference == 0
" 		return '='
" 	elseif lineDifference > 0
" 		return '>'.string(thisLineIndent+1)
" 	endif
" endfun


"setlocal foldexpr=Foldexpr_Tsf(v:lnum)
