let g:LatexBox_Folding=1
let g:LatexBox_latexmk_async = 1

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:tex_verbspell=1
let g:tex_conceal = ''
