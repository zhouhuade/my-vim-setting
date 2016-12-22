set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim/ 
syntax on
filetype off
if isdirectory(expand("~/.vim/bundle/Vundle.vim/"))
    set rtp+=~/.vim/bundle/Vundle.vim/
    call vundle#begin()
    Plugin 'git://github.com/majutsushi/tagbar.git'
    Plugin 'git://github.com/scrooloose/nerdtree.git'
    Plugin 'git://github.com/kien/ctrlp.vim.git'
    "Plugin 'Vallorc/YouCompleteMe'
    Plugin 'git://github.com/brookhong/cscope.vim.git'
    Plugin 'git://github.com/honza/vim-snippets.git'
    Plugin 'git://github.com/SirVer/ultisnips.git'
    Plugin 'git://github.com/vim-scripts/OmniCppComplete.git'
    Plugin 'git://github.com/mbriggs/mark.vim.git'
    "Plugin 'altercation/vim-colors-solarized'
    call vundle#end()
endif
filetype plugin indent on

map "+y :w !pbcopy<CR><CR> 
map "+p :r !pbpaste<CR><CR> 

" ctrl-x for cut 
" vmap <C-x> :!pbcopy<cr> 
" " ctrl-c for copy 
" vmap <C-c> :w !pbcopy<cr><cr> 
" " ctrl-v for paste 
" "nmap <C-v> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR> 
" imap <C-v> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR> 
"
scriptencoding utf-8
syntax on
syntax enable
set background=dark
set mouse=v                 " 保证vim下的复制粘贴功能 
set mousehide               " Hide the mouse cursor while typing
set cursorline                  " Highlight current line
set showmode                    " Display the current mode
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor

set autoindent                  " Indent at the same level of the previous line
set smartindent
set cindent
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set showcmd                     " show the cmd you input
set ruler                       " show the current position

"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set foldmethod=marker
set updatetime=1000

"输入法和vim兼容问题
set noimdisable
autocmd! InsertLeave * set imdisable|set iminsert=0
autocmd! InsertEnter * set noimdisable|set iminsert=0

let mapleader = ','
nnoremap <space> :
nnoremap <c-p> :bp<cr>
nnoremap <c-n> :bn<cr>
nnoremap <leader>" ciw""<esc>P
nnoremap <leader>' ciw''<esc>P
nnoremap <leader>< ciw<><esc>P
nnoremap <leader>( ciw()<esc>P
nnoremap <leader>[ ciw[]<esc>P
nnoremap <leader>{ ciw{}<esc>P
vnoremap <leader>" di""<esc>P
vnoremap <leader>' di''<esc>P
vnoremap <leader>< di<><esc>P
vnoremap <leader>( di()<esc>P
vnoremap <leader>[ di[]<esc>P
vnoremap <leader>{ di{}<esc>P
vnoremap * y/0<cr>
vnoremap # y?0<cr>

"insert mode keymap
inoremap <c-b> <left>
inoremap <c-f> <right>

"ex mode keymap
cnoremap <c-d> <del>
cnoremap <c-a> <Home>
cnoremap <c-b> <left>
cnoremap <c-f> <right>
cnoremap <c-x> <c-f>

nnoremap <silent> <leader><leader>/ :nohlsearch<CR>

" mark.vim
nnoremap <leader>c :MarkClear<cr>

" colorscheme solarized
let g:solarized_termcolors=256

" tagbar
nnoremap <silent> <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
set updatetime=1000

" NERDTree
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <leader>nf :NERDTreeFind<CR>

let OmniCpp_NamespaceSearch = 2 "search namespaces in the current buffer and in include files

" tag
set tags=tags;
nmap <leader>j :tn<cr>
nmap <leader>k :tp<cr>
"nmap <leader>ts :ts<cr>

" ctrlp
let g:ctrlp_map = '<leader>p'
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_root_markers = ["tags", "cscope.out"]
let g:ctrlp_clear_cache_on_exit = 0
set wildignore=*.o,*.obj,*.d,*/.git/*,*.a,*.so
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>u :CtrlPMRUFiles<cr>

" ycm
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/youCompleteMe/.ycm_extra_conf.py'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jg :YcmCompleter GoTo<CR>

" cscope
set cspc=3
let g:cscope_auto_update = 1
"set csprg=/usr/local/bin/cscope
set csto=0
set nocst
let g:cscope_silent = 1
let g:cscope_interested_files = '\.c$\|\.cpp$\|\.h$\|\.java$'
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
nnoremap <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
nnoremap <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
nnoremap <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
nnoremap <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
nnoremap <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
nnoremap <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
nnoremap <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
nnoremap <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

" mstar
nnoremap <leader>l :%s/.*I tvos\s\+://g<cr>
nnoremap <leader><leader>p iprintf("\033[1;44m[toby.li][%s:%s:%d]\033[m\n", __FILE__, __FUNCTION__, __LINE__);<esc>==
