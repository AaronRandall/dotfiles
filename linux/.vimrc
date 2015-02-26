set number
syntax enable
set softtabstop=2           " 2 space tabs
set shiftwidth=2
set tabstop=2
set expandtab

set autoindent
set ignorecase              " ignore case in searches
set smartcase               "   unless search has a capital letter

set wildmode=longest,list,full " tab filename completion
set wildmenu

set scroll=5

" highlight search terms
set hlsearch

autocmd BufWritePre * :%s/\s\+$//e

" update ctags on saves
autocmd BufWritePost * silent! !/usr/bin/ctags -wR 2> /dev/null &

" Remap code completion to Ctrl+Space
if has("gui_running")
    " C-Space seems to work under gVim on both Linux and win32
    inoremap <C-Space> <C-n>
else " no gui
  if has("unix")
    inoremap <Nul> <C-n>
  else
  " I have no idea of the name of Ctrl-Space elsewhere
  endif
endif

" Re-read the file before going into insert mode (in case you've switched branches, etc)
au InsertEnter * checkt

let mapleader = ","
nmap <leader>f :NERDTreeToggle<cr>
nmap <leader>s :CommandT<cr>

execute pathogen#infect()
