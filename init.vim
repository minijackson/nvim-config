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

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

filetype off
filetype plugin indent off

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd    " Show (partial) command in status line.
set noshowmode    " Do not show -- INSERTION -- in the cmdline (airline does it)
set autowrite  " Automatically save before commands like :next and :make
set autoread

" Don't delete buffer when abandoned
set hidden

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
	source /etc/vim/vimrc.local
endif

" Dein configuration {{{

" Required:
set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state(expand('~/.config/nvim'))
	call dein#begin(expand('~/.config/nvim'))

	" Let dein manage dein
	" Required:
	call dein#add(expand('~/.config/nvim/repos/github.com/Shougo/dein.vim'))

	" System config / plugins
	set runtimepath+=/usr/share/vim/vimfiles

	" Coloschemes
	call dein#add('tomasr/molokai')
	call dein#add('micha/wombat256')
	call dein#add('rakr/vim-one')
	call dein#add('mhartington/oceanic-next')
	call dein#add('morhetz/gruvbox')
	call dein#add('w0ng/vim-hybrid')

	" UI
	call dein#add('bling/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	call dein#add('airblade/vim-gitgutter')
	call dein#add('gorodinskiy/vim-coloresque')
	call dein#add('kien/rainbow_parentheses.vim')
	call dein#add('powerman/vim-plugin-AnsiEsc')
	call dein#add('majutsushi/tagbar')
	call dein#add('mbbill/undotree')
	"call dein#add('Shougo/echodoc.vim')

	" Motions
	call dein#add('tpope/vim-surround')
	call dein#add('tommcdo/vim-exchange')
	call dein#add('bkad/CamelCaseMotion')
	call dein#add('wellle/targets.vim')
	call dein#add('tpope/vim-repeat')
	call dein#add('junegunn/vim-easy-align')
	call dein#add('justinmk/vim-dirvish')
	call dein#add('mhinz/vim-startify')
	call dein#add('andymass/vim-matchup')

	" Languages
	call dein#add('sheerun/vim-polyglot')
	"call dein#add('ludovicchabant/vim-gutentags')
	"call dein#add('igankevich/mesonic')

		" CSV
		call dein#add('chrisbra/csv.vim', {'on_ft': 'csv'})

		" JavaScript
		call dein#add('myhere/vim-nodejs-complete', {'on_ft': 'javascript'})
		call dein#add('moll/vim-node', {'on_ft': 'javascript'})
		call dein#add('carlitux/deoplete-ternjs', {'on_ft': 'javascript'})

		" Java
		call dein#add('artur-shaik/vim-javacomplete2', {'on_ft': 'java'})
		call dein#add('ervandew/eclim',
					\ { 'on_ft': 'java',
					\   'rev': '2.6.0',
					\   'build':
					\     'ant -Declipse.home=' . $ECLIPSE_PATH .
					\     ' -Dvim.files=' . escape(expand('~/.config/nvim/repos/github.com/ervandew/eclim'), '')
					\ } )

		" R
		call dein#add('jalvesaq/Nvim-R')

		" Go
		call dein#add('fatih/vim-go', {'on_ft': 'go'})
		call dein#add('zchee/deoplete-go', {'on_ft': 'go'})

		" Rust
		call dein#add('racer-rust/vim-racer', {'on_ft': 'rust'})

		" Lisp
		call dein#add('kovisoft/slimv', {'on_ft': 'lisp'})

		" Haskell
		call dein#add('eagletmt/neco-ghc', {'on_ft': 'haskell'})
		call dein#add('Twinside/vim-hoogle', {'on_ft': 'haskell'})
		call dein#add('mpickering/hlint-refactor-vim', {'on_ft': 'haskell'})

		" C#
		call dein#add('OmniSharp/omnisharp-vim',
					\ { 'on_ft': 'cs',
					\   'build': 'sh -c "cd server && xbuild"'
					\ } )
		call dein#add('dimixar/deoplete-omnisharp', {'on_ft': 'cs'})

		" HTML
		call dein#add('mattn/emmet-vim', {'on_ft': ['html', 'svg', 'eelixir']})

		" Python
		call dein#add('zchee/deoplete-jedi', {'on_ft': 'python'})

		" Elixir
		call dein#add('slashmili/alchemist.vim', {'on_ft': 'elixir'})
		call dein#add('c-brenn/phoenix.vim', {'on_ft': 'elixir'})
		call dein#add('carlosgaldino/elixir-snippets', {'on_ft': 'elixir'})

		" Elm
		call dein#add('pbogut/deoplete-elm', {'on_ft': 'elm'})

		" PHP
		call dein#add('pbogut/deoplete-padawan', {'on_ft': 'php', 'build': 'composer install'})

		" C / C++
		call dein#add('Shougo/neoinclude.vim')
		call dein#add('justmao945/vim-clang', {'on_ft': ['c', 'cpp']})
		"call dein#add('tweekmonster/deoplete-clang2', {'on_ft': ['c', 'cpp']})
		call dein#add('lyuts/vim-rtags', {'on_ft': ['c', 'cpp']})
		" WIP
		call dein#add('rzaluska/deoplete-rtags', {'on_ft': ['c', 'cpp']})

		" Scala
		"call dein#add('ensime/ensime-vim', {'on_ft': 'scala'})

		" Prolog
		call dein#add('adimit/prolog.vim', {'on_ft': 'prolog'})

		" EditorConfig
		call dein#add('editorconfig/editorconfig-vim')

		" RFC
		call dein#add('mhinz/vim-rfc')
		call dein#add('vim-scripts/rfc-syntax')

		"Zsh
		call dein#add('zchee/deoplete-zsh', {'on_ft': 'zsh'})

		"Binary
		"call dein#add('fidian/hexmode')
		call dein#add('Shougo/vinarise.vim')

		" ViML
		call dein#add('Shougo/neco-vim', {'on_ft': 'vim'})

	" Frameworks
	call dein#add('tpope/vim-projectionist')
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('Shougo/denite.nvim')
	call dein#add('ctrlpvim/ctrlp.vim')
	call dein#add('tacahiroy/ctrlp-funky')
	call dein#add('sgur/ctrlp-extensions.vim')
	call dein#add('Shougo/dein.vim')
	call dein#add('benekastah/neomake')
	call dein#add('kana/vim-operator-user')
	call dein#add('SirVer/ultisnips', {'lazy': 1})
	call dein#add('autozimu/LanguageClient-neovim', {'rev': 'next', 'build': './install.sh'})
	call dein#add('Shougo/neco-syntax')
	call dein#add('tpope/vim-dispatch')

	" Utility
	call dein#add('tpope/vim-fugitive')
	call dein#add('tpope/vim-unimpaired')
	call dein#add('rhysd/vim-grammarous')
	call dein#add('beloglazov/vim-online-thesaurus')
	call dein#add('vim-scripts/SyntaxRange')
	call dein#add('scrooloose/nerdcommenter')
	call dein#add('tmux-plugins/vim-tmux-focus-events')
	call dein#add('wellle/tmux-complete.vim')
	call dein#add('tpope/vim-rhubarb', {'on_ft': 'gitcommit'})
	call dein#add('mattn/gist-vim')
	call dein#add('mattn/webapi-vim')
	call dein#add('thinca/vim-ref')
	call dein#add('sbdchd/neoformat')
	call dein#add('mhinz/vim-grepper')
	call dein#add('nelstrom/vim-visual-star-search')
	"call dein#add('xtal8/traces.vim')

	call dein#remote_plugins()

	" Required:
	call dein#end()
	call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif

