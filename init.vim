"==============PLUGINS============================= 
call plug#begin()
Plug 'ayu-theme/ayu-vim'								"Tema
Plug 'mg979/vim-visual-multi', {'branch': 'master'}		"Multiplos cursores
Plug 'sheerun/vim-polyglot'								"Faz highlight de syntax
Plug 'luochen1990/rainbow'								"Definie pares de parentese por cor
Plug 'vim-airline/vim-airline'							"Personaliza a barra de statu
Plug 'aluriak/nerdcommenter'							"Complemento para comentarios de varias linhas
Plug 'neoclide/coc.nvim', {'branch': 'release'}			"Inteligencia do VScode para Vim
Plug 'ryanoasis/vim-devicons'							"Icones para o NeoVim
Plug 'valloric/matchtagalways'							"Destaca pares de tags HTML
Plug 'alvan/vim-closetag'								"Autocompleta TAGS HTML
Plug 'kevinhwang91/rnvimr'								"Adiciona suporte a Ranger
Plug 'christoomey/vim-system-copy'						"Ativa Ctrl-c/Ctrl-v 
Plug 'honza/vim-snippets'								"Snippets prontos para várias linguagens 
Plug 'sirver/ultisnips'									"Plugin que permite criar meu snippets
call plug#end()

"===============DEFINIÇÃO DO TEMA=================
set termguicolors
let ayucolor="dark"
colorscheme ayu

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
set cursorline
set cursorcolumn
set list
set listchars=tab:\ \ ┊

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
nnoremap <C-s> :%s/
nnoremap <C-a> ggVG
nnoremap <Tab> <S->><S->>
nnoremap <S-Tab> <S-<><S-<>
nnoremap <F3> :edit ~/.config/nvim/init.vim<cr>
nnoremap <F5> :source ~/.config/nvim/init.vim<cr>

vnoremap <Tab> <S->><S->> gv 
vnoremap <S-Tab> <S-<><S-<> gv 

inoremap <A-v> <esc>v
inoremap <A-o> <esc>o
inoremap <A-S-o> <esc>o

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
inoremap <A-S-h> <Left>
inoremap <A-S-j> <Down>
inoremap <A-S-k> <Up>
inoremap <A-S-l> <Right>

"------------Disable Navigation Keys--------------
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>
" inoremap <Up> <Nop>
" inoremap <Down> <Nop>
" inoremap <Left> <Nop>
" inoremap <Right> <Nop>

"---------------Map Tmux Clipboard-----------------
" vnoremap <leader>tc y<cr>:call system("tmux load-buffer -", @0)<cr>gv
" nnoremap <leader>tp :let @0 = system("tmux save-buffer -")<cr>0p<cr>

"----------------Mouse---------------------
set mouse=a

"---------------Clear select find------------------
nnoremap <leader><space> :noh<cr>

"===============VARIÁVEIS E CONFIGURAÇÕES DOS PLUGINS===========
"---------Rainbow--------
let g:rainbow_active = 1

"---------DEV ICONS--------------------
let g:airline_powerline_fonts = 1

"---------NERD COMMENTER----------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified ti-line comments
let g:NERDCompactSexyComs = 1

"---------Rnvimr----------------------
let g:rnvimr_enable_picker = 1
let g:rnvimr_enable_bw = 1
let g:rnvimr_enable_ex = 1

let g:rnvimr_action = {
	\ '<C-x>': 'NvimEdit split',
	\ '<C-v>': 'NvimEdit vsplit',
	\ '<esc>': 'q'
	\ }

"---------Vim Airline---------------------
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"---------COC-VIM-----------------------
autocmd FileType php setl formatexpr=CocActionAsync('formatSelected')
autocmd BufWritePre *.php :normal! :call CocActionAsync('runCommand', 'editor.action.organizeImport')
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-html', 
	\ 'coc-snippets', 
	\ 'coc-tsserver',
	\ 'coc-pairs',
	\ 'coc-emmet',
	\ ]


inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"-----------------------------------------------
