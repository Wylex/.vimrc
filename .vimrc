"Configuración del terminal:
"Modificar el delay de repetición de teclas
"Mapear la tecla Bloq Mayus por la ESC
"Font 'Ubuntu Mono derivative Powerline Regular' from: 'https://github.com/powerline/fonts.git'

"Pathogen plugin manager {{{1
execute pathogen#infect()

"Tabs options {{{1

set ignorecase
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
"Configuración tabs según ficheros
autocmd FileType cpp setlocal ts=4 sts=4 sw=4 noet
autocmd FileType make setlocal ts=4 sts=4 sw=4 noet
autocmd FileType haskell setlocal ts=4 sts=4 sw=4 noet

"Buffer options {{{1

set hidden "Permitir cambiar buffer

"Folding {{{1

set foldmethod=marker

"Random stuff {{{1

let mapleader=","
set wildignore=*.o,*.out "Ignorar ciertos ficheros a la hora de autocompletar
set paste

"Visual customization {{{1

syntax enable
colorscheme gruvbox
set background=dark
set hlsearch
set number
set listchars=tab:▸\ ,eol:¬
set linebreak "No cortar palabras al cambiar de linea

"Mappings {{{1

nnoremap <silent> <leader><space> :nohlsearch<CR>| "Limpiar los highlights
nnoremap <BS> <C-^>| "Edit alternate file
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>| "Remove espaces at the end of lines
nmap <leader>v :tabedit $MYVIMRC<CR>| "Open .vimrc
"Moving lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]
"Tabs
""map <C-S-tab> gt
map <C-tab> gT
nnoremap <C-t> :tabnew<CR>

"Commands {{{1

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif
autocmd FileType cpp setlocal keywordprg=cppman "Documentación C++ (K)

"Searching and movement {{{1

nnoremap H ^
nnoremap L $

"Situarse en centro despues de hacer una búsqueda
nnoremap n nzz
nnoremap N Nzz
nnoremap * *N| "Don't move on *

"Windows {{{1

"Resize windows
nnoremap <C-left> 5<C-w><
nnoremap <C-right> 5<C-w>>

"Select windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Plugins {{{1

"Indent Guides
"Tabular
"Gruvbox
"Gundo
nnoremap <F4> :GundoToggle<CR>
"NerdTree
map <C-n> :NERDTreeToggle<CR>
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
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
