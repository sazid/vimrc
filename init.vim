set autoindent
set smartindent

set tabstop=4
set shiftwidth=4
" set smarttab
set expandtab

" set number
set relativenumber

set ignorecase
set smartcase

set background=dark

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'cloudhead/neovim-fuzzy'

Plug 'ap/vim-buftabline'

Plug 'posva/vim-vue'

" Initialize plugin system
call plug#end()

nnoremap <C-p> :FuzzyOpen<CR>

nnoremap <C-M-n> :bnext<CR>
nnoremap <C-M-p> :bprevious<CR>

autocmd FileType vue syntax sync fromstart
set redrawtime=10000
