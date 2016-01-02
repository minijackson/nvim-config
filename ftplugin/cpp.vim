set completefunc=syntaxcomplete#Complete
set colorcolumn=100

let g:clang_use_library=1
let g:clang_cpp_options = '-std=c++14'

let g:neomake_cpp_enabled_makers = ["clang", "clangtidy"]

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

let g:neomake_cpp_clangtidy_args = ["--header-filter=.*", "--checks=*", "%:p", "--", "-std=c++14", "-Wall", "-Wextra"]
