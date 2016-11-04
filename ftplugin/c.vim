let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib64/clang/3.9.0/include'

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
