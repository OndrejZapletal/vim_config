"###########################################################
" Maintainer:	Ondrej Zapletal
" Last change:	2016 Jan 09
"###########################################################
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
source $VIMRUNTIME/mswin.vim " loads Windows shortcuts into vim
behave mswin
execute pathogen#infect()
filetype plugin indent on
filetype plugin on
syntax on
colorscheme onedark
" colorscheme wombat

Helptags " regenerates help files tags for all plugins in bundle folder

" Autocommands {{{1
"###########################################################
if has("autocmd")
	"Resize Split When the window is resized"
	"au VimResized * :wincmd =

	"loads Vimrc content after each save
	autocmd! bufwritepost _vimrc source % | setlocal list | AirlineRefresh

	au WinLeave * set nocursorline nocursorcolumn

	au WinEnter * set cursorline

	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	" (happens when dropping a file on Gvim).
	" Also don't do it when the mark is in the first line, that is the default
	" position when opening a file.
	autocmd BufReadPost * if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

	" change current CWD on entering of buffer
	autocmd BufEnter * silent! lcd %:p:h

	" call StripTrailingWhitespaces() function when buffer is written for several file types
	autocmd BufWritePre *.py,*.tsf,*.vbs,*.mkd,*.c,*.m,*.java :call <SID>StripTrailingWhitespaces()
end
" }}}

" Registers {{{1
"###########################################################
let @c= "i:\\CRs\\CMU_CR"
let @o= "s:\\ECOE_CNS\\02_Public\\Users\\ZapletalOndrej\\"
let @n= "c:\\Users\\E829577\\Documents\\Git\\notes\\"
let @p= "c:\\Users\\E829577\\Documents\\Programing\\Python\\"
" }}}

" Basic settings {{{1
"###########################################################
set hlsearch
set guifont=Consolas:h10
set nu " display line numbers
if version > 702
	set rnu " display relative line numbers
endif
set hidden " it hides user buffer after opening of new file instead of forcing user to close it or save it
set ignorecase " ignore case when searching using '/'
set incsearch " move the cursor to the matched string, while typing the search pattern
set smartcase " ignore case only when capital letter is inserted into search by '/'
set showmatch " when brace is entered cursor will briefly jump to matching one
"set ruler
set novb " visual bell on
set viminfo+=n$VIM/_viminfo
set noerrorbells " turns off sound bells
set showcmd " display incomplete commands
set mouse=a " use console mouse
set history=1000
set undolevels=1000
set tabstop=4 " Set tab settings appropriate for source code editing.
set shiftwidth=4
"set expandtab
set cursorline     "create highlighted line on cursor

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set nowrap
set noshowmode

set nospell

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"backup/swap files group
set backup
set backupdir=C:\Temp
set backupskip=C:\Temp\*
set directory=C:\Temp
if version > 702
	set undofile " Vim creates undo files
endif
set writebackup

set cscopetag "If 'cscopetag' is set, the commands ":tag" and CTRL-] as well as "vim -t"
"will always use |:cstag| instead of the default :tag behavior.  Effectively,
"by setting 'cst', you will always search your cscope databases as well as
"your tag files.  The default is off.
set tags=./tags;~/Projects " sets default directory for Tags

set timeoutlen=2400
let mapleader = ","
set laststatus=2 " this loads airline plugin on start

set encoding=utf8
set fileencoding=utf8
set nolist
"Use the same symbols as TextMate for tabstops and EOLs
set list listchars=tab:\|\ ,trail:·
set linebreak
set wrap

"This always opens all folds on start
set foldlevelstart=20
" set wildmenu
set wildmode=longest,list
" set wildmode=full
set clipboard=unnamed

if version > 702
	setlocal colorcolumn=110
	highlight ColorColulmn guibg=grey21
endif

" changes vim's behavior of <C-A> and <C-X> to ignore leading zero for number (zero
" signifies octal number)
set nrformats=

" redraw only when we need to.
set lazyredraw

" moves top or bottom of screen by 3 when scrolling
set scrolloff=3
set noscrollbind
" to define block outside of actual test
set virtualedit=block

"sets omnifunc for syntax completion
set omnifunc=syntaxcomplete#Complete

" default fold text
set foldtext=FoldText()

" set csto=0

" }}}

" Basic mappings {{{1
"###########################################################
"Get Rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"Edit _vimrc
nnoremap <Leader>vi :e $myvimrc<CR>
"Edit Abolish abbreviations
nnoremap <Leader>ab :e ~/vim/vimfiles/after/plugin/abolish.vim<CR>