" }}}

" Personnal configuration {{{

	" Color scheme {{{

	set background=dark

	" Gruvbox
	let g:gruvbox_contrast_dark = 'soft'

	"colorscheme gruvbox

	colorscheme hybrid
	let g:airline_theme = 'lucius'

	highlight Comment term=italic cterm=italic gui=italic

	set listchars=tab:│\ ,trail:-,nbsp:+
	set list

	set fillchars=fold:─,vert:│

	highlight ExtraWhitespace term=inverse cterm=inverse gui=inverse

	" Show trailing whitespace and spaces before tabs:
	autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

	highlight InactiveWin guibg=#282a2e
	set winhighlight=NormalNC:InactiveWin

	" }}}

set cursorline

set backup
set backupdir-=.
set undofile

set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase

set backspace=indent,eol,start

set completeopt=menuone,preview,noinsert,noselect

" Line wrapping
set nowrap

" Status Line
set laststatus=2

set title

set colorcolumn=80

" Airline conf
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 2

" Menu when completing commands
set wildmenu

" Search highlighting
set hlsearch
" Show effect of command incrementally
" (Only for substitution for now)
set inccommand=split

" True colors
set termguicolors

set guicursor=n-v:block,i-c-ci-ve:ver25,r-cr:hor20,o:hor50
			\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
			\,sm:block-blinkwait175-blinkoff150-blinkon175

