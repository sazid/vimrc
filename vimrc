" Place in ~/.vimrc

set nocompatible

let mapleader = ' '

" highlight Pmenu ctermbg=lightgreen guibg=gray
" set wincolor=Pmenu

" Syntax highlighting
if has("syntax")
  syntax on
endif

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
set relativenumber  " Show relative numbers
set encoding=UTF-8  " UTF-8 encoding for international characters
set scrolloff=5  " Minimum number of lines to show above and below the cursor
set wildmenu  " Auto-complete menu
set laststatus=2  " Always show status line
" set cursorline

" Permanent undos - even after closing files!
set undodir=~/.vim/undodir
set undofile

" Tabs
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab  " Expand tabs to spaces

" To use `ALT+{h,j,k,l}` to navigate windows from any mode:
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" Use Ctrl-C or Ctrl-J to ESC
inoremap <C-c> <ESC>
vnoremap <C-j> <ESC>
inoremap <C-c> <ESC>
vnoremap <C-j> <ESC>

" Jump to start and end of line from home row
map H ^
map L $

" Move by line for longer lines
nnoremap j gj
nnoremap k gk

" Disable cursor keys
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Use left right cursor keys to navigate between buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" rust.vim
Plug 'rust-lang/rust.vim'

" ctrlp.vim - fuzzy file search
" Plug 'ctrlpvim/ctrlp.vim'

" Tagbar
Plug 'majutsushi/tagbar'

" coc.vim for VScode like completion
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" LSP plugin
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'

" vim go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Multi cursor edit
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" fzf fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Elixir
Plug 'elixir-editors/vim-elixir'

Plug 'tomasiser/vim-code-dark'

" Plug 'ap/vim-buftabline'

" Initialize plugin system
call plug#end()

" Toggle FZF with Ctrl-P
" nnoremap <C-p> :FZF<CR>

" Toggle NERD Tree with Ctrl-Shift-E
nnoremap <C-S-e> :NERDTreeToggle<CR>

" asynccomplete settings
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"
imap <c-@> <Plug>(asyncomplete_force_refresh)
" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview

" autocmd FileType go nmap <leader>t  <Plug>(go-test)
" autocmd FileType go nmap <leader>b  <Plug>(go-build)

" LSP settings
if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-j> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-k> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

colorscheme codedark

" FZF related shortcuts
" Show the list of files to search through
nnoremap <c-p> :Files<cr>
nnoremap <leader>p :Files<cr>
" Search for text using ripgrep
noremap <leader>f :Rg<cr>
" List currently opened buffers
nnoremap <leader>b :Buffers<cr>
" Close current buffer
nnoremap <leader>x :bd<cr>

" Elixir file types and HEEx support
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir

