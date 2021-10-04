
" ██████╗░░█████╗░████████╗██╗░░░██╗██╗███╗░░░███╗
" ██╔══██╗██╔══██╗╚══██╔══╝██║░░░██║██║████╗░████║
" ██║░░██║██║░░██║░░░██║░░░╚██╗░██╔╝██║██╔████╔██║
" ██║░░██║██║░░██║░░░██║░░░░╚████╔╝░██║██║╚██╔╝██║
" ██████╔╝╚█████╔╝░░░██║░░░░░╚██╔╝░░██║██║░╚═╝░██║
" ╚═════╝░░╚════╝░░░░╚═╝░░░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝



" ================================================
"                     SETS
" ================================================

set guicursor=
set relativenumber
set nu nohlsearch
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set cursorline
set mouse=a
set timeoutlen=1000 ttimeoutlen=0
set viminfo+=n~/.vim/viminfo
set colorcolumn=80
set incsearch
set termguicolors
set scrolloff=8
set signcolumn=yes
"set cmdheight=2


"let g:indentLine_setColors = 2
let g:javascript_plugin_jsdoc = 1
let g:pymode_syntax_space_errors = 0
let g:python_highlight_space_errors=0
let g:NERDTreeMouseMode=3
let g:indentLine_fileTypeExclude = ['markdown']
" indentLine breaks vimwiki
"let g:indentLine_concealcursor=""
"let g:indentLine_conceallevel=2
let g:markdown_enable_conceal = 1
let g:markdown_enable_folding = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'bash', 'python', 'vim', 'shell']
let g:airline_powerline_fonts = 0
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
                 \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
let g:python3_host_prog = "/usr/bin/python3"
let g:python_host_prog = "/usr/bin/python2"
let g:mkdp_refresh_slow=1

autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = 'img'

filetype indent on
filetype plugin on

" ================================================
"keybinds
nmap <C-n> :CHADopen<CR>
nnoremap <C-p> :MarkdownPreview<CR>
vnoremap <C-y> "+y
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :ALENext<CR>
nnoremap <C-k> :ALEPrevious<CR>
autocmd BufRead,BufNewFile *.py let python_highlight_all=1
autocmd FileType python map <buffer> <F10> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType c map <buffer> <F10> :w<CR>:!gcc -g % -o %< && ./%< <CR>
autocmd FileType javascript map <buffer> <F10> :w<CR>:!node % <CR>
autocmd FileType javascript  setlocal shiftwidth=2 softtabstop=2
autocmd FileType simula setlocal shiftwidth=4 softtabstop=4
"autocmd FileType c setlocal ts=4 sw=4
"autocmd FileType cpp setlocal ts=4 sw=4
"autocmd FileType go setlocal ts=4 sw=4
"autocmd BufWritePost *.py call flake8#Flake8()
"autocmd BufWritePost *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

" ================================================
"                    PLUGINS
" ================================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'}
" Plug 'tpope/vim-markdown'
Plug 'chriskempson/base16-vim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'vimwiki/vimwiki'
Plug 'ferrine/md-img-paste.vim'
Plug 'mhinz/vim-startify'
Plug 'sotte/presenting.vim'
Plug 'junegunn/goyo.vim'
Plug 'neovim/nvim-lspconfig'
" Plug 'williamboman/nvim-lsp-installer', {'branch': 'master'}
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'jiangmiao/auto-pairs'


call plug#end()            " required

let mapleader = " "

" ================================================
"                     FZF
" ================================================
nnoremap <silent> <Leader><TAB> :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>r :Rg<CR>

" ================================================
" Git
nnoremap <silent> <Leader>f :GFiles<CR>

" ================================================
"colorscheme
set t_co=256
set termguicolors
set background=dark
colorscheme base16-tomorrow-night

if !has('nvim')
  set viminfo+=n~/.local/share/vim/viminfo
endif

"let g:jedi#auto_vim_configuration = 0

" ================================================
" floating fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8, 'highlight': 'Comment' } }

" ================================================
"                     ALE
" ================================================
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \'*': ['remove_trailing_lines', 'trim_whitespace'],
    \'javascript': ['eslint', 'prettier'],
    \'python': ['black', 'isort'],
    \'typescript': ['prettier', 'eslint'],
    \'typescriptreact': ['prettier', 'eslint'],
    \'yaml': ['prettier'],
    \'java': ['google_java_format', 'remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_linters = {
    \'python': ['flake8', 'isort', 'jedi'],
    \'typescript': ['tsserver', 'eslint'],
    \'typescriptreact': ['tsserver', 'eslint'],
    \'javascript': ['eslint', 'ternjs', 'flow'],
    \'jsx': ['stylelint'],
    \'bash': ['shell', 'shellcheck'],
    \'zsh': ['shell'],
    \'yaml': ['yamllint'],
    \'java': [],
\}
let g:ale_python_flake8_options = '--ignore=E501'
let g:ale_java_google_java_format_options= '--aosp'
let g:ale_disable_lsp = 1

" ================================================
"                   Startify
" ================================================
let g:startify_bookmarks = ['~/dotfiles/.vimrc', '~/dotfiles/.zshrc','~/dotfiles/', '~/prog/webkom/', '~/prog/webkom/lego/',
            \ '~/prog/webkom/lego-webapp/', '~/prog/itdagene/',  '~/ctf/' ]
let g:ascii = [
      \ "        __",
      \ "\ ______/ V`-,       Wooof",
      \ " }        /~~",
      \ "/_)^ --,r'",
      \ "b      |b      Wise doggo says:",
     \]
let g:startify_custom_header = g:ascii + startify#fortune#boxed()
let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" ================================================
"                Custom bindings
" ================================================

" Render markdown with python
function! MarkdownView()
    execute ':cd %:p:h'
"    execute '!' . 'docker run --rm --volume "`pwd`:/data" pandoc-template --template eisvogel --listings --pdf-engine xelatex'  '%' . ' -o ' . '%<' . '.pdf'
    execute '!' . 'docker run --rm --volume "`pwd`:/data" pandoc-template --template eisvogel --pdf-engine xelatex'  '%' . ' -o ' . '%<' . '.pdf'
endfunction
nnoremap <leader>v :call MarkdownView()<cr>

" Prompt for spell language
nnoremap <expr> <F1> ":setlocal spell spelllang=" . input("Spell language: ")"
"
nnoremap <F2> :setlocal spell spelllang=en_us<cr>
nnoremap <F3> :setlocal spell spelllang=nb<cr>

" Change directory to current file
nnoremap <leader>cd :cd %:p:h<CR>

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = ' '
let g:airline_right_sep = '«'
let g:airline_right_sep = ' '
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let hostname=system('hostname -s | tr -d "\n"')
let user=system('echo $USER | tr -d "\n"')
let g:airline_section_a = '%{user}@%{hostname}'

" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.base.json set filetype=jsonc

" set makeprg=

luafile ~/.vim/lsp_config.lua

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ge    <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>f    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <leader>rn    <cmd>lua vim.lsp.buf.rename()<CR>

nnoremap <silent> <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
xmap <silent> <leader>a <cmd>lua vim.lsp.buf.range_code_action()<CR>

set completeopt=menuone,noselect
