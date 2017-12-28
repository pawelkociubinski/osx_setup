call plug#begin('~/.vim/plugged')
Plug 'rstacruz/vim-closer'
Plug 'alpaca-tc/vim-endwise'
Plug 'yuttie/comfortable-motion.vim'
Plug 'valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'scrooloose/nerdtree' " NERDTREE
Plug 'Xuyuanp/nerdtree-git-plugin' " integracja NERDTree z GIT
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'


Plug 'joshdick/onedark.vim' " PALETA KOLOROW Z ATOM
Plug 'mhinz/vim-startify' " nowy starting screen dla vim
Plug 'christoomey/vim-tmux-navigator' " prosta nawigacja pomiedzy tmux i vim panelami
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
" GIT
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive' " integracja z GIT
"Programming languages
Plug 'elmcast/elm-vim' " elm-vim musi znajdowac sie wyzej niz vim-polyglot
Plug 'sheerun/vim-polyglot' " Syntax highlight dla wielu rodzajow plikow
Plug 'mxw/vim-jsx' " Syntax highlight dla JSX
call plug#end()

" Enable filetype plugins
filetype plugin on
filetype indent on

set hidden " allow buffer switching without saving
set showtabline=2  " always show tabline/showtabline
set autoread " Set to auto read when a file is changed from the outside
set history=1000 " Sets how many lines of history VIM has to remember
set laststatus=2 " Pokazuje pasek statusu lightline.vim
set noshowmode " ukrywa domyslny pasek statusu
set timeoutlen=1000 ttimeoutlen=0 " przyspiesza dzialanie ESC
set showmatch " Show matching brackets.
set mat=2 " How many tenths of a second to blink when matching brackets
set number " Show the line numbers on the left side.
set tabstop=2 " Render TABs using this many spaces
set shiftwidth=2 " Indentation amount for < and > commands.
set expandtab " Insert spaces when TAB is pressed.
set hlsearch " highlight na wszystkich pasujacych frazach z search
set incsearch " Makes search act like search in modern browsers
set splitright " Vertical split to right of current.
set ignorecase " Make searching case insensitive
set smartcase " When searching try to be smart about cases
set clipboard=unnamedplus " wspolny schowek dla systemu i vim
set wildmenu " pokazuje podpowiedzi do mozliwych komend do wybrania podczas wpisywania ich w linii polecen
set lazyredraw " Don't redraw while executing macros (good performance config)
set magic " For regular expressions turn magic on

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

set tags=./tags,tags;

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

let g:jsx_ext_required = 0 " jsx syntax highlight dla plikow .js // config vim-jsx
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=1
let g:elm_format_autosave = 1 " format ELM code after save
let g:polyglot_disabled = ['elm'] " wylacza polyglot dla Elm poniewaz istnieje elm-vim

let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

" relatywne liczby z lewej strony
if(&relativenumber == 1)
  set nornu
  set number
else
  set rnu
  endif

" remap arrow keys
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>
nnoremap <CR> :noh<CR><CR>
nnoremap <C-p> :Files<CR>

let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline = {
 \ 'tabline': {'left': [['buffers']], 'right': [['close']]},
 \ 'component_expand': {'buffers': 'lightline#bufferline#buffers'},
 \ 'component_type': {'buffers': 'tabsel'}
 \}

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

let g:fzf_colors =
      \ { 'fg': ['fg', 'Normal'],
      \ 'bg': ['bg', 'Normal']}

syntax on " Enable syntax highlighting
colorscheme onedark " config onedark.vim
