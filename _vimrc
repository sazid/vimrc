" Bismillahir Rahmanir Rahim, ALLAHU AKBAR
" Author: Sazid

" Break the compatibility with vi
set nocompatible

" Syntax highlighting
if has("syntax")
  syntax on
endif

" Configuration for gvim
if has("gui_running")
  colorscheme ir_black

  " Set the font
  if has("win32") || has("win64")
    set guifont=Consolas:h12:cANSI
  elseif has("unix")
    set guifont=Monospace\ 12
  endif

endif

set background=dark  " Use a dark background
set showcmd  " Show partial command in status line 
set ignorecase " Ignore case while searching
set showmatch  " Show matching bracket
set smartcase  " Do smartcase matching
set incsearch  " Incremental search
set autowrite  " Automatically save before executing make, etc.
set mouse=a  " Enable mouse interaction
set smartindent  " Smart indenting
set autoindent  " Automatically indent
set number  " Show line numbers
set encoding=UTF-8  " UTF-8 encoding for international characters
set scrolloff=5  " Minimum number of lines to show above and below the cursor
set wildmenu  " Auto-complete menu
set laststatus=2  " Always show status linee

" Tabs
set smarttab
" set tabstop=4
set shiftwidth=4
set expandtab  " Expand tabs to spaces

" Remaps
" To insert timestamp
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" Linux and Unix configurations
if has("unix")

  set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim

  " Set 256 colors for terminal
  if $COLORTERM == 'gnome-terminal'
     set t_Co=256
  endif
  "
  " Template files to load when opening specific type of files
  if has("unix")
    if has("autocmd")
      au BufNewFile *.c       source ~/.vim/ftplugin/sz_c_skeleton.vim
      au BufNewFile *.cpp     source ~/.vim/ftplugin/sz_cpp_skeleton.vim
      au BufNewFile *.rb      source ~/.vim/ftplugin/sz_rb_skeleton.vim
      au BufNewFile *.py      source ~/.vim/ftplugin/sz_py_skeleton.vim
      au BufNewFile *.java    source ~/.vim/ftplugin/sz_java_skeleton.vim
    endif
  endif

endif

" Vundle specific------->
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" The bundles
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
" Bundle 'Valloric/YouCompleteMe'
" ---------------------->

" Initialize pathogen.vim
" execute pathogen#infect()

" Initialize Nerdtree
" au vimenter * NERDTree