" Reset the cursor before leaving
autocmd VimLeave * let &t_SI = "\<Esc>[1 q"

let g:maplocalleader=","
let g:mapleader=";"

" let g:clang_format#style_options = {
"			\ "BasedOnStyle"                         : "Mozilla",
"			\ "ColumnLimit"                          : 100,
"			\ "TabWidth"                             : 4,
"			\ "IndentWidth"                          : 4,
"			\ "UseTab"                               : "ForIndentation",
"			\ "SpaceBeforeParens"                    : "Never",
"			\ "BreakBeforeBraces"                    : "Attach",
"			\ "Standard"                             : "Cpp11",
"			\ "Cpp11BracedListStyle"                 : "true",
"			\ "NamespaceIndentation"                 : "All",
"			\ "ConstructorInitializerIndentWidth"    : 6,
"			\ "AccessModifierOffset"                 : -4,
"			\ "DerivePointerAlignment"               : "false",
"			\ "PointerAlignment"                     : "Left",
"			\ "AlwaysBreakTemplateDeclarations"      : "true",
"			\ "AlwaysBreakAfterDefinitionReturnType" : "None",
"			\ "BinPackArguments"                     : "false",
"			\ "BinPackParameters"                    : "false",
"			\ "PenaltyBreakBeforeFirstCallParameter" : 2,
"			\ "AllowShortFunctionsOnASingleLine"     : "Empty",
"			\ "AllowShortBlocksOnASingleLine"        : "false",
"			\ "AlignConsecutiveAssignments"          : "true",
"			\ "AlignTrailingComments"                : "true",
"			\ "ContinuationIndentWidth"              : 8
"			\ }

" Neoformat
map <silent> <buffer> <LocalLeader>f :Neoformat<cr>

" Enabling cscopes
"set cscopetag cscopeverbose

set completefunc=syntaxcomplete#Complete

" Active le support de la souris
set mouse=a

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" LanguageClient config {{{
let g:LanguageClient_autoStart = 1
augroup LanguageClient_config
	autocmd!
	autocmd User LanguageClientStarted nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
    autocmd User LanguageClientStarted nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
    autocmd User LanguageClientStarted nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
    autocmd User LanguageClientStarted setlocal formatexpr=LanguageClient_textDocument_rangeFormatting()
augroup END

" \ 'rust': ['rustup', 'run', 'nightly-2017-12-01', 'rls'],
let g:LanguageClient_serverCommands = {
			\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
			\ }

" }}}

" Nvim-R config {{{
let R_pdfviewer = 'evince'
let R_latexcmd = ['latexmk', '-pdf', '-xelatex', '-synctex=1', '-8bit', '-shell-escape']
"%     latexmk -pdf -pvc -shell-escape -xelatex -8bit document
" }}}

" Neomake config {{{

let g:neomake_error_sign = {
			\ 'text': '✘',
			\ 'texthl': 'ErrorMsg',
			\ }
let g:neomake_warning_sign = {
			\ 'text': '▲',
			\ 'texthl': 'WarningMsg',
			\ }

call neomake#configure#automake('w', 750)
"call neomake#configure#automake('nw', 750)

" }}}

" Mappings {{{
" Toggle automatic paragraph formatting
nmap =of :set =(&formatoptions =~ "a") ? 'formatoptions-=a' : 'formatoptions+=a'

nmap ga <Plug>(EasyAlign)

" CtrlP
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_match_window_reversed = 0

let g:ctrlp_cmd = 'CtrlPMenu'
nn <c-p>p :CtrlP<cr>
nn <c-p><c-p> :CtrlP<cr>
nn <c-p>m :CtrlPMRUFiles<cr>
nn <c-p>c :CtrlPCmdline<cr>
nn <c-p>y :CtrlPYankring<cr>
nn <c-p>t :CtrlPTag<cr>
nn <c-p>f :CtrlPFunky<cr>
" }}}

set conceallevel=2
set concealcursor=nv

call camelcasemotion#CreateMotionMappings(g:mapleader)

" Enable emmet by filetype
let g:user_emmet_leader_key = '<c-s>'

" Grepper plugin config
let g:grepper = {
			\  'tools': ['rg', 'ag', 'git']
			\ }

"}}}

let g:startify_fortune_use_unicode = 1
let g:startify_bookmarks = [{'i': '~/.config/nvim/init.vim'}]
let g:jedi#force_py_version = 3
let g:echodoc#enable_at_startup = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_menu_width = 100
let g:tmuxcomplete#trigger = ''

filetype plugin indent on
