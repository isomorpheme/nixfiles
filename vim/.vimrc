" thx to: http://dougblack.io/words/a-good-vimrc.html

set nocompatible
filetype off

set encoding=utf-8
let s:editor_root = expand("~/.vim")

let &rtp .= ',' . s:editor_root . '/bundle/Vundle.vim'
call vundle#begin(s:editor_root . '/bundle')

" BEGIN PLUGINS

Plugin 'gmarik/Vundle.vim'

" language-specific
Plugin 'sheerun/vim-polyglot'

" interface
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'

" editing tools
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'raimondi/delimitmate'

" code assistance
Plugin 'valloric/youcompleteme'
Plugin 'scrooloose/syntastic'
Plugin 'myint/syntastic-extras'

" git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Colourschemes
Plugin 'chriskempson/base16-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/badwolf'

" END PLUGINS

call vundle#end()
filetype plugin indent on

" PLUGIN SETTINGS
" syntastic
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" airline
set laststatus=2 " prevents only showing when split
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

" Nerdtree
"autocmd vimenter * NERDTree
map <C-t> :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1

" delimitMate
let delimitMate_expand_cr = 1

" youcompleteme
let g:ycm_autoclose_preview_window_after_completion = 1

" END PLUGIN SETTINGS

set background=dark
colorscheme base16-flat
let base16colorspace=256

"autocmd ColorScheme * highlight Cursor gui=reverse guibg=NONE guifg=NONE
"autocmd ColorScheme * highlight CursorLine gui=reverse

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

syntax enable

" GENERAL SETTINGS

set history=10000
set hidden

" don't put temporary junk in my working directory! >:(
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo/

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

" rebind begin/end of line.
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>

nnoremap gV `[v`] " highlight last inserted text

" newline between multiline brackets
inoremap {<CR>  {<CR>}<Esc>O
inoremap (<CR>  (<CR>)<Esc>O
inoremap [<CR>  [<CR>]<Esc>O

" leader shortcuts
let mapleader="," " \ is too far away

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>ez :e ~/.zshrc<CR>
nnoremap <leader>ee :e ~/.zshenv<CR>
nnoremap <leader>ep :e ~/.zprezto/modules/prompt/functions/prompt_ijks_setup<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" change cwd to parent of file
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" save session
nnoremap <leader>s :mksession<CR>

" buffer switching
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" close buffer without closing window
command! C bp | sp | bn | bd

" terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <C-Esc> <Esc>

" window management
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" move
map <leader>H wincmd H<cr>
map <leader>K wincmd K<cr>
map <leader>L wincmd L<cr>
map <leader>J wincmd J<cr>

" resize
nmap <left> :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up> :wincmd +<cr>
nmap <down> :wincmd -<cr>

