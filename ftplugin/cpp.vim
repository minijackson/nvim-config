setlocal completefunc=syntaxcomplete#Complete
setlocal colorcolumn=100
setlocal foldmethod=marker

setlocal path+=/usr/lib64/gcc/x86_64-pc-linux-gnu/7.2.0/include/g++-v7/

" Vim-clang
let g:clang_use_library = 1
let g:clang_cpp_options = '-std=c++17'
let g:clang_cpp_completeopt = 'menuone,preview,noinsert'
let g:clang_auto = 0

" Rtags (+ deoplete)
setlocal omnifunc=RtagsCompleteFunc

if !exists('g:deoplete#omni#functions')
	let g:deoplete#omni#functions = {}
endif
let g:deoplete#omni#functions.cpp = [
			\ 'ClangComplete',
			\ 'ccomplete#Complete',
			\ 'RtagsCompleteFunc',
			\ ]

if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.cpp = [
			\ '[^. *\t0-9]\.\w*',
			\ '[^. *\t]->\w*',
			\ '[\w>]*::\w*',
			\ ]

" Neomake
let g:neomake_cpp_enabled_makers = ["clang"]

if neomake#utils#Exists('clang-tidy')
	call add(g:neomake_cpp_enabled_makers, 'clangtidy')
endif

" Use C++17
let g:neomake_cpp_clang_maker = {
			\ "args": [
				\ "-std=c++17",
				\ "-fsyntax-only",
				\ "-Wall",
				\ "-Wextra",
				\ "-Wpedantic",
				\ ]
			\ }

let g:neomake_cpp_gcc_maker = {
			\ "args": [
				\ "-std=c++17",
				\ "-fsyntax-only",
				\ "-Wall",
				\ "-Wextra",
				\ "-Wpedantic",
				\ ]
			\ }

let g:neomake_cpp_clangtidy_args = ["--checks=*,-llvm-namespace-comment,-google-readability-namespace-comments,-clang-diagnostic-pragma-once-outside-header", "%:p", "--", "-std=c++17", "-Wall", "-Wextra"]
