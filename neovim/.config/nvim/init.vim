" thx to: http://dougblack.io/words/a-good-vimrc.html

let s:editor_root = expand("~/.config/nvim")

call plug#begin(s:editor_root . '/plugged')

" BEGIN PLUGINS

Plug 'VundleVim/Vundle.vim'

" language-specific
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'sjl/gundo.vim'

" editing tools
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'raimondi/delimitmate'
Plug 'dhruvasagar/vim-table-mode'

" code assistance
Plug 'valloric/youcompleteme', {'do': 'python2 ./install.py --racer-completer'}
Plug 'scrooloose/syntastic'
Plug 'myint/syntastic-extras'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Colourschemes
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'sjl/badwolf'

" END PLUGINS
call plug#end()

set background=dark
let base16colorspace=256
colorscheme base16-flat

" PLUGIN SETTINGS
" Polyglot
"" Rust
let g:rustfmt_autosave = 0

" vim-airline-themes
let g:airline_theme='base16'

" vim-pandoc
let g:pandoc#modules#disabled = ["spell"]
let g:pandoc#folding#fdc = 0

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
let g:ycm_rust_src_path = '~/code/external/rust'

" syntastic
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = ""
let g:syntastic_style_error_symbol = ""
let g:syntastic_warning_symbol = ""
let g:syntastic_style_warning_symbol = ""


" END PLUGIN SETTINGS

"autocmd ColorScheme * highlight Cursor gui=reverse guibg=NONE guifg=NONE
"autocmd ColorScheme * highlight CursorLine gui=reverse

highlight SyntasticErrorSign ctermfg=Red ctermbg=18

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" GENERAL SETTINGS

set history=10000
set hidden

set clipboard+=unnamedplus

" make backspace usable
set backspace=2

" don't put temporary junk in my working directory! >:(
let &backupdir=s:editor_root . "/backup//"
let &directory=s:editor_root . "/swap//"
let &undodir=s:editor_root . "/undo/"

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
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-Esc> <Esc>

    command! TerminalSplit sp | execute "normal! <C-w>j" | terminal
    cnoreabbrev tsp TerminalSplit
endif

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

