let g:clang_use_library=1
let g:clang_c_options = '-std=gnu11'

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
