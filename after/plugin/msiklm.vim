" augroup MSIKLM
" 	autocmd!
" 	autocmd InsertEnter * silent exe '!msiklm ' . g:mode_colors['i'] . ',red'
" 	autocmd InsertLeave * silent exe '!msiklm ' . g:mode_colors['n'] . ',red'
" 	autocmd VimLeave * silent! !msiklm red
" augroup END

let g:mode_colors = {
			\ '__' : '------',
			\ 'n'  : 'red',
			\ 'i'  : 'green',
			\ 'R'  : 'purple',
			\ 'v'  : 'yellow',
			\ 'V'  : 'yellow',
			\ 'c'  : 'orange',
			\ '' : 'yellow',
			\ 's'  : 'sky',
			\ 'S'  : 'sky',
			\ '' : 'sky',
			\ 't'  : 'blue',
			\ }

function! KeyboardColorRefresh(mode)
	silent exe "!msiklm " . g:mode_colors[a:mode] . ",red"
	return ''
endfunction

"let g:airline_section_y = '%{KeyboardColorRefresh(mode())}'
