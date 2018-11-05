" Vim syntax file
" Language:	IDL
" Maintainer:	Todd Fisher <toddf@simosoftware.com>
" Last change:	2004 Nov 16

" Remove any old syntax stuff hanging around
syn clear
" Read the C syntax to start with
source <sfile>:p:h/c.vim

syn keyword idlStatement interface attribute 
syn keyword	idlType		long short octet boolean wstring string wchar char void
syn keyword	idlType		unsigned float double

if !exists("did_idl_syntax_inits")
  let did_idl_syntax_inits = 1
  hi link idlAccess	cppStatement
  hi link idlCast	cppStatement
  hi link idlExceptions	cppStatement
  hi link idlStatement	Statement
  hi link idlType	Type
  hi link idlSTL	Type
  hi link idlStorageClass	StorageClass
  hi link idlStructure	Structure
  hi link idlNumber	Number
  hi link idlBoolean	Boolean
endif

let b:current_syntax = "idl"
