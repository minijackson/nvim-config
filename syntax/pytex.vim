" Add syntax highlighting for python chunks in TeX
" Language: TeX
"

let b:current_syntax = ''
unlet b:current_syntax
runtime! syntax/tex.vim

let b:current_syntax = ''
unlet b:current_syntax

syntax include @TeX syntax/tex.vim

let b:current_syntax = ''
unlet b:current_syntax

syntax include @Python syntax/python.vim

syntax region pythonString matchgroup=quotes start='"' end='"' skip='\\"' containedin=@Python contains=@TeX
syntax region pythonChunk matchgroup=pythonChunkDelim start="\\begin{python}" end="\\end{python}\|%stopzone\>" containedin=@TeX contains=@Python,pythonString

highlight link pythonChunkDelim SpecialComment
let b:current_syntax = "tex"
