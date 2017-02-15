let g:elixir_docpreview = 1
let g:tagbar_type_elixir = {
			\ 'ctagstype' : 'Elixir',
			\ 'kinds'     : [
				\ 'm:modules',
				\ 'd:delegates:1:0',
				\ 'p:protocols:0:0',
				\ 'e:exceptions:0:0',
				\ 't:tests',
				\ 'c:callbacks',
				\ 'i:implementations',
				\ 'a:macros',
				\ 'f:functions',
				\ 'o:operators',
				\ 'r:records'
			\ ],
			\ 'sro'        : '::',
			\ 'kind2scope' : {
				\ 'm' : 'module'
			\ },
			\ 'scope2kind' : {
				\ 'module' : 'm'
			\ }
		\ }

let g:alchemist#elixir_erlang_src = '/usr/local/src'

let g:neomake_elixir_enabled_makers = ['mix', 'credo']

" ~/.ctags config for elixir
" thx https://github.com/mmorearty/elixir-ctags
"
" --langdef=Elixir
" --langmap=Elixir:.ex.exs
" --regex-Elixir=/^[ \t]*def(p?)[ \t]+([a-z_][a-zA-Z0-9_?!]*)/\2/f,functions,functions (def ...)/
" --regex-Elixir=/^[ \t]*defcallback[ \t]+([a-z_][a-zA-Z0-9_?!]*)/\1/c,callbacks,callbacks (defcallback ...)/
" --regex-Elixir=/^[ \t]*defdelegate[ \t]+([a-z_][a-zA-Z0-9_?!]*)/\1/d,delegates,delegates (defdelegate ...)/
" --regex-Elixir=/^[ \t]*defexception[ \t]+([A-Z][a-zA-Z0-9_]*\.)*([A-Z][a-zA-Z0-9_?!]*)/\2/e,exceptions,exceptions (defexception ...)/
" --regex-Elixir=/^[ \t]*defimpl[ \t]+([A-Z][a-zA-Z0-9_]*\.)*([A-Z][a-zA-Z0-9_?!]*)/\2/i,implementations,implementations (defimpl ...)/
" --regex-Elixir=/^[ \t]*defmacro(p?)[ \t]+([a-z_][a-zA-Z0-9_?!]*)\(/\2/a,macros,macros (defmacro ...)/
" --regex-Elixir=/^[ \t]*defmacro(p?)[ \t]+([a-zA-Z0-9_?!]+)?[ \t]+([^ \tA-Za-z0-9_]+)[ \t]*[a-zA-Z0-9_!?!]/\3/o,operators,operators (e.g. "defmacro a <<< b")/
" --regex-Elixir=/^[ \t]*defmodule[ \t]+([A-Z][a-zA-Z0-9_]*\.)*([A-Z][a-zA-Z0-9_?!]*)/\2/m,modules,modules (defmodule ...)/
" --regex-Elixir=/^[ \t]*defprotocol[ \t]+([A-Z][a-zA-Z0-9_]*\.)*([A-Z][a-zA-Z0-9_?!]*)/\2/p,protocols,protocols (defprotocol...)/
" --regex-Elixir=/^[ \t]*Record\.defrecord[ \t]+:([a-zA-Z0-9_]+)/\1/r,records,records (defrecord...)/
" --regex-Elixir=/^[ \t]*test[ \t]+\"([a-z_][a-zA-Z0-9_?! ]*)\"*/\1/t,tests,tests (test ...)/
