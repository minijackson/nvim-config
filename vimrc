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

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Personnal configuration {{{

execute pathogen#infect()

" 256 colors and molokai theme
set t_Co=256
" Buggy
" set t_AB=^[[48;5;%dm
" set t_AF=^[[38;5;%dm
colorscheme molokai
set cursorline

set backup
set backupdir=/tmp
set undofile

set cm=blowfish

set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase

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

set nocp

" Update tags when writing C/C++ file
function! UpdateTags()
	let cmd = 'ctags -R --c++-kinds=+p --fields=+iaS --extra=+q'
	let resp = system(cmd)
endfunction

" Enabling cscopes
set cscopetag cscopeverbose

autocmd BufWritePost *.cpp,*.h,*.c call UpdateTags()

setlocal omnifunc=syntaxcomplete#Complete

" Active le support de la souris
set mouse=a

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Syntastic config {{{

" Use C++11
let g:syntastic_cpp_compiler_options = '-std=c++0x'
" }}}

" Gist config {{{
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1
" }}}
"}}}

let g:clang_use_library=1
let g:clang_debug=1
let g:clang_library_path="/usr/lib/llvm-3.4/lib"
