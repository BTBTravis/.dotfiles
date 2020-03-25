" Use Relative Line Numbering
set nocompatible
filetype plugin on

set number relativenumber
set nu rnu
" Don't Wrap Lines
set nowrap
set showbreak=+++ " Wrap-broken line prefix
set textwidth=100 " Line wrap (number of cols)

set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)

" Search
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

" Indentation
set autoindent	   " Auto-indent new lines
set expandtab	   " Use spaces instead of tabs
set shiftwidth=4   " Number of auto-indent spaces
set smartindent	   " Enable smart-indent
set smarttab	   " Enable smart-tabs
set softtabstop=4  " Number of spaces per Tab

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

" Utility
Plug 'tpope/vim-fugitive' " slightly better git commands
Plug 'junegunn/goyo.vim' " distraction free writing
Plug 'scrooloose/nerdcommenter' " comment lines out with <Leader>cc
Plug 'vimwiki/vimwiki' " power up your personal wiki
Plug 'scrooloose/nerdtree' " :NERDTree to view file explorer
" Plug 'ctrlpvim/ctrlp.vim' " better auto complete
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" File searching and buffer managment
Plug 'moll/vim-bbye' " use :Bdelete to delete buffer without closing window
"Plug 'mileszs/ack.vim' " search nearby files with ag

" Generic Programming Support
Plug 'tpope/vim-surround' " <cs'!> to change the surrounding ' to !
Plug 'tpope/vim-repeat' " improves . repetes to not only support native features
Plug 'bronson/vim-trailing-whitespace' " highlights trailing white spaces

" Theming
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'mhinz/vim-signify' " show lines changed in working git dir

" PHP Support

" PureScript Support

" Under review
Plug 'AndrewRadev/splitjoin.vim' " switch statments between single and multiline  <g><S> and <g><J>
Plug 'SirVer/ultisnips' " snippets engine
Plug 'sheerun/vim-polyglot' " syntax highlighting for basically every lang
Plug 'majutsushi/tagbar'

Plug 'ianks/vim-tsx' " .tsx support
Plug 'HerringtonDarkholme/yats.vim' " .ts.support
Plug 'mhartington/nvim-typescript', {'do': './install.sh'} " typescript support
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete 
Plug 'vim-scripts/scratch.vim'
"Plugin 'posva/vim-vue'

"Plug 'jakedouglas/exuberant-ctags'


"Plug 'Shougo/denite.nvim'
"Plug 'ervandew/supertab' " better completiong aka everything with <Tab>
"Plug 'vim-scripts/ReplaceWithRegister' " https://github.com/vim-scripts/ReplaceWithRegister

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
let g:UltiSnipsExpandTrigger       ='<Tab>'
let g:UltiSnipsSnippetsDir         = $HOME.'/.config/nvim/UltiSnips/'
let g:UltiSnipsJumpForwardTrigger  ="<Leader>sn"
let g:UltiSnipsJumpBackwardTrigger ="<Leader>sp"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical""
let g:UltiSnipsUsePythonVersion = 3

" Syntax hightlighting in vimwiki
let wiki = {}
let wiki.nested_syntaxes = {'python': 'python', 'php': 'php', 'json': 'json', 'js': 'javascript', 'html': 'html'}
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
nnoremap <Leader>n :NERDTreeFind<CR>
nnoremap <Leader>q :Bdelete<CR>

function! SafeOpenNerdTree()
  if &mod
      echom "Save buffer first"
  else
    execute "Bdelete"
    execute "edit ./"
  endif
endfunction

set tags=./tags;$HOME,tags;$HOME

" placeholder magic
nnoremap <Space><Space> <Esc>/<++<CR>"_c4l
nnoremap <Space>n <Esc>l/<++><CR>h
" always fill p reg with <++>
:autocmd VimEnter * :call setreg('p', '<++>')
"nnoremap <Space>d <Esc>l/<++<CR>dd
"nnoremap <Space>p <Esc>l?<++<CR>h

" js helpers
vnoremap <Space>c "cy<Esc>oconsole.log('<Esc>"cpa', <Esc>"cpa);<Esc>

" yank file name
nnoremap <Leader>f :let @" = expand("%")<CR>

" kill files aka remove delete it from disk remove it from args and delete the buffer
nnoremap <Leader>d :!rm %<CR>:argdelete %<CR>:bd<CR>
"noremap <leader>g :new<CR>:read ! ag "

nnoremap <Leader>pb :Buffers<CR>
nnoremap <Leader>pf :GFiles<CR>
nnoremap <Leader>pg :GFiles?<CR>
nnoremap <Leader>pm :Marks<CR>
nnoremap <Leader>pc :History:<CR>
nnoremap <Leader>pl :Lines<CR>

" nnoremap <Leader>pc :CtrlPChange<CR>
nnoremap <Leader>i <C-i>
nnoremap <Leader>o <C-o>
nnoremap <leader>se :setlocal spell spelllang=en<CR>
nnoremap <leader>sd :setlocal spell spelllang=de<CR>
nnoremap <leader>sn :setlocal nospell<CR>
nnoremap ss :noh<CR>

"git maps
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff

"nnoremap <Leader>s :new<CR>:read ! rg -i <C-R>"
nnoremap <Leader>s :Sscratch<CR>gg"_dG:read ! rg -i <C-R>"
"nnoremap <Leader>s :new|0read !rg fnameescape(@")
"vnoremap <Leader>s y:Ack <C-r>=fnameescape(@")<CR><CR>

" move 5 lines at a time
nnoremap <C-J> 5j
vnoremap <C-J> 5j
nnoremap <C-K> 5k
vnoremap <C-K> 5k

" Remap arrow keys to resize window
nnoremap <Up>    :resize -2<CR>
nnoremap <Down>  :resize +2<CR>
nnoremap <Left>  :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

" Vimwiki Deliver magic
:autocmd BufRead Incoming.wiki ! /Users/t.shears/play/vimwiki_deliver/dump.pl --path  /Users/t.shears/vimwiki/Incoming.wiki --apikey jasflai3ef3jefflj38f8809000000000fa --host https://vimwiki-delivery-bot.travisshears.xyz

function! LookUpDef(word)
    "echom a:word
    silent !clear
    execute "!open https://www.wordnik.com/words/" . a:word
    "normal !open https://www.wordnik.com/words/a:word
endfunction
command! -nargs=* Dic call LookUpDef(<f-args>)

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete_delay', 500)

"open splits to the right and down instead of default
set splitbelow
set splitright

silent! so .vimlocal
