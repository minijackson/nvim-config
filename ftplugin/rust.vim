let g:racer_cmd = '/usr/bin/racer'


call system('git rev-parse --git-dir')
if !v:shell_error
	"let g:neomake_rust_enabled_makers = ['cargo']
	"let g:neomake_enabled_makers = ['cargo', 'clippy']
	let g:neomake_enabled_makers = ['cargo']
	let g:neomake_rust_enabled_makers = []
	autocmd! BufWritePost *.rs Neomake! cargo
"else
	"let g:neomake_rust_enabled_makers = ['rustc']
endif

let g:langserver_executables = {
      \ 'rust': {
        \ 'name': 'rls',
        \ 'cmd': ['/home/minijackson/Applications/rls/target/release/rls'],
        \ },
      \ }
