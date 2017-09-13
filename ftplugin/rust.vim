setlocal colorcolumn=100

let g:racer_cmd = expand('~/.cargo/bin/racer')

if !exists('g:deoplete#omni#input_patterns')
	let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.cpp = [
			\ '[^. *\t]\.\w*',
			\ '[\w>]*::\w*',
			\ ]

call system('git rev-parse --git-dir')
if !v:shell_error
	"let g:neomake_rust_enabled_makers = ['cargo']
	"let g:neomake_enabled_makers = ['cargo', 'clippy']

	let g:neomake_enabled_makers = ['cargo']
	let g:neomake_rust_enabled_makers = []
	"autocmd! BufWritePost *.rs Neomake! cargo
"else
	"let g:neomake_rust_enabled_makers = ['rustc']
endif

let g:LanguageClient_serverCommands = {
			\ 'rust': [expand('~/.cargo/bin/rls')],
			\ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

LanguageClientStart
