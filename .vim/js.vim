" Vim syntax file
" Language:	Java Script
" Maintainer:	Ken Shan <ken@digitas.harvard.edu>
" Last change:	2004 Nov 16

" Remove any old syntax stuff hanging around
syn clear

" Read the C syntax to start with
source <sfile>:p:h/c.vim

" JavaScript extentions

syn keyword jsStatement	new delete this friend using typeof instanceof 
syn keyword jsAccess		function
syn keyword jsType			var	
syn keyword jsExceptions	throw try catch
syn keyword jsNumber	NPOS
syn keyword jsBoolean	true false

if !exists("did_js_syntax_inits")
  let did_js_syntax_inits = 1
  hi link jsAccess	jsStatement
  hi link jsExceptions	jsStatement
  hi link jsStatement	Statement
  hi link jsType	Type
  hi link jsNumber	Number
  hi link jsBoolean	Boolean
endif

let b:current_syntax = "js"

" vim: ts=4
