" Deoplete-Clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib64/clang/3.9.0/include'

" Vim-clang
let g:clang_use_library=1
let g:clang_c_options = '-std=gnu11'
let g:clang_c_completeopt = 'menuone,preview,noinsert'
let g:clang_auto = 0

if !exists('g:deoplete#omni#functions')
	let g:deoplete#omni#functions = {}
endif
let g:deoplete#omni#functions.c = [
			\ 'ClangComplete',
			\ 'ccomplete#Complete',
			\ ]

if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.c = [
			\ '[^. *\t]\.\w*',
			\ '[^. *\t]->\w*',
			\ ]

let g:neomake_c_clang_maker = {
			\ "args": [
				\ "-std=gnu11",
				\ "-fsyntax-only",
				\ "-Wall",
				\ "-Wextra",
				\ "-Wpedantic",
				\ ]
			\ }

let g:neomake_c_gcc_maker = {
			\ "args": [
				\ "-std=gnu11",
				\ "-fsyntax-only",
				\ "-Wall",
				\ "-Wextra",
				\ "-Wpedantic",
				\ ]
			\ }

let g:neomake_c_clangtidy_args = ["--checks=*", "%:p", "--", "-std=gnu11", "-Wall", "-Wextra"]
