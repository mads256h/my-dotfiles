" Vim syntax file
" Language: FlowG
" Maintainer: Mads Mogensen

if exists("b:current_syntax")
  finish
endif

syn match flowgIdentifier "\w\(\w\|\d\)*"

syn match flowgNumber "\d\+\(\.\d\+\)\?"
syn keyword flowgBoolean true false

syn keyword flowgFunction move line sqrt sin cos tan arcsin arccos arctan

syn keyword flowgKeyword for to if else return gcode
syn match flowgKeyword "#include"
syn match flowgOperator "+\|-\|\*\|/\|\^\|=\|+=\|-=\|\*=\|/=\|\^="

syn region flowgUserIncludeBlock start="\"" end="\"" transparent contains=flowgString
syn region flowgSystemIncludeBlock start="<" end=">" transparent contains=flowgString

syn keyword flowgType void number bool point

syn region flowgBlock start="{" end="}" fold transparent

syn match flowgComment "//.*$"

syn match flowgString "[^\"<>]" contained


let b:current_syntax = "flowg"

"hi def link celTodo        Todo
hi def link flowgComment    Comment
hi def link flowgIdentifier Identifier
hi def link flowgFunction   Function
hi def link flowgKeyword    Statement
hi def link flowgOperator   Operator
hi def link flowgType       Type
hi def link flowgString     Constant
"hi def link celDesc        PreProc
hi def link flowgNumber     Float
hi def link flowgBoolean    Boolean
