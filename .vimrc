"Configuración del terminal:
"Modificar el delay de repetición de teclas
"Mapear la tecla Bloq Mayus por la ESC
"Font 'Ubuntu Mono derivative Powerline Regular' from: 'https://github.com/powerline/fonts.git', inconsolata

"Pathogen plugin manager {{{1
	execute pathogen#infect()

"Indentation {{{1

set noexpandtab
set softtabstop=4
set tabstop=4 "Size of a tab
set shiftwidth=4 "Size of a shift (>>)

"File configurations
if has("autocmd")
	autocmd FileType html setlocal ts=3 sts=3 sw=3 noet
	autocmd FileType cpp setlocal ts=4 sts=4 sw=4 noet
	autocmd FileType make setlocal ts=4 sts=4 sw=4 noet
	autocmd FileType haskell setlocal ts=4 sts=4 sw=4 et
	autocmd FileType markdown setlocal ts=3 sts=3 sw=3 et
endif

"Wrapping
set breakindent
set breakindentopt=shift:2,min:40
set showbreak=>>>

"Buffer options {{{1

set hidden "Allow changing buffers with changes

"Tabs {{{1

nnoremap <C-t> :tabnew<CR>

"Folding {{{1

set foldmethod=marker
nnoremap <space> za
nnoremap <leader>z zMzvzz

"Random stuff {{{1

let mapleader=","
set wildignore=*.o,*.out,*.aux,*.log,*.dvi,*.log,*.aux,*.pdf,*.class "Ignorar ciertos ficheros a la hora de autocompletar
"set paste

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"Visual customization {{{1

syntax enable
let g:gruvbox_contrast_light='hard'
colorscheme gruvbox
set background=dark
set hlsearch
set number
""set listchars=tab:▸\ ,eol:¬
set listchars=tab:\|\ ,eol:¬
if has("autocmd")
	autocmd FileType html setlocal list
endif
set linebreak "No cortar palabras al cambiar de linea

"Mappings {{{1

nnoremap <silent> <leader><space> <C-L>:nohlsearch<CR>| "Limpiar los highlights
nnoremap <BS> <C-^>| "Edit alternate file
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>| "Remove espaces at the end of lines
nmap <leader>v :tabedit $MYVIMRC<CR>| "Open .vimrc
""nmap <leader>ig :set list lcs=tab:\\|\ <CR>|

"Commands {{{1

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif
autocmd FileType cpp setlocal keywordprg=cppman "Documentación C++ (K)

"Searching and movement {{{1

set noignorecase

"nnoremap H ^
noremap H ^
"nnoremap L $
noremap L $

"Situarse en centro despues de hacer una búsqueda
nnoremap n nzz
nnoremap N Nzz
nnoremap * *N| "Don't move on *

"Windows {{{1

"Save session
nnoremap <leader>s :mksession!<CR>
"Resize windows
nnoremap <C-left> 5<C-w><
nnoremap <C-right> 5<C-w>>
nnoremap <C-w>+ 5<C-w>+
nnoremap <C-w>- 5<C-w>-

"Select windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Moving lines
nnoremap <C-Up> ddkP
nnoremap <C-Down> ddp
vnoremap <C-Up> xkP`[V`]
vnoremap <C-Down> xp`[V`]

"augroup cursorline
	"autocmd!
	"autocmd WinEnter * exe winnr('$')>1 ? "set cursorline" : "set nocursorline"
"augroup END

nnoremap <leader>h :vs %:t:r.h<CR>10<C-w><

"Custom commands {{{1

command! GoogleChromeA execute "!google-chrome > /dev/null 2>&1 &"
command! Latex execute ":w | !pdflatex " . shellescape(expand('%'))
command! Writemode set background=light | Goyo 90 | nnoremap j gj | nnoremap k gk
command! Codemode set background=dark | Goyo! | nnoremap j j | nnoremap k k

"Command line {{{1

set history=200 "save last 200 commands executed
cnoremap <C-p> <Up> "Allows filtering history
cnoremap <C-n> <Down>

"Plugins {{{1

"Surround
"Indent Guides
"Tabular
"Gruvbox
"Gundo
nnoremap <F4> :GundoToggle<CR>
"NerdTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.class$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "Cerrar vim si solo queda el arbol
"Vim-Airline
set laststatus=2
let g:airline_section_a = airline#section#create(['mode', '', ''])
let g:airline_section_z = airline#section#create(['%p%%', ' c%c', ' BN: %{bufnr("%")}'])
let g:airline_section_y = airline#section#create(['%a'])
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
