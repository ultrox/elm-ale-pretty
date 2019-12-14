if exists('g:disable_elm_ale_pretty') || !has('conceal') || &enc != 'utf-8'
    finish
endif

if exists('b:current_syntax')
    finish
endif


syn match lineNumber '^\d\+\|'
syn match pointErr '\^'
syn keyword elmNote Note: Note Tip Tips Hint: Hint

syn match helpBacktick	contained "`" conceal

let b:current_syntax = 'ale-preview'


syn match helpCommand		"`[^` \t]\+`"hs=s+1,he=e-1 contains=helpBacktick
syn match helpCommand		"\(^\|[^a-z"[]\)\zs`[^`]\+`\ze\([^a-z\t."']\|$\)"hs=s+1,he=e-1 contains=helpBacktick
hi def link helpBacktick	  Ignore

hi def link lineNumber      Constant
hi def link pointErr        SpecialChar
hi def link elmNote		      Todo

hi def link helpCommand		  Identifier

syn match helpHash		contained "\#" conceal
syn match helpHyperTextEntry	"\#[#-)!+-~]\+\#\s"he=e-1 contains=helpHash
syn match helpHyperTextEntry	"\#[#-)!+-~]\+\#$" contains=helpHash
hi def link helpHash		Ignore

hi def link helpHyperTextEntry	String

setlocal conceallevel=2
setlocal concealcursor=nc
