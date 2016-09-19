" thx to: http://dougblack.io/words/a-good-vimrc.html

set nocompatible

set encoding=utf-8
if has('windows')
    let s:editor_root = expand("~/vim")
else
    let s:editor_root = expand("~/.vim")
endif

syntax enable

colorscheme peachpuff
set background=dark

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
set colorcolumn=80
set cursorline
set showcmd
filetype indent on
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
nnoremap <leader><space> :nohlsearch<CR>
set smartcase " Only case-sensitive if search contains caps

" folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za 
" space toggles folds
set foldmethod=indent

"MAPPINGS
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
nnoremap <leader>ez :e ~/.zshrc<CR>
nnoremap <leader>ee :e ~/.zshenv<CR>
nnoremap <leader>ep :e ~/.zprezto/modules/prompt/functions/prompt_ijks_setup<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" change cwd to parent of file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" buffer switching
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" close buffer without closing window
command! C bp | sp | bn | bd
