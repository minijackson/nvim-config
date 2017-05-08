let g:LatexBox_Folding=1
let g:LatexBox_latexmk_async = 1

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:tex_verbspell=1
let g:tex_conceal = ''

setlocal conceallevel=0

if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = 
			\   '\\(?:'
			\  .   '[^ {[]*'
			\  .  '|\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
			\  .  '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
			\  .  '|\w*begin\s*\{[^}]*'
			\  .  '|\w*end\s*\{[^}]*'
			\  .')'
