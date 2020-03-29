"      _       _     _______       _     _
"     | |     | |   |__   __|     | |   | |
"   __| | ___ | |_     | | ___  __| | __| |_   _
"  / _` |/ _ \| __|    | |/ _ \/ _` |/ _` | | | |
" | (_| | (_) | |_     | |  __/ (_| | (_| | |_| |
"  \__,_|\___/ \__|    |_|\___|\__,_|\__,_|\__, |
"                                           __/ |
"                                          |___/

syntax on
set number relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set autoindent
set nocompatible              " be iMproved, required
set encoding=utf-8
set mouse=a
set nowrap
set timeoutlen=1000 ttimeoutlen=0
let g:indentLine_setColors = 2
let python_highlight_all = 1
let g:javascript_plugin_jsdoc = 1
let g:pymode_syntax_space_errors = 0
let g:python_highlight_space_errors=0
let g:NERDTreeMouseMode=3
let g:indentLine_fileTypeExclude = ['markdown']
let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'bash']
filetype indent on
filetype off                  " required

"keybinds
nmap <C-n> :NERDTreeToggle<CR>
vnoremap <C-y> "+y


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'prettier/vim-prettier'
Plugin 'preservim/nerdtree'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'sheerun/vim-polyglot'
Plugin 'pangloss/vim-javascript'
Plugin 'hdima/python-syntax'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'airblade/vim-gitgutter'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'chriskempson/base16-vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'hzchirs/vim-material'
Plugin 'ayu-theme/ayu-vim'
Plugin 'rakr/vim-one'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'mhartington/oceanic-next'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"colorscheme
set termguicolors
let colorspace=256  " Access colors present in 256 colorspace
"let ayucolor="mirage"
"colorscheme ayu
"let g:airline_theme='ayu_mirage'
colorscheme palenight
autocmd VimEnter * highlight Normal guibg=#1F2430 gui=NONE
