if !exists('g:ref_cppman_cmd')
  let g:ref_cppman_cmd = executable('cppman') ? 'cppman' : ''
endif
let s:cmd = g:ref_cppman_cmd

let s:source = {'name': 'cppman'}

function! s:source.get_body(query)
	let res = s:cppman(a:query)
	if res.stderr != ''
		throw res.stderr
	endif

	return res.stdout
endfunction

function! s:source.available()
  return !empty(g:ref_cppman_cmd)
endfunction

function! s:source.opened(query)
	setlocal iskeyword+=:,=,~,[,],*,!,<,>

	syntax on
	syntax case ignore
	syntax match  manReference       "[a-z_:+-\*][a-z_:+-~!\*<>]\+([1-9][a-z]\=)"
	syntax match  manTitle           "^\w.\+([0-9]\+[a-z]\=).*"
	syntax match  manSectionHeading  "^[a-z][a-z_ \-:]*[a-z]$"
	syntax match  manSubHeading      "^\s\{3\}[a-z][a-z ]*[a-z]$"
	syntax match  manOptionDesc      "^\s*[+-][a-z0-9]\S*"
	syntax match  manLongOptionDesc  "^\s*--[a-z0-9-]\S*"

	syntax include @cppCode runtime! syntax/cpp.vim
	syntax match manCFuncDefinition  display "\<\h\w*\>\s*("me=e-1 contained

	syntax region manSynopsis start="^SYNOPSIS"hs=s+8 end="^\u\+\s*$"me=e-12 keepend contains=manSectionHeading,@cppCode,manCFuncDefinition
	syntax region manSynopsis start="^EXAMPLE"hs=s+7 end="^       [^ ]"he=s-1 keepend contains=manSectionHeading,@cppCode,manCFuncDefinition

	command -nargs=+ HiLink hi def link <args>

	HiLink manTitle	    Title
	HiLink manSectionHeading  Statement
	HiLink manOptionDesc	    Constant
	HiLink manLongOptionDesc  Constant
	HiLink manReference	    PreProc
	HiLink manSubHeading      Function
	HiLink manCFuncDefinition Function

	delcommand HiLink
endfunction

function! s:cppman(args)
	return ref#system(ref#to_list(g:ref_cppman_cmd, '--force-columns=100') + ref#to_list(a:args))
endfunction

function! ref#cppman#define()
	return copy(s:source)
endfunction

call ref#register_detection('cpp', 'cppman')
