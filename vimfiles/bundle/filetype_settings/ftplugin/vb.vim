" Vim filetype plugin file
" Language:	VisualBasic (ft=vb)
" Maintainer:	Johannes Zellner <johannes@zellner.org>
" Last Change:	Thu, 22 Nov 2001 12:56:14 W. Europe Standard Time

if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1

setlocal com=sr:'\ -,mb:'\ \ ,el:'\ \ ,:'

" we need this wrapper, as call doesn't allow a count
fun! <SID>VbSearch(pattern, flags)
	let cnt = v:count1
	while cnt > 0
		call search(a:pattern, a:flags)
		let cnt = cnt - 1
	endwhile
endfun

let s:cpo_save = &cpo
set cpo&vim

" NOTE the double escaping \\|
nnoremap <buffer> <silent> [[ :call <SID>VbSearch('^\s*\(\(private\|public\)\s\+\)\=\(function\\|sub\)', 'bW')<cr>
nnoremap <buffer> <silent> ]] :call <SID>VbSearch('^\s*\(\(private\|public\)\s\+\)\=\(function\\|sub\)', 'W')<cr>
nnoremap <buffer> <silent> [] :call <SID>VbSearch('^\s*\<end\>\s\+\(function\\|sub\)', 'bW')<cr>
nnoremap <buffer> <silent> ][ :call <SID>VbSearch('^\s*\<end\>\s\+\(function\\|sub\)', 'W')<cr>

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

" mappings
nnoremap <buffer> <F5> :silent !%<CR>
nnoremap <buffer> <F12> :silent !ctags_VBS_generate.bat<CR>
nnoremap <buffer> <Leader>pl :e ~/vim/vimfiles/bundle/filetype_settings/ftplugin/vb.vim<CR>


" inoremap <buffer>( ()<C-[>i
" inoremap <buffer>[ []<C-[>i
" inoremap <buffer>< <><C-[>i
" inoremap <buffer>" ""<C-[>i

" inoremap <buffer><silent>) <C-[>:call g:GetPair('(',')')<CR>a
" inoremap <buffer><silent>] <C-[>:call g:GetPair('[',']')<CR>a
" inoremap <buffer><silent>> <C-[>:call g:GetPair('<','>')<CR>a

nnoremap <buffer> <Leader>he A<C-r>=repeat(' ', 110-virtcol('.'))<CR>#
nnoremap <buffer> <Leader>hb A<C-r>=repeat('#', 110-virtcol('.'))<CR>#

" autocommands
autocmd! bufwritepost source %

" -------
" testing
" -------
"setlocal foldexpr=Foldexpr_Vb(v:lnum)
" fun! Foldexpr_Vb(lnum)
"
" 	let this_line = getline(a:lnum)
" 	let NONLINES = '^\s*\($\|''.\+$\)'
" 	if this_line =~? '^''#.\+$'
" 		return '0'
" 	elseif this_line =~? NONLINES
" 		if a:lnum == 0
" 			return '1'
" 		else
" 			return '='
" 		end if
" 	endif
"
" 	" Find a non-blank line above the current line.
" 	" Skip over labels and preprocessor directives.
" 	let lnumPrev = a:lnum
" 	while lnumPrev > 0
" 		let lnumPrev = prevnonblank(lnumPrev - 1)
" 		let previous_line = getline(lnumPrev)
" 		if previous_line !~? NONLINES
" 			break
" 		endif
" 	endwhile
"
" 	" Hit the start of the file, use zero indent.
" 	if lnumPrev == 0
" 		return '1'
" 	endif
"
" 	let thisLineIndent  =  indent(a:lnum)/shiftwidth()
" 	let previusLineIndent =  indent(lnumPrev)/shiftwidth()
" 	let lineDifference = previusLineIndent - thisLineIndent
" 	if lineDifference == 0
" 		return '='
" 	elseif lineDifference > 0
" 		return '>'.string(thisLineIndent+1)
" 	endif
" endfun
