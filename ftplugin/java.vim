setlocal omnifunc=javacomplete#Complete

"let g:neomake_java_enabled_makers = ['checkstyle']
let g:neomake_java_enabled_makers = []

" Eclim mappings
nnoremap <silent> <buffer> <localleader>i :JavaImport<cr>
nnoremap <silent> <buffer> <localleader>c :JavaCorrect<cr>
nnoremap <silent> <buffer> <localleader>d :JavaDocPreview<cr>
nnoremap <silent> <buffer>  :JavaSearchContext<cr>

nnoremap <silent> <buffer> <localleader>f :JavaFormat<cr>
vnoremap <silent> <buffer> <localleader>f :JavaFormat<cr>

nnoremap <silent> <buffer> <localleader>g :JavaGet<cr>
vnoremap <silent> <buffer> <localleader>g :JavaGet<cr>
nnoremap <silent> <buffer> <localleader>s :JavaSet<cr>
vnoremap <silent> <buffer> <localleader>s :JavaSet<cr>
