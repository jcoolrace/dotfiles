" Location: ~/.vimrc

set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-latex/vim-latex'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on


" Basics
syntax on
set mouse=a
let mapleader=","
set tabstop=2
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftwidth=2
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set title
set noerrorbells
set nobackup
set noswapfile
set wildmenu
set clipboard=unnamed
set pastetoggle=<F2>
set linebreak


" Theming
" set background=dark
" colorscheme 256-grayvim
" let g:solarized_termcolors=256
" let &t_Co=256


" Mappings
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap ; :
nmap <up> gk
nmap <down> gj
nmap <silent> ,/ :nohlsearch<CR>
nmap J gj
nmap K gk
nmap <C-d> :sh<cr>
nmap <C-g> :%s/\s\+$//<cr>
nmap <C-n> :set relativenumber<CR>
nmap <C-m> :set norelativenumber<CR>
nmap <F4> :NERDTreeToggle<CR>

cmap w!! w !sudo tee % >/dev/null
cmap Q q

imap jk <esc>
imap <C-a> <esc>jA

" Nifty alphabetize shortcut
vnoremap <F3> d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>

" Ctrl-S saving
nmap <C-S> :update<CR>
vmap <C-S> <C-C>:update<CR>
imap <C-S> <C-O>:update<CR>


" Plugin Configurations

" Airline
let g:airline#extensions#synastic#enables = 1
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.whitespace = ''


" Neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#dictionary#dictionaries = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
		\ "mode": "passive",
		\ "active_filetypes": [],
		\ "passive_filetypes": [] }

" latex-suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf='zathura'
map <f3> <esc>:w<cr><leader>ll