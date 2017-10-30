filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"install lightline cool status bar
Plugin 'itchyny/lightline.vim'

" Trying Pandoc and syntax
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

" Vim Table Mode us TableModeToggle to turn on/off
Plugin 'dhruvasagar/vim-table-mode'

" Vim syntax for neomutt
Plugin 'neomutt/neomutt.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set number
set t_Co=256
colorscheme molokai
highlight Comment cterm=italic
let g:molokai_original = 1
let g:rehash256 = 1
syntax enable
set backupcopy=yes
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set laststatus=2 " for status bar plugin
set fo+=w " F=F format for email compatability
" Unmap Q to avoid invoking ex mode by mistake
nnoremap Q <nop>
nnoremap <F5> "=strftime("%c")<CR>P

