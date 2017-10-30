" turn off mouse mode
set mouse=c

" tabs to 2 spaces
set expandtab
set shiftwidth=2
set softtabstop=2
filetype plugin indent on

" word wrap more excellently
nmap k gk
nmap j gj

" relative line numbers
set relativenumber 
set number

" search options
set incsearch
set hlsearch
set ignorecase
set smartcase

" fzf file fuzzy search
nnoremap <C-p> :FZF<CR>

" ag searching
let g:ackprg = 'ag --vimgrep --smart-case'                                                   
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" ctags file setup
set tags=./.tags;/
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" use control s to save and exit insert mode
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>:!ctags -R --languages=ruby --exclude=.git --exclude=log --tag-relative=yes -f .tags .<CR><CR>

" additional escapes
imap jk <esc>
imap kj <esc>

" open panes same location as tmux
set splitbelow
set splitright

" stop using arrow keys, dammit
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Plugins!
call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'sheerun/vim-polyglot'
Plug 'w0ng/vim-hybrid'
Plug 'blueshirts/darcula'
Plug 'tmhedberg/matchit'
Plug 'joker1007/vim-ruby-heredoc-syntax'

" Wakatime, a time spent coding tracker
Plug 'wakatime/vim-wakatime'

call plug#end()

" Theme
colorscheme hybrid

" custom leader commands
let mapleader = ","
" source vimrc
map <leader>so :source $MYVIMRC<CR>
map <Esc><Esc> :noh<CR>:set nopaste<CR>
map <leader>r :!resize<CR><CR>
map <leader>f :set paste<CR>mmggi# frozen_string_literal: true<CR><CR><Esc>`m:set nopaste<CR>
map <leader>c :!ctags -R --languages=ruby --exclude=.git --exclude=log --tag-relative=yes -f .tags . $(bundle list --paths)<CR>
map <leader>co mmgg"+yG`m

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>n :call RenameFile()<cr>
