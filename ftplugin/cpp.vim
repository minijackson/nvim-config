setlocal completefunc=syntaxcomplete#Complete
setlocal colorcolumn=100
setlocal foldmethod=marker

let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib64/clang/3.9.0/include'

let g:neomake_cpp_enabled_makers = ["clang"]

if neomake#utils#Exists('clang-tidy')
	call add(g:neomake_cpp_enabled_makers, 'clangtidy')
endif

" Use C++14
let g:neomake_cpp_clang_maker = {
			\ "args": [
				\ "-std=c++14",
				\ "-fsyntax-only",
				\ "-Wall",
				\ "-Wextra",
				\ "-Wpedantic",
				\ ]
			\ }

let g:neomake_cpp_gcc_maker = {
			\ "args": [
				\ "-std=c++14",
				\ "-fsyntax-only",
				\ "-Wall",
				\ "-Wextra",
				\ "-Wpedantic",
				\ ]
			\ }

let g:neomake_cpp_clangtidy_args = ["--checks=*", "%:p", "--", "-std=c++14", "-Wall", "-Wextra"]
