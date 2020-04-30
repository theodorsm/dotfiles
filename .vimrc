"      _       _     _______       _     _
"     | |     | |   |__   __|     | |   | |
"   __| | ___ | |_     | | ___  __| | __| |_   _
"  / _` |/ _ \| __|    | |/ _ \/ _` |/ _` | | | |
" | (_| | (_) | |_     | |  __/ (_| | (_| | |_| |
"  \__,_|\___/ \__|    |_|\___|\__,_|\__,_|\__, |
"                                           __/ |
"                                          |___/
"
syntax on
so ~/dotfiles/.coc.vim
set number
set nu
set tabstop=4
set shiftwidth=4 
set expandtab
set cursorline
set autoindent
set nocompatible
set encoding=utf-8
set mouse=a
set timeoutlen=1000 ttimeoutlen=0
set viminfo+=n~/.vim/viminfo
set colorcolumn=80
let g:indentLine_setColors = 2
let python_highlight_all = 1
let g:javascript_plugin_jsdoc = 1
let g:pymode_syntax_space_errors = 0
let g:python_highlight_space_errors=0
let g:NERDTreeMouseMode=3
let g:indentLine_fileTypeExclude = ['markdown']
let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'bash']
let g:airline_powerline_fonts = 0
filetype indent on
filetype off                  " required

"keybinds
nmap <C-n> :NERDTreeToggle<CR>
vnoremap <C-y> "+y
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
autocmd FileType python map <buffer> <F10> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd BufWritePost *.py call flake8#Flake8()

call plug#begin()
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'preservim/nerdtree'
Plug 'ntpeters/vim-better-whitespace'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvie/vim-flake8'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'hdima/python-syntax'
Plug 'tpope/vim-fugitive'
Plug 'git://git.wincent.com/command-t.git'
Plug 'airblade/vim-gitgutter'
"Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'}
Plug 'chriskempson/base16-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'hzchirs/vim-material'
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline-themes'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'mhartington/oceanic-next'
call plug#end()            " required
filetype plugin indent on    " required

"let g:coc_node_path='/usr/bin/node'

"colorscheme
set termguicolors
let colorspace=256  " Access colors present in 256 colorspace
"let ayucolor="mirage"
"colorscheme ayu
"let g:airline_theme='ayu_mirage'
set background=dark
colorscheme palenight
"hi Normal guibg=NONE ctermbg=NONE
autocmd VimEnter * highlight Normal guibg=#141A21 gui=NONE
