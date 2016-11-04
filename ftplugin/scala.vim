let g:scala_use_builtin_tagbar_defs = 1
let g:scala_use_default_keymappings = 1
let g:scala_scaladoc_indent = 1

if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif
" omnicompletion for 'foo.*'
" omnicompletion for ':*' ',*' '(*' and '[*'
" omnicompletion for imports
let g:deoplete#omni#input_patterns.scala = [
			\ '[^. *\t]\.\w*',
			\ '[:\[,] ?\w*',
			\ '^import .*'
			\] 

nnoremap <buffer> <silent>  :EnDeclaration<CR>
nnoremap <buffer> <silent>  :EnDeclarationSplit<CR>