"when <F5> is pressed file is executed in terminal
nnoremap <buffer> <F5> :silent !%:t<cr>

"Set quick escape from insert mode.
" inoremap jk <esc>l

"swap behaviour of colon and semicolon
" vnoremap ; :
" vnoremap : ;
" nnoremap ; :
" nnoremap : ;
" onoremap ; :
" onoremap : ;

"swap behaviour of leader and comma
vnoremap \ ,
nnoremap \ ,

"invoke user defined browser functions
nnoremap <leader>u :call HandleURL()<cr>
" nnoremap <leader>g :call Google()<CR>

"for easy split switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"improved behavior of indent shift; selected region stays selected
vnoremap < <gv
vnoremap > >gv

"default behavior of indent shift remapped with leader
vnoremap <leader>< <
vnoremap <leader>> >

"apply macro on visual selection
vnoremap @ :normal @

" improves function of j and k in wrap mode
nnoremap <silent> j gj
nnoremap <silent> k gk

"sorts selected region of lines alphabetically
vnoremap <Leader>sa :sort<CR>
vnoremap <Leader>su :sort u<CR>
vnoremap <Leader>sn :sort n<CR>

"shortcuts for windows splits
nnoremap B :vsplit<enter>:wincmd l<enter>
nnoremap X :split<enter>:wincmd j<enter>

"toggles spell check option on and off
nnoremap <Leader>sp :set spell!<CR>

"toggles line wrap option on and off
nnoremap <Leader>wr :set wrap!<CR>

"Shortcut to rapidly toggle `set list`
nnoremap <leader>sl :set list!<CR>

"Fix indentation in whole file
nnoremap <leader>in gg=G<C-O><C-O>zz

"open file under cursor in new split
nnoremap <Leader>gf :vsplit<CR>:wincmd l<CR>gf

"diff mode operation mappings
nnoremap <Leader>dg :diffget<CR>
nnoremap <Leader>dp :diffput<CR>

"change size of GUI font
nnoremap <C-Up> :silent! let &guifont = substitute(&guifont, ':h\zs\d\+', '\=eval(submatch(0)+1)', '')<CR><bar>=
nnoremap <C-Down> :silent! let &guifont = substitute(&guifont, ':h\zs\d\+', '\=eval(submatch(0)-1)', '')<CR><bar>=

"resize split by Alt + move
nnoremap <A-k> <C-w>-
nnoremap <A-j> <C-w>+
nnoremap <A-h> <C-w><
nnoremap <A-l> <C-w>>

"toggle folds using space
nnoremap <silent><space> za

"search with magical mode by default
nnoremap / /\v
vnoremap / /\v

" scrolling through previous entries with filter applied
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" consistent behaviour for capital y
nnoremap Y y$

" mappings for drag visual
vmap  <expr>  <C-S-h>  DVB_Drag('left')
vmap  <expr>  <C-S-l>  DVB_Drag('right')
vmap  <expr>  <C-S-j>  DVB_Drag('down')
vmap  <expr>  <C-S-k>  DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" creates table automatically after ",|" sequence is inserted in insert mode
inoremap <silent><leader><Bar> <Bar><Esc>:call <SID>align()<CR>a

" removes highlighted text after <ESC> is hit
inoremap <silent><ESC> <ESC>:noh<CR><ESC>
nnoremap <silent><ESC> <ESC>:noh<CR><ESC>
vnoremap <silent><ESC> <ESC>:noh<CR><ESC>

" doesn't go to next match on *
nnoremap* *<C-O>

"for omni completion
inoremap <Tab> <C-P>
inoremap <C-Space> <C-X><C-O>

" prints count of word in buffer
nmap <Leader>c* :%s///gn<CR>

" go to definition in split
nnoremap <Leader>l] :vsplit<CR>:wincmd l<CR><C-]>
nnoremap <Leader>j] :split<CR>:wincmd j<CR><C-]>

" toggle Undo history
nnoremap <F2> :GundoToggle<CR>

nnoremap <Leader>xx :%!xxd<CR>
nnoremap <Leader>xr :%!xxd -r<CR>

