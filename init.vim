"==============PLUGINS=============================
call plug#begin()
Plug 'relastle/bluewery.vim'						"Tema
Plug 'terryma/vim-multiple-cursors'					"Multiplos cursores
Plug 'sheerun/vim-polyglot'							"Faz highlight de syntax
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "Busca de arquivos
Plug 'junegunn/fzf.vim'								"Complemento do fzf
Plug 'jiangmiao/auto-pairs'							"Auto completa chaves, parenteses e etc
Plug 'honza/vim-snippets'							"Snippets prontos para várias linguagens
Plug 'frazrepo/vim-rainbow'							"Definie pares de parentese por cor
Plug 'vim-airline/vim-airline'						"Personaliza a barra de status
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/0.x' } "EMBELEZADOR DE CODIGO JS
Plug 'aluriak/nerdcommenter'						"Complemento para comentarios de varias linhas
Plug 'preservim/nerdtree'							"Navegação em arvores de diretorios
Plug 'grvcoelho/vim-javascript-snippets'			"Snippets para JavaScript
Plug 'neoclide/coc.nvim', {'branch': 'release'}		"Inteligencia do VScode para Vim
Plug 'ryanoasis/vim-devicons'						"Icones para o NERDTREE
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'		"Adiciona cor aos icones do NERDTREE
Plug 'valloric/matchtagalways'						"Destaca pares de tags HTML
Plug 'alvan/vim-closetag'							"Autocompleta TAGS HTML
call plug#end()

"===============DEFINIÇÃO DO TEMA=================
syntax on

colorscheme bluewery
let g:lightline = { 'colorscheme': 'bluewery' }

"===============VARIÁVEIS DE AMBIENTE============
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set hidden
set number
set relativenumber
set inccommand=split
set ignorecase

"===============MAPEAMENTO DE TECLAS=============
let mapleader="\<space>"
nnoremap <leader>; A;<esc>
nnoremap <leader>w <c-w>w
nnoremap <leader>l <c-w>l
nnoremap <leader>f :NERDTreeFocus<CR>
nnoremap <leader>, :bn<cr>
nnoremap <leader>. :bp<cr>
nnoremap <C-p> :Files<cr>
nnoremap <C-f> :Ag<space>
nnoremap <C-s> :%s/
nnoremap <C-a> ggVG
nnoremap <C-b> :Buffers<CR>
nnoremap <Tab> <S->><S->>
nnoremap <S-Tab> <S-<><S-<>

vnoremap <Tab> <S->><S->> gv 
vnoremap <S-Tab> <S-<><S-<> gv 

inoremap <A-v> <esc>v

map <F3> :vsplit ~/.config/nvim/init.vim<cr>
map <F4> :source ~/.config/nvim/init.vim<cr>
map <F5> :NERDTreeRefreshRoot<cr>
map <C-A-k> :m -2<CR>
map <C-A-j> :m +1<CR> 

"--------------COC VIM-----------------
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"----------Mapeamento das teclas de navegação-----------
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

"------------Disable Navigation Keys--------------
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"-------------Drop menu navigation-----------------
inoremap <A-j> <Down>
inoremap <A-k> <Up>

"===============VARIÁVEIS E CONFIGURAÇÕES DOS PLUGINS===========
"---------UltiSnips---------
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'
let g:UltiSnipsExpandTrigger= '<tab>'

"---------Rainbow--------
let g:rainbow_active = 1

"---------CONFIGURAÇÕES DO NERDTREE---------------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <F2> :NERDTreeToggle<CR>

"---------DEV ICONS--------------------
let g:airline_powerline_fonts = 1
autocmd FileType nerdtree setlocal nolist

"---------NERD COMMENTER----------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

"---------COC-VIM-----------------------
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-html', 
	\ 'coc-snippets', 
	\ 'coc-tsserver'
	\ ]

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

"-----------------------------------------------
"===============FOOTER==========================
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

