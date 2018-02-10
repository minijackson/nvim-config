"let g:OmniSharp_selector_ui = 'ctrlp'

nnoremap <silent> <buffer> <localleader>i :OmniSharpFixUsings<cr>
nnoremap <silent> <buffer> <localleader>c :OmniSharpFixIssue<cr>
nnoremap <silent> <buffer> <localleader>d :OmniSharpDocumentation<cr>
nnoremap <silent> <buffer>  :OmniSharpGotoDefinition<cr>

nnoremap <silent> <buffer> <localleader>f :OmniSharpCodeFormat<cr>

setlocal expandtab
