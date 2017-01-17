" thx to: http://dougblack.io/words/a-good-vimrc.html

set nocompatible

set encoding=utf-8
set t_Co=256

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'sheerun/vim-polyglot'
Plug 'alvan/vim-closetag'

Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'reedes/vim-colors-pencil'
Plug 'baskerville/bubblegum'

call plug#end()

filetype plugin indent on
syntax enable

set background=dark
colorscheme bubblegum-256-dark

" PLUGIN SETTINGS
" airline
let g:airline_theme='bubblegum'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1

" GENERAL SETTINGS

set history=10000
set hidden

" make backspace usable
set backspace=2

" tabs 'n spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4 " shift width, i.e. when shifting indentation
set expandtab
" why are there so many settings for tabs -_-

" ui stuff
set number
" display the statusbar, even when there is only one window
set laststatus=2
set colorcolumn=80
set cursorline
set showcmd
set wildmenu
set lazyredraw
set showmatch
set list " show whitespace
set listchars=eol:¬,trail:·,tab:»\ 

" gvim settings
set guifont=Source_Code_Pro:h11:cANSI
" remove all those stupid ui elements
set guioptions-=m
set guioptions-=T
set guioptions-=r

" text wrap
set wrap
set linebreak

" searching
set incsearch
set hlsearch
nnoremap <CR> :nohlsearch<CR>
set smartcase " Only case-sensitive if search contains caps

" MAPPINGS
" movement
" visual movement, i.e. don't skip wrapped parts of lines
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" newline between multiline brackets
inoremap {<CR>  {<CR>}<Esc>O
inoremap (<CR>  (<CR>)<Esc>O
inoremap [<CR>  [<CR>]<Esc>O

" leader shortcuts
let mapleader="," " \ is too far away

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" change cwd to parent of file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" buffer switching
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" COMMANDS
command! BufferSaveClose w | bdelete
abbreviate bx BufferSaveClose
abbreviate bc bdelete
