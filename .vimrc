" Location: ~/.vimrc

set nocompatible

" Plug
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-syntastic/syntastic'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'altercation/vim-colors-solarized'
"Plug 'flazz/vim-colorschemes'
Plug 'vim-latex/vim-latex'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'alvan/vim-closetag'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim'
"Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'
Plug 'hrother/offlineimaprc.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' } " Correct python indentation
Plug 'nvie/vim-flake8', { 'for': 'python' } " PEP8 checking
Plug 'Yggdroot/indentLine' " Indent guides
Plug 'davidhalter/jedi-vim', { 'for': 'python' } " Python autocompletion
Plug 'tpope/vim-unimpaired'


call plug#end()


" Basics
set encoding=utf8
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
set clipboard=unnamedplus
set pastetoggle=<F2>
set linebreak
set noshowmode
if !has('nvim')
	set noesckeys
endif
if has("win32")
	set guifont=PragmataProMono_Nerd_Font_Mono:h10:w5
else
	if has("unix")
		set guifont=PragmataProMono\ Nerd\ Font\ Mono\ 11
	endif
endif

set laststatus=2
set shell=/bin/bash
set display+=lastline
let g:BASH_Ctrl_j = 'off'

autocmd InsertEnter * set timeoutlen=250 ttimeoutlen=0
autocmd InsertLeave * set timeoutlen=1000 ttimeoutlen=0


" Advanced
set omnifunc=htmlcomplete#CompleteTags

" Auto refresh aliases
autocmd BufWritePost ~/dotfiles/aliases/folders,~/dotfiles/aliases/configs !bash ~/dotfiles/scripts/shortcuts.sh
autocmd BufWritePost ~/.Xresources,~/dotfiles/.Xresources !xrdb ~/.Xresources
autocmd BufWritePost ~/.bashrc,~/dotfiles/aliases/aliases !bash source ~/.bashrc

" Theming
let &t_Co=256
hi search cterm=NONE ctermfg=black ctermbg=yellow
hi spellbad cterm=none ctermfg=white ctermbg=160 "dark red
hi folded cterm=none ctermfg=7 ctermbg=17
hi LineNr cterm=none ctermfg=251
hi Visual ctermfg=none ctermbg=239 guibg=Grey


" Mappings
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap ; :
nmap <up> gk
nmap <down> gj
nmap <silent> ,/ :nohlsearch<CR>
nmap J gj
nmap K gk
nmap <C-g> :%s/\s\+$//<cr>
nmap <C-n> :set norelativenumber<CR>
nmap <C-m> :set relativenumber<CR>
nmap <F10> :NERDTreeToggle<CR>
nmap <silent> <leader>sp :set spell!<cr>
nmap <leader><C-l> :loadview<cr>
nmap ! :!

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

cmap w!! w !sudo tee % >/dev/null
cmap Q q

imap jk <esc>
imap JK <esc>
imap kj <esc>
imap <C-a> <esc>jA

" Ctrl-S saving
nmap <C-S> :update<CR>
vmap <C-S> <C-C>:update<CR>
imap <C-S> <C-O>:update<CR>


" Plugin Configurations

" Airline
"let g:airline#extensions#synastic#enables = 1
"set laststatus=2
"let g:airline_powerline_fonts = 1
"let g:airline_theme = 'powerlineish'
"if !exists('g:airline_symbols')
"	let g:airline_symbols = {}
"endif
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.whitespace = ''


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
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
			\ "mode": "passive",
			\ "active_filetypes": ['python', 'sh'],
			\ "passive_filetypes": [] }
let g:syntastic_python_checkers=['flake8', 'python']
let g:syntastic_sh_checkers=['shellcheck', 'bashate']
nmap <F8> :SyntasticCheck<cr>
nmap ]sd :lopen<cr>
nmap [sd :lclose<cr>
hi SyntasticErrorSign cterm=none ctermfg=white ctermbg=160 "dark red


" flake8
let g:flake8_show_quickfix=0


" latex-suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf='zathura'
let g:Tex_IgnoredWarnings='"Underfull\n".
    \"Overfull\n".
    \"specifier changed to\n".
    \"You have requested\n".
    \"Missing number, treated as zero.\n".
    \"There were undefined references\n"
    \"Citation %.%# undefined"
    \"Package gensymb Warning: Not defining\n".'
let g:Tex_IgnoreLevel=8
map <f3> <esc>:w<cr><leader>ll<CR>
imap <C-t> <Plug>Tex_InsertItemOnThisLine
imap i <Plug>Tex_InsertItemOnThisLine


" Goyo
nmap <F12> :Goyo<cr>
imap <F12> <C-o>:Goyo<cr>


" YouCompleteMe
let g:ycm_filetype_blacklist = {
			\ 'tex' : 1
			\}

" NERDTree
function! NERDTreeQuit()
	redir => buffersoutput
	silent buffers
	redir END
	"                     1BufNo  2Mods.     3File           4LineNo
	let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
	let windowfound = 0

	for bline in split(buffersoutput, "\n")
		let m = matchlist(bline, pattern)

		if (len(m) > 0)
			if (m[2] =~ '..a..')
				let windowfound = 1
			endif
		endif
	endfor

	if (!windowfound)
		quitall
	endif
endfunction
autocmd WinEnter * call NERDTreeQuit()


" Closetag
" filenames like *.xml, *.html, *.xhtml, ...
" Then after you press <kbd>&gt;</kbd> in these files, this plugin will try to close the current tag.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non closing tags self closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" integer value [0|1]
" This will make the list of non closing tags case sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'



" Make python /comfy/
au BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix

let python_highlight_all=1


"au BufNewFile,BufRead *.js, *.html, *.css
      "\ set tabstop=2 |
      "\ set softtabstop=2 |
      "\ set shiftwidth=2
