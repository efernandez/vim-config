set nocompatible
let mapleader = '<'  " default \, not available on ES keyboard

" Load plugins
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Install all bundles with: vim +BundleInstall +qall
Bundle 'gmarik/vundle'

"Bundle 'mileszs/ack.vim'
"Bundle 'wincent/Command-T'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'sjl/gundo.vim'
Bundle 'reinh/vim-makegreen'
Bundle 'sontek/minibufexpl.vim'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'vim-scripts/pep8'
Bundle 'fs111/pydoc.vim'
Bundle 'alfredodeza/pytest.vim'
Bundle 'mitechie/pyflakes-pathogen'
Bundle 'sontek/rope-vim'
Bundle 'msanders/snipmate.vim'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/TaskList.vim'

" Setup keyboard bindings for plugins
map <leader>td <Plug>TaskList     " Browse TODO items
map <leader>g :GundoToggle<CR>    " See past file edits
map <leader>n :NERDTreeToggle<CR> " Open file browser
map <leader>a <Esc>:Ack!
" For pydoc, use <leader>pw with cursor on a module name
" For command-t, use <leader>t (or <leader>b to search only buffers)
"   * Needs to be compiled with "rake make" first (with ruby-dev installed).

" Window Splits
"  * Vertical Split: Ctrl+w + v / Horizontal Split: Ctrl+w + s
"  * Close: Ctrl+w + q
" Move through splits
nmap <C-Left> <C-w><Left>
nmap <C-Right> <C-w><Right>
nmap <C-Up> <C-w><Up>
nmap <C-Down> <C-w><Down>
" Rotate through splits:
nmap <kPlus> <C-w><C-w>
nmap <kMinus> <S-C-w><S-C-w>
" Create splits (and focus them)
nmap <C-kMinus> <C-w>v<kPlus>
nmap <C-kPlus> <C-w>s<kPlus>
nmap <C-kMultiply> :enew<CR>  " create new empty buffer (in active split)
" Fullscreen the active split
"map <c-w>f <c-w>_<c-w><Bar>

" Buffers (with minibufexpl plugin to see a list of open buffers):
"   * Use ":e <filename>" to place in buffer.
"   * Use ":bN" to switch to buffer N.
"   * Use ":bw" or ":bd" to close a buffer.

" Tabs
"   * Use :tabnew to create a tab.
"   * Use :tabNext to change to next tab.
"   * Use :tabclose to close the active tab.

" Enable syntax highlighting
syntax on
filetype on
filetype plugin indent on

" Indentation
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab  " Use <Ctrl-V><Tab> to insert a hard tab.
autocmd FileType make setlocal noexpandtab

" Line numbers
set number

" Code folding
" Use "za" to open or close a fold.
set foldmethod=indent
set foldlevel=99

" Auto-completion
set completeopt=menuone,longest,preview
"set wildmenu; set wildmode=longest,full
let g:SuperTabDefaultCompletionType = "context"
"au FileType python set omnifunc=pythoncomplete#Complete
set omnifunc=syntaxcomplete#Complete

set showcmd
set modeline
set title

" Let backspace delete over line breaks
set backspace=indent,eol,start

" Searching (http://mislav.uniqpath.com/2011/12/vim-revisited/)
set ignorecase
set smartcase

" Spell checking
"   * Use "z=" with cursor on top of a word for suggestions.
nmap <silent> <leader>s :setlocal spell!<CR>  " toggle spell checking
au BufRead,BufNewFile *.txt setlocal spell spelllang=en

set pastetoggle=<F2>
if !has("gui_running")
  set background=dark
endif
set mouse=a

cnoreabbrev W w
cnoreabbrev Q q

" Vala
autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vala.in         setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala
let vala_comment_strings = 1
let vala_space_errors = 1

" URDF
au BufRead,BufNewFile *.urdf            setfiletype xml

" Python
autocmd FileType python map <buffer> <leader>j :RopeGotoDefinition<CR>
autocmd FileType python map <buffer> <leader>r :RopeRename<CR>
let g:pyflakes_use_quickfix = 0
let g:pep8_map='<leader>8'

" HTML
au BufRead,BufNewFile *.html            set tabstop=2 shiftwidth=2

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
