"==============PLUGINS============================= 
call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }				"Tema
Plug 'terryma/vim-multiple-cursors'					"Multiplos cursores
Plug 'sheerun/vim-polyglot'							"Faz highlight de syntax
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "Busca de arquivos
Plug 'junegunn/fzf.vim'								"Complemento do fzf
Plug 'jiangmiao/auto-pairs'							"Auto completa chaves, parenteses e etc
Plug 'honza/vim-snippets'							"Snippets prontos para várias linguagens
Plug 'luochen1990/rainbow'							"Definie pares de parentese por cor
Plug 'vim-airline/vim-airline'						"Personaliza a barra de status
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/0.x' } "EMBELEZADOR DE CODIGO JS
Plug 'aluriak/nerdcommenter'						"Complemento para comentarios de varias linhas
Plug 'grvcoelho/vim-javascript-snippets'			"Snippets para JavaScript
Plug 'neoclide/coc.nvim', {'branch': 'release'}		"Inteligencia do VScode para Vim
Plug 'ryanoasis/vim-devicons'						"Icones para o NERDTREE
Plug 'valloric/matchtagalways'						"Destaca pares de tags HTML
Plug 'alvan/vim-closetag'							"Autocompleta TAGS HTML
Plug 'peitalin/vim-jsx-typescript'					"Realsa a sintaxe em codigos jsx
Plug 'kevinhwang91/rnvimr'							"Adiciona suporte a Ranger
Plug 'Yggdroot/indentLine'							"Adiciona linhas de identação
Plug 'maxmellon/vim-jsx-pretty'						"Embelezador para codigo TSX
Plug 'christoomey/vim-system-copy'					"Ativa Ctrl-c/Ctrl-v 
call plug#end()

"===============DEFINIÇÃO DO TEMA=================
if !exists('g:syntax_on')
	syntax enable
endif

colorscheme dracula

"===============VARIÁVEIS DE AMBIENTE============
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set hidden
set number
set relativenumber
set inccommand=split
set ignorecase
set linebreak
set wrap tw=80
set incsearch
set title
set mouse=
set cul

"===============MAPEAMENTO DE TECLAS=============
let mapleader="\<space>"

nnoremap <leader>; A;<esc>
nnoremap <leader>, A,<esc>
nnoremap <leader>w <c-w>w
nnoremap <leader>l <c-w>l
nnoremap <leader>f :RnvimrToggle<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <A-.> :bn<cr>
nnoremap <A-,> :bp<cr>
nnoremap <C-p> :Files<cr>
nnoremap <C-f> :Ag<space>
nnoremap <C-s> :%s/
nnoremap <C-a> ggVG
nnoremap <C-b> :Buffers<CR>
nnoremap <Tab> <S->><S->>
nnoremap <S-Tab> <S-<><S-<>
nnoremap <F3> :edit ~/.config/nvim/init.vim<cr>
nnoremap <F5> :source ~/.config/nvim/init.vim<cr>

vnoremap <Tab> <S->><S->> gv 
vnoremap <S-Tab> <S-<><S-<> gv 

inoremap <A-v> <esc>v

"--------------COC VIM-----------------
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

"----------Mapeamento das teclas de navegação-----------
nnoremap <silent> <A-k> :wincmd k<CR>
nnoremap <silent> <A-j> :wincmd j<CR>
nnoremap <silent> <A-h> :wincmd h<CR>
nnoremap <silent> <A-l> :wincmd l<CR>

inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <C-l> <C-o>l

"------------Disable Navigation Keys--------------
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"-------------Drop menu navigation-----------------
inoremap <A-h> <Left>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-l> <Right>

"---------------Map Tmux Clipboard-----------------
vnoremap <leader>tc y<cr>:call system("tmux load-buffer -", @0)<cr>gv
nnoremap <leader>tp :let @0 = system("tmux save-buffer -")<cr>"0p<cr>

"---------------Clear select find------------------
nnoremap <leader>q :noh<cr>

"===============VARIÁVEIS E CONFIGURAÇÕES DOS PLUGINS===========
"---------Rainbow--------
let g:rainbow_active = 1

"---------DEV ICONS--------------------
let g:airline_powerline_fonts = 1

"---------NERD COMMENTER----------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" -----------Vim multiple cursors-------------------
let g:multi_cursor_start_word_key = '<C-n>'
let g:multi_cursor_select_all_key = '<C-A-n>'

"---------Rnvimr----------------------
let g:rnvimr_enable_picker = 1
let g:rnvimr_enable_bw = 1
let g:rnvimr_enable_ex = 1

"---------Vim Airline---------------------
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1

"---------COC-VIM-----------------------
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-html', 
	\ 'coc-snippets', 
	\ 'coc-tsserver',
	\ '@yaegassy/coc-tailwindcss3'
	\ ]

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

"-----------------------------------------------
