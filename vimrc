set nocompatible
let mapleader = '<'  " default \, not available on ES keyboard

" Load plugins
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Install all bundles with: vim +BundleInstall +qall
Bundle 'gmarik/vundle'

" Generic plugins
       " ack-grep in vim
"Bundle 'mileszs/ack.vim'
       " search all file names (C-p)
Bundle 'kien/ctrlp.vim'
       " Undo tree (<leader>g)
Bundle 'sjl/gundo.vim'
       " Run tests. :MakeGreen, :MakeGreen %
Bundle 'reinh/vim-makegreen'
       " Shows open buffers
Bundle 'sontek/minibufexpl.vim'
       " File tree (<leader>n)
Bundle 'vim-scripts/The-NERD-tree'
       " Snippets (snippets/<lang>.snippets; C-j / auto-complete)
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
       " Use tab for all completions
Bundle 'ervandew/supertab'
       " Manipulate parentheses, brackets, XML tags, etc.
"Bundle 'tpope/vim-surround'
       " Multi-language syntax checking on save
Bundle 'scrooloose/syntastic'
       " Multi-language auto-completion (needs compilation!)
Bundle 'Valloric/YouCompleteMe'
       " TODO list (<leader>td)
Bundle 'vim-scripts/TaskList.vim'
       " Fast motions
"Bundle 'Lokaltog/vim-easymotion'
       " Comment out stuff (gcc for line, gc<motion>, gc in visual mode)
Bundle 'tpope/vim-commentary'

" Git plugins
       " Git integration. :Gedit, :Gdiff, etc.
Bundle 'tpope/vim-fugitive'
       " Git integration (syntax, indent)
Bundle 'tpope/vim-git'

" Python plugins
       " PEP-8 checker
"Bundle 'vim-scripts/pep8'
       " See module documentation (<leader>pw + cursor)
Bundle 'fs111/pydoc.vim'
       " On-the-fly code checking (requires pyflakes)
Bundle 'mitechie/pyflakes-pathogen'
       " Refactoring and code-assist (see doc/ropevim.txt in repo)
"Bundle 'sontek/rope-vim'

" HTML plugins
       " Writing HTML
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

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
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,longest,preview
"set wildmenu; set wildmode=longest,full
    " default YouCompleteMe configuration for C++
let g:ycm_global_ycm_extra_conf = '~/.vim/syntax/ycm_default_conf.py'
    " bindings for snipMate
imap <C-j> <esc>a<Plug>snipMateNextOrTrigger
smap <C-j> <Plug>snipMateNextOrTrigger

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

" Don't wrap lines, use horizontal scroll
"set nowrap
"set go+=b

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
