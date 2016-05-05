" vim:fdm=marker:
"============================

" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

syntax on
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd    " Show (partial) command in status line.
set autowrite  " Automatically save before commands like :next and :make
set autoread

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Personnal configuration {{{

execute pathogen#infect()

let g:jellybeans_use_term_background_color = 1
colorscheme jellybeans
set cursorline

set backup
set backupdir=/tmp
set undofile

set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase

set backspace=indent,eol,start

" Line wrapping
set nowrap

" Status Line
set laststatus=2

" Status line
set statusline=%F%m%r%h%w\ [%{getcwd()}]\ [%p%%]%=[FORMAT=%{&ff}/%Y]\ [POS=%l,%v]\ (%{strftime(\"%d/%m/%y\ -\ %H:%M\")})

" 80 character right margin
set colorcolumn=80

" Airline conf
let g:airline_powerline_fonts = 1

" Menu when completing commands
set wildmenu

" Search highlighting
set hlsearch

filetype plugin on
filetype plugin indent on

let g:maplocalleader=","
let g:mapleader=";"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-k>"
let g:UltiSnipsJumpBackwardTrigger="<C-j>"

" Update tags when writing C/C++ file
function! UpdateTags()
	let cmd = 'ctags -R --c++-kinds=+p --fields=+iaS --extra=+q'
	let resp = system(cmd)
endfunction

" Clang-Format options
let g:clang_format#code_style = "mozilla"
let g:clang_format#style_options = {
			\ "BasedOnStyle"                         : "Mozilla",
			\ "ColumnLimit"                          : 100,
			\ "TabWidth"                             : 4,
			\ "IndentWidth"                          : 4,
			\ "UseTab"                               : "ForIndentation",
			\ "SpaceBeforeParens"                    : "Never",
			\ "BreakBeforeBraces"                    : "Attach",
			\ "Standard"                             : "Cpp11",
			\ "Cpp11BracedListStyle"                 : "true",
			\ "NamespaceIndentation"                 : "All",
			\ "ConstructorInitializerIndentWidth"    : 6,
			\ "AccessModifierOffset"                 : -4,
			\ "DerivePointerAlignment"               : "false",
			\ "PointerAlignment"                     : "Left",
			\ "AlwaysBreakTemplateDeclarations"      : "true",
			\ "AlwaysBreakAfterDefinitionReturnType" : "None",
			\ "BinPackArguments"                     : "false",
			\ "BinPackParameters"                    : "false",
			\ "PenaltyBreakBeforeFirstCallParameter" : 2,
			\ "AllowShortFunctionsOnASingleLine"     : "Empty",
			\ "AllowShortBlocksOnASingleLine"        : "false",
			\ "AlignConsecutiveAssignments"          : "true",
			\ "AlignTrailingComments"                : "true",
			\ "ContinuationIndentWidth"              : 8
			\ }

let g:clang_format#auto_formatexpr = 1

autocmd FileType c,cpp map <buffer><LocalLeader>f <Plug>(operator-clang-format)

" Enabling cscopes
set cscopetag cscopeverbose

set completefunc=syntaxcomplete#Complete

" Active le support de la souris
set mouse=a

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" Neomake config {{{

let g:neomake_error_sign = {
			\ 'text': '✘',
			\ 'texthl': 'ErrorMsg',
			\ }
let g:neomake_warning_sign = {
			\ 'text': '▲',
			\ 'texthl': 'WarningMsg',
			\ }

autocmd! BufWritePost * Neomake

" }}}

" Mappings {{{
" Toggle automatic paragraph formatting
nmap cof :set =(&formatoptions =~ "a") ? 'formatoptions-=a' : 'formatoptions+=a'
" }}}

" Dictionaries and thesaurus {{{
set thesaurus+=~/.config/nvim/thesaurus.txt
" }}}

set conceallevel=2
set concealcursor=nv

nmap ga <Plug>(EasyAlign)

call camelcasemotion#CreateMotionMappings(g:mapleader)

"}}}

let g:jedi#force_py_version = 3
