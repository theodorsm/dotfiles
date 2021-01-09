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
set number
set nu
set tabstop=2
set shiftwidth=2
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
" indentLine breaks vimwiki
let g:indentLine_concealcursor=""
let g:indentLine_conceallevel=2
let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'bash']
let g:airline_powerline_fonts = 0
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': ['eslint', 'prettier'],
\ 'python': ['black'],
\ 'markdown': ['prettier'],
\ 'yaml': ['prettier'],
\}
let g:ale_python_flake8_options = '--ignore=E501'
let g:ale_disable_lsp = 1
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
                 \ 'syntax': 'markdown', 'ext': '.md'}]

autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'

filetype indent on
filetype plugin on

"keybinds
nmap <C-n> :CHADopen<CR>
vnoremap <C-y> "+y
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :ALENext<CR>
nnoremap <C-k> :ALEPrevious<CR>
autocmd FileType python map <buffer> <F10> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType c map <buffer> <F10> :w<CR>:!gcc -g % -o %< && ./%< <CR>
autocmd FileType javascript map <buffer> <F10> :w<CR>:!node % <CR>
autocmd FileType c setlocal ts=4 sw=4
autocmd FileType cpp setlocal ts=4 sw=4
autocmd FileType go setlocal ts=4 sw=4
"autocmd BufWritePost *.py call flake8#Flake8()
"autocmd BufWritePost *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

"plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvie/vim-flake8'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'hdima/python-syntax'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'}
Plug 'chriskempson/base16-vim'
Plug 'flazz/vim-colorschemes'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'hzchirs/vim-material'
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'mhartington/oceanic-next'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vimwiki/vimwiki'
Plug 'ferrine/md-img-paste.vim'
call plug#end()            " required

let mapleader = ","

" FZF
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
" Git
nnoremap <silent> <Leader>g :GFiles<CR>

"colorscheme
set t_co=256
set termguicolors
set background=dark
colorscheme base16-tomorrow-night

if !has('nvim')
  set viminfo+=n~/.local/share/vim/viminfo
endif

" floating fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8, 'highlight': 'Comment' } }

" ===================================================
" NVIM lspconfig settings
" ===================================================

" Set mappings for lsp buf methods
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gc    <cmd>lua vim.lsp.buf.declaration()<CR>

" Set filetype omnifunc
autocmd Filetype typescript setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype javascript setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c


lua <<EOF

-- vim
-- yarn global add vim-language-server
require'nvim_lsp'.vimls.setup{}

-- flow
-- npx flow lsp --help
require'nvim_lsp'.flow.setup{
  on_attach=require'completion'.on_attach
}

-- typescript
-- :LspInstall tsserver
require'nvim_lsp'.tsserver.setup{
  on_attach=require'completion'.on_attach
}

-- bash
-- :LspInstall bashls
require'nvim_lsp'.bashls.setup{}

-- css
-- :LspInstall cssls
require'nvim_lsp'.cssls.setup{}

-- Docker
-- :LspInstall dockerls
require'nvim_lsp'.dockerls.setup{}

-- HTML
-- LspInstall html
require'nvim_lsp'.html.setup{}

-- Java
-- :LspInstall jdtls
require'nvim_lsp'.jdtls.setup{}

-- python
require'nvim_lsp'.jedi_language_server.setup{}

-- json
-- :LspInstall jsonls
require'nvim_lsp'.jsonls.setup{}

-- yamlls
-- :LspInstall yamlls
require'nvim_lsp'.yamlls.setup{}

EOF