inoremap <leader>( (
inoremap <leader>" "
inoremap <leader>[ [
inoremap <leader>{ {
"}}}

" Plugin specific mappings {{{1
"###########################################################
" Fuzzy search {{{2
"-----------------------------------------------------------
"invoke fuzzy search for files
nnoremap <Leader>ff :FufFile<enter>
"invoke fuzzy search for directories
nnoremap <Leader>fd :FufDir<enter>

" par settings{{{2
"-----------------------------------------------------------
set formatprg=par\ -w110
" nmap <Leader>q1 vip:!par -jw110<CR>
" vmap <Leader>q1 :!par -jw110<CR>
vnoremap <Leader>pa :!par -jw

" Toggle of window maximazation {{{2
"-----------------------------------------------------------
nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

function! MaximizeToggle()
	if exists("s:maximize_session")
		exec "source " . s:maximize_session
		call delete(s:maximize_session)
		unlet s:maximize_session
		let &hidden=s:maximize_hidden_save
		unlet s:maximize_hidden_save
	else
		let s:maximize_hidden_save = &hidden
		let s:maximize_session = tempname()
		set hidden
		exec "mksession! " . s:maximize_session
		only
	endif
endfunction

" The Silver Searcher {{{2
"-----------------------------------------------------------
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor
	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore

	" ag is fast enough that CtrlP doesn't need to cache
	" let g:ctrlp_use_caching = 0

	" nnoremap K *N <bar>:grep! --ignore tags "\b<C-R><C-W>\b"<CR><bar>:cw<CR>

	" noremap K :grep! "\b<C-R><C-W>\b" <CR><bar> :cw<CR>

	vnoremap K y:grep! "<C-R>0"<CR>:cw<CR>
endif

" Start Browser functions {{{2
"-----------------------------------------------------------
function! HandleURL()
	let browsPath = "C:/Program Files/Google/Chrome/Application/"
	let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;)]*')
	echo s:uri
	if s:uri != ""
		silent exec "! chrome.exe '".s:uri."'"
		silent exec '!"' . browsPath . 'chrome.exe" ' . s:uri
	else
		echo "No URI found in line."
	endif
endfunction

fun! Google()
	let browsPath = "C:/Program Files/Google/Chrome/Application/"
	let keyword = expand("<cword>")
	let url = "http://www.google.com/search?q=" . keyword
	exec '!"' . browsPath . 'chrome.exe" ' . url
endfun

" Ultisnips settings {{{2
"-----------------------------------------------------------
let g:UltiSnipsSnippetDirectories = ["c:\\Users\\E829577\\vim\\vimfiles\\UltiSnips"]
" let g:UltiSnipsSnippetDirectories = "c:\\Users\\E829577\\vim\\vimfiles\\UltiSnips"

let g:UltiSnipsSnippetsDir        = 'c:\Users\E829577\vim\vimfiles\UltiSnips'
let g:UltiSnipsEnableSnipMate     = 1

let g:UltiSnipsExpandTrigger       = "<Leader><Tab>"
let g:UltiSnipsJumpForwardTrigger  = "<Leader>f"
let g:UltiSnipsJumpBackwardTrigger = "<Leader>b"

let g:ultisnips_python_style = "doxygen"
let g:UltiSnipsEditSplit="vertical"

if has("autocmd")
	if !exists('g:did_UltiSnips_plugin')
		augroup ultisnips_custom
			autocmd!
			autocmd BufNewFile * silent! call snippet#InsertSkeleton()
		augroup END
	end
end

" Other {{{2
"-----------------------------------------------------------
let NERDTreeHijackNetrw=1
" }}}
" }}}

" General functions {{{1
"###########################################################
function! FoldText()
	let foldsize = (v:foldend-v:foldstart)
	return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction

function! s:align()
	let p = '^\s*|.*|\s*$'
	if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
		let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
		let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
		Tabularize/|
		normal! 0
		call search(repeat('[^|]*|',column).'\{-\}'.repeat('.',position),'ce',line('.'))
	endif
endfunction

function! <SID>StripTrailingWhitespaces()
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	%s/\s\+$//e
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction

function! g:GetPair(open, clsn)
	let s:orignline = getline('.')
	let s:linNum = line('.')
	let s:linPos = col('.')
	let s:prefix = strpart(s:orignline, 0, s:linPos)
	let s:postfix1 = strpart(s:orignline, s:linPos + 1 , strlen(s:orignline))
	let s:postfix2 = strpart(s:orignline, s:linPos, strlen(s:orignline))
	if s:orignline[s:linPos - 1] == a:open
		call setline('.',s:prefix . a:clsn . s:postfix1)
		call cursor(s:linNum, s:linPos+1)
	else
		call setline('.',s:prefix  . a:clsn . s:postfix2)
		call cursor(s:linNum, s:linPos+1)
	endif
endfunc

function! g:GetQuotes()
	let s:orignline = getline('.')
	let s:linNum = line('.')
	let s:linPos = col('.')
	let s:linLen = strlen(s:orignline)
	let s:prefix = strpart(s:orignline, 0, s:linPos)
	let s:prefix0 = strpart(s:orignline, 0, s:linPos-1)
	let s:postfix0 = strpart(s:orignline, s:linPos-1, strlen(s:orignline))
	let s:postfix1 = strpart(s:orignline, s:linPos, strlen(s:orignline))
	let s:postfix2 = strpart(s:orignline, s:linPos + 1, strlen(s:orignline))
	let s:postfix3 = strpart(s:orignline, s:linPos + 2, strlen(s:orignline))
	if s:linPos == 1
		if s:orignline[0] != '"' && s:orignline[1] == ''
			echo "6: - " . s:linPos
			call setline('.', '"' . s:postfix1)
			call cursor(s:linNum, 1 )
		else
			echo "7: - " . s:linPos
			call setline('.', '""' . s:postfix1)
			call cursor(s:linNum, 2)
		endif
	elseif s:prefix =~? '"\+$'
		if s:orignline[s:linPos+1] == '"'
			echo "1: - " . s:linPos
			call setline('.', s:prefix . '"' . s:postfix2)
			call cursor(s:linNum, s:linPos + 1)
		else
			echo "2: - " . s:linPos
			call setline('.', s:prefix . '"' . s:postfix2)
			call cursor(s:linNum, s:linPos + 1)
		endif
	else
		if s:orignline[s:linPos+1] == '"'
			echo "3: - " . s:linPos
			call setline('.', s:prefix . '"' . s:postfix2)
			call cursor(s:linNum, s:linPos + 1)
		else
			if s:linPos == s:linLen
				echo "5: - " . s:linPos
				call setline('.', s:prefix . '""' . s:postfix1)
				call cursor(s:linNum, s:linPos + 1)
			else
				echo "4: - " . s:linPos
				call setline('.', s:prefix0 . '""' . s:postfix0)
				call cursor(s:linNum, s:linPos + 1 )
			endif
		endif
	endif
endfunc

" Executes external command and result is shown in temporary buffer
function! s:ExecuteInShell(command)
	let command = join(map(split(a:command), 'expand(v:val)'))
	let winnr = bufwinnr('^' . command . '$')
	silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
	setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
	echo 'Execute ' . command . '...'
	silent! execute 'silent %!'. command
	silent! execute 'resize ' . line('$')
	silent! redraw
	silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
	silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
	setlocal filetype=test
	echo 'Shell command' . command . ' executed.'
endfunction

" function combines call of external ag utility with search of vim pattern. As
" result there is list of found instances of search pattern and it also
" highlighted and it can be explored by n/N commands
function! s:SearchGrep(argument)
	if a:argument =~? '^\<\w\+\>$'
		let single_word = 1
	else
		let single_word  = 0
	endif

	let search_pattern_grep = ""
	let search_pattern_vim = ""

	let escaped_operators_grep = ["#", "+", "*", "\\", "(", ")", "[", "]", "$", "^", "-", "?", "<", ">", '"']
	let escaped_operators_vim = ["#", "+", "*", "\\", "(", ")", "[", "]", "$", "^", "-", "?", "<", ">", "="]

	let index = 0
	while index < len(a:argument)
		let character = a:argument[index]
		let grep_operator_found = 0
		let vim_operator_found = 0
		for operator in escaped_operators_grep
			if character == operator
				let search_pattern_grep = search_pattern_grep . escape(character, operator)
				let grep_operator_found = 1
				break
			endif
		endfor

		if grep_operator_found == 0
			let search_pattern_grep = search_pattern_grep . character
		endif

		for operator in escaped_operators_vim
			if character == operator
				let search_pattern_vim = search_pattern_vim . escape(character, operator)
				let vim_operator_found = 1
				break
			endif
		endfor

		if vim_operator_found == 0
			let search_pattern_vim = search_pattern_vim . character
		endif

		let index = index + 1
	endwhile

	if &filetype == 'python'
		let ignore_option = '-G .py'
	else
		let ignore_option  = '--ignore tags'
	endif
	if single_word  == 0
		let search_pattern_grep  = '"' . search_pattern_grep . '"'
		let search_pattern_vim = "\\v" . search_pattern_vim
	else
		let search_pattern_grep = '"\b' . search_pattern_grep . '\b"'
		let search_pattern_vim = "\\v<" . search_pattern_vim . ">"
	endif
	silent! execute "grep! " . ignore_option . ' ' . search_pattern_grep
	silent! execute "cw"
	let @/ = search_pattern_vim
endfunction

" Evalutes expression on curent line. It removes all characters that are not
" part of an expression and up to equale sign. Resul is inserted on the end of
" the line after the equale sign
function! ComputeExpresssion()
	let expression_line = getline('.')
	let before_equal = split(expression_line, "=")
	let expression = substitute(before_equal[0], '\([a-zA-Z:" ]\)', '', "g")
	call setline('.',before_equal[0])
    silent execute "normal! A= =".expression."\<cr>"
endfunction
" }}}
"
" Testing (new functions that are in trail period) {{{1
"###########################################################

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>

" TODO
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Airline
" let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

" Indent Guides
let g:indentLine_char = '|'
let g:indentLine_faster = 1

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>


nnoremap <Leader>mr :CtrlPMRU

nnoremap <Leader>rf :lnext
nnoremap <Leader>rb :lprev
nnoremap <F3> :SyntasticCheck

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*


" highlight Cursor guifg=white guibg=black
" highlight CursorLine guibg=grey

nnoremap <Leader>bn :bn
nnoremap <Leader>bp :bp

set splitright
set splitbelow

let g:SimpylFold_docstring_preview=1

autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<


" TODO:
function! s:ChangeIndentWidth(orig, new)
	" let s = "normal! %s/^".'\s'*a:orig."(.*$)/".'\s'*a:new."\1"
	execute s
	echo s
	silent! execute setlocal tabstop=a:orig
	" setlocal shiftwidth=a:orig
	" setlocal softtabstop=a:orig
	" setlocal expandtab
endfunc

" CtrlP settings
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_working_path_mode = 'ar'
let g:ctrlp_custom_ignore = '\v(([\/]\.(git|hg|svn))|(\.(exe|dll|un\~|swp)$))'
" let g:ctrlp_use_caching = 0
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_working_path_mode = 0


inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

command! -complete=shellcmd -nargs=+ SGrep call s:SearchGrep(<q-args>)

nnoremap <silent>K :SGrep <C-R><C-W><CR>
vnoremap <silent>K y:SGrep <C-R>0<CR>

nnoremap <silent><leader>= :call  ComputeExpresssion()<cr>

command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

let g:syntastic_python_checkers = ['flake8']
set wildignore+=tags

autocmd BufRead *.abs normal :%!xxd<cr>
" nnoremap <silent><buffer>K :grep! -G .py "\b<C-R><C-W>\b" <CR>:cw<CR>
set csprg=c:\tools\cscope.exe

" Jeff's cscope settings
if has("cscope")
	" change this to 1 to search ctags DBs first
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
	    cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    cs add $CSCOPE_DB
	endif
	set csverb

	" Using 'CTRL-\' then a search type makes the vim window
	" "shell-out", with search results displayed on the bottom

	nnoremap <Leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
	nnoremap <Leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
	nnoremap <Leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
	nnoremap <Leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
	nnoremap <Leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
	nnoremap <Leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nnoremap <Leader>ci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nnoremap <Leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>

	" Using 'CTRL-spacebar' then a search type makes the vim window
	" split horizontally, with search result displayed in
	" the new window.

" 	nmap <C-[>s :scs find s <C-R>=expand("<cword>")<CR><CR>
" 	nmap <C-[>g :scs find g <C-R>=expand("<cword>")<CR><CR>
" 	nmap <C-[>c :scs find c <C-R>=expand("<cword>")<CR><CR>
" 	nmap <C-[>t :scs find t <C-R>=expand("<cword>")<CR><CR>
" 	nmap <C-[>e :scs find e <C-R>=expand("<cword>")<CR><CR>
" 	nmap <C-[>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
" 	nmap <C-[>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" 	nmap <C-[>d :scs find d <C-R>=expand("<cword>")<CR><CR>

" 	" Hitting CTRL-space *twice* before the search type does a vertical
" 	" split instead of a horizontal one

" 	nmap <C-[><C-[>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
" 	nmap <C-[><C-[>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
" 	nmap <C-[><C-[>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
" 	nmap <C-[><C-[>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
" 	nmap <C-[><C-[>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
" 	nmap <C-[><C-[>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" 	nmap <C-[><C-[>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

endif

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

