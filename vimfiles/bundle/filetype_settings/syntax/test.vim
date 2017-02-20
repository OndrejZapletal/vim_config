" Vim syntax file
" Language: Celestia Star Catalogs
" Maintainer: Kevin Lauder
" Latest Revision: 26 April 2008

if exists("b:current_syntax")
  finish
endif

" Tats is case insensitive
syn case ignore

syn match testPass "=\+.*passed.*=\+"
syn match testFail "_\+\s.*\s_\+"
syn match testFail "=\+.*fail.*=\+"
syn match testFail "=\+\s*\d\+\s*failed in\s* \<(\d\+\.)?\d*\>\s*seconds\s*=\+"
syn match testFail "=\+\s\+ERRORS\s\+=\+"

" vim: ts=8
