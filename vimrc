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
Bundle 'fholgado/minibufexpl.vim'
       " File tree (<leader>n)
Bundle 'vim-scripts/The-NERD-tree'
       " Snippets
Bundle 'SirVer/ultisnips'
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
       " Fast motions (<leader><leader>{w,b,...})
Bundle 'Lokaltog/vim-easymotion'
       " <C-a>/<C-x> increment/decrement numbers; add support for dates
       " d<C-a> changes a date to the current day
Bundle 'tpope/vim-speeddating'
       " Comment out stuff (<leader>{cc,cu,cs,...})
Bundle 'scrooloose/nerdcommenter'
       " Class outline viewer (toggle w/ F8) (requires exuberant-ctags)
Bundle 'majutsushi/tagbar'
       " Automatically add closing character for parenthesis, quotes, etc.
"Bundle 'fholgado/vim-autoclose'
"Bundle 'Townk/vim-autoclose'

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

" C++ plugins
       " Switch between source and header files
       " For possible mappings, see:
       "   https://github.com/derekwyatt/vim-fswitch/blob/master/doc/fswitch.txt
Bundle 'derekwyatt/vim-fswitch'

" Setup keyboard bindings for plugins
map <leader>t <Plug>TaskList     " Browse TODO items
map <leader>g :GundoToggle<CR>    " See past file edits
map <leader>n :NERDTreeToggle<CR> " Open file browser
"map <leader>a <Esc>:Ack!
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
for i in [1, 2, 3, 4, 5, 6, 7, 8, 9]
  " nmap <leader>1 :b1<CR>, etc.
  execute "nmap <leader>" . i . " :b" . i . "<CR>"
endfor

" Tabs
"   * Use :tabnew to create a tab.
"   * Use :tabNext to change to next tab.
"   * Use :tabclose to close the active tab.

" Motions (with easymotion)
" <C-q>: move to word (<C-w> conflicts with split management)
" <C-j>/<C-k>: move to line
map <C-q> <Esc><leader><leader>w
"map <C-j> <Esc><leader><leader>j
"map <C-k> <Esc><leader><leader>j

" Diff mode
"  * do: get changes from current window into other window
"  * dp: put changes from current window into other window
"  * dn: jump to next change
"  * dm: jump to previous change
"map <leader><Down> ]c
"map <leader><Up> [c
map dn ]c
map dm [c

" Switching between code and header files
"  * gf: with the cursor over a #include line, open the file.
"  * <C-o>: go back to previous source file.
set path=.,include/,../include/,/usr/include/c++/*,/opt/ros/hydro/include

" Backup settings
set directory=~/.vim/.swap,/tmp  " don't create swap files in CWD

" Enable syntax highlighting
syntax on
filetype on
filetype plugin indent on

" Indentation
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab  " Use <Ctrl-V><Tab> to insert a hard tab.
au FileType make setlocal noexpandtab
au FileType html,xml set tabstop=2 shiftwidth=2

" Line numbers
set number
set relativenumber

" Code folding
" Use "za" to open or close a fold.
set foldmethod=indent
set foldlevel=99
map <C-f> <Esc>za

" Auto-completion
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,longest,preview
    " Show various auto-complete options in command-line
set wildmenu wildmode=longest,full
set wildignore=*.o,*.obj,*.pyc
    " YouCompleteMe configuration
let g:ycm_global_ycm_extra_conf = '~/.vim/syntax/ycm_default_conf.py'  " default for C++
"let g:ycm_autoclose_preview_window_after_completion = 1  " otherwise close with :pclose or <C-w>z
    " make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
    " better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    " Keybinding for Tagbar
map <F8> :TagbarToggle<CR>

" General configuration
" (http://mislav.uniqpath.com/2011/12/vim-revisited/)
set encoding=utf-8
set history=600
set showcmd
set modeline
set title
set hidden  " allow switching to another buffer without saving
runtime macros/matchit.vim  " enable extended % matching
                            " ie. not only braces, but also if/endif, etc.
set list listchars=tab:→\ ,trail:·

" Let backspace delete over line breaks
set backspace=indent,eol,start

" Searching
set ignorecase
set smartcase
set incsearch  " incremental search; still need to press Enter to accept
set hlsearch   " highlight all search results; clear with :nohlsearch

" Spell checking
"   * Use "z=" with cursor on top of a word for suggestions.
nmap <silent> <leader>s :setlocal spell!<CR>  " toggle spell checking
au BufRead,BufNewFile *.txt setlocal spell spelllang=en
au FileType svn setlocal spell spelllang=en
au FileType gitcommit setlocal spell spelllang=en

" Don't wrap lines, use horizontal scroll
"set nowrap
"set go+=b

" Change local working directory to file directory
autocmd BufEnter * silent! lcd %:p:h
" <f12> will open a terminal in the working directory
map <f12> <Esc>:silent ! nohup "$COLORTERM" >/dev/null 2>&1 <&1<CR>

set pastetoggle=<F2>
if has("gui_running")
  colors torte
  set guifont=Ubuntu\ Mono\ 12
else
  set background=dark
endif
set mouse=a

" Define :W, :Q, :X as aliases for :w, :q, :z.
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev X x

" Other useful aliases
command! UpdateConfig so $MYVIMRC  " Reload vim configuration

" Keybindings
nmap <f3> :update<CR>
vmap <f3> <Esc><f3>gv
imap <f3> <c-o><f3>

" C++
au FileType c,cpp map <f4> :FSHere<cr>

" Vala
au BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vala.in         setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala
let vala_comment_strings = 1
let vala_space_errors = 1

" Python
au FileType python map <buffer> <leader>j :RopeGotoDefinition<CR>
au FileType python map <buffer> <leader>r :RopeRename<CR>
au FileType python map <buffer> <f5>      :w<CR>:!python %<CR>
let g:pyflakes_use_quickfix = 0
let g:pep8_map='<leader>8'

" ROS
au BufRead,BufNewFile *.urdf              setfiletype xml
au BufRead,BufNewFile *.launch            setfiletype xml
au BufRead,BufNewFile *.world             setfiletype xml
au BufRead,BufNewFile *.launch            UltiSnipsAddFiletypes roslaunch.xml
au BufRead,BufNewFile cfg/*.cfg           UltiSnipsAddFiletypes roscfg.python
au BufRead,BufNewFile manifest.xml        UltiSnipsAddFiletypes rosmanifest.xml
au BufRead,BufNewFile */stacks/*.{cpp,h}  UltiSnipsAddFiletypes roscpp.cpp
au BufRead,BufNewFile */*_ws/*.{cpp,h}    UltiSnipsAddFiletypes roscpp.cpp
au BufRead,BufNewFile */stacks/*.py       UltiSnipsAddFiletypes rospy.python
au BufRead,BufNewFile */*_ws/*.py         UltiSnipsAddFiletypes rospy.python

" Add the virtualenv's site-packages to vim path
"py << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUAL_ENV' in os.environ:
    "project_base_dir = os.environ['VIRTUAL_ENV']
    "sys.path.insert(0, project_base_dir)
    "activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    "execfile(activate_this, dict(__file__=activate_this))
"EOF
