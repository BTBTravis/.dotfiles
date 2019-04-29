" Use Relative Line Numbering
set nocompatible
filetype plugin on

set number relativenumber
set nu rnu
" Don't Wrap Lines
set nowrap	
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)

set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)
 
" Search 
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
 
" Indentation
set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
 
set ruler	" Show row and column ruler information
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

" Spelling
set spelllang=en

" Custom Key maps
let mapleader = ","
 
" Plugins
" - For Neovim: ~/.local/share/nvim/plugged
call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-fugitive' 
Plug 'tpope/vim-surround' " <cs'!> to change the surrounding ' to !
Plug 'tpope/vim-repeat' " improves . repetes to not only support native features
Plug 'vim-scripts/ReplaceWithRegister' " https://github.com/vim-scripts/ReplaceWithRegister
Plug 'scrooloose/nerdtree' " :NERDTree to view file explorer
Plug 'scrooloose/nerdcommenter' " comment lines out with <Leader>cc
Plug 'moll/vim-bbye' " use :Bdelete to delete buffer without closing window
Plug 'mhinz/vim-signify' " show lines changed in working git dir
Plug 'vimwiki/vimwiki'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'

" Languages
"Plug 'StanAngeloff/php.vim' " PHP syntax highlighting
" Plug 'elmcast/elm-vim'
"Plug 'purescript-contrib/purescript-vim'
Plug 'sheerun/vim-polyglot'

" Plug 'posva/vim-vue'
" Plug 'leafgarland/typescript-vim'
" Plug 'nelsyeung/twig.vim'

" Plug 'junegunn/vim-easy-align'
" Plug 'MattesGroeger/vim-bookmarks'
" Plug 'shawncplus/phpcomplete.vim'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'mileszs/ack.vim'
call plug#end() 

" Theme
syntax on
color dracula
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ultisnips
"if has('nvim')
    "runtime! python_setup.vim
"endif
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsSnippetsDir        = $HOME.'/.config/nvim/UltiSnips/'
let g:UltiSnipsJumpForwardTrigger="<Leader>sn"
let g:UltiSnipsJumpBackwardTrigger="<Leader>sp"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical""
let g:UltiSnipsUsePythonVersion = 3

" Syntax hightlighting in vimwiki
let wiki = {}
let wiki.nested_syntaxes = {'python': 'python'}
let g:vimwiki_list = [wiki]
" Daily quotes in vimwiki
au BufReadPost,BufNewFile diary.wiki call s:Quote()

function! s:Quote()
    execute "normal ggdG,w,i"
    execute ":0r ! ~/vimwiki/get_quote.sh"
    execute "normal V}gq"
endfunction

" easy buffer delete
nnoremap <Leader>t :call SafeOpenNerdTree()<CR>
nnoremap <Leader>q :Bdelete<CR>

function! SafeOpenNerdTree()
  if &mod 
      echom "Save buffer first"
  else
    execute "Bdelete"
    execute "edit ./"
  endif
endfunction

" placeholder magic
nnoremap <Space><Space> <Esc>/<++<CR>"_c4l
nnoremap <Space>d <Esc>l/<++<CR>dd
nnoremap <Space>n <Esc>l/<++<CR>h
nnoremap <Space>p <Esc>l?<++<CR>h

" js helpers
vnoremap <Space>c "cy<Esc>oconsole.log('<Esc>"cpa', <Esc>"cpa);<Esc>