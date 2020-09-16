call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'ryanoasis/vim-devicons'
Plug 'tomasiser/vim-code-dark'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'chriskempson/base16-vim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'sainnhe/edge'

" Initialize plugin system
call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if exists('$TMUX')

" Colors in tmux

let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"

let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"

endif

set termguicolors
set t_Co=256

" the configurations options should be placed before `colorscheme edge`
" let g:edge_style = 'aura'
let g:edge_disable_italic_comment = 1

" Set colorscheme
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

let g:quantum_italics=1

" let g:enable italicized comments
let g:garbage_terminal_italics=1

" Set dark background
set background=dark
if (has('termguicolors'))
				set termguicolors
endif
set encoding=UTF-8

if has('mouse')
	set mouse=a
endif

let g:airline_theme='gruvbox'
let g:airline_enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'

" Some general configurations 
set nu
set autoread
set autowrite
set autoindent
set si "smart indent
syntax on
set nobackup
set nowb
set noswapfile
set backupdir=~/tmp,/tmp
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=/tmp
set cursorline
set spell
set backspace=indent,eol,start "Making sure that backspace works
set ttimeoutlen=0
set guicursor+=n-v-c:blinkon0

" Status line custom
" set statusline=

" Number
set relativenumber
set number
set numberwidth=5

" Tabs
set tabstop=2
set softtabstop=2

nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>
nnoremap <silent> <C-k><C-T> :TagbarToggle<CR>

let NERDTreeStatusline="NERDTree"

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
let g:NERDTreeWinSize=40

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable line numbers in NERDTree
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" Map Ctrl + / as commenter toggle
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

autocmd FileType json syntax match Comment +\/\/.\+$+

" Vim split
set splitbelow
set splitright

" coc config
"
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-pairs',
\ 'coc-tsserver',
\ 'coc-eslint',
\ 'coc-prettier',
\ 'coc-json',
\]


" vim-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:prettier#autoformat=0
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql,*.jsx,*.tsx,*.ts Prettier


" Moving among buffers with Ctrl
map <C-L> :bnext<CR>
map <C-H> :bprev<CR>

