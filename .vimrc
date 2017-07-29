" ===================================================
" *      Author : icon97 <p.h.tan97@gmail.com>      *
" *      File Name : .vimrc                         *
" *      Version : 1.0                              *
" *      Creation Date : 29/07/2017                 *
" *      Last Modified : 29/07/2017 22:26           *
" *      Description :                              *
" ===================================================

"**************************************************
""Auto set

"" no vi compat
set nocompatible

"" filetype func off
filetype off

"" initialize vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
"" start- all plugins below

Plugin 'VundleVim/Vundle.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'bronson/vim-trailing-whitespace'
Plugin 'raimondi/delimitmate'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'

Plugin 'yggdroot/indentline'
Plugin 'thaerkh/vim-workspace'
Plugin 'valloric/youcompleteme'
Plugin 'chiel92/vim-autoformat'

"" stop - all plugins above
call vundle#end()

"" filetype func on
filetype plugin indent on

"***************************************************************************
""Header
function! AddHeader()
  0r ~/Documents/header.template
  exe "2,7s/File Name :.*/File Name : " .printf("%-31s*", expand("%"))
  exe "2,7s/Creation Date :.\\{11}/Creation Date : " .strftime("%d\\/%m\\/%Y")
  exe "normal gg8\<Plug>NERDCommenterComment"
endfunction

noremap <F3> :exe AddHeader()<CR>
au bufwritepre,filewritepre *.* execute "normal ma"
au bufwritepre,filewritepre *.* exe "2,7s/Last Modified :.\\{17}/Last Modified : " .strftime("%d\\/%m\\/%Y %H:%M")
au bufwritepost,filewritepost *.* execute "normal `a"

"***************************************************************************
"" General

set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

set autoindent	" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=2	" Number of spaces per Tab

"" Advanced
set wildmenu
set encoding=utf8
set mouse=a
syntax on
set noshowmode
set ruler	" Show row and column ruler information

set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

"*****************************************************************
"" Mapping

"" Map leader to ,
let mapleader=','

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

""IDE
nnoremap <F8> :make! % %<<cr>
nnoremap <silent> <F9> :!./%<<cr>
nnoremap <silent> <F10> :make! % %< && ./%<<cr>

"*************************************************************************
"" Configure Plugin

""vim-devicons
let g:webdevicons_enable_ctrlp = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

""nerdtree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
map <C-b> :NERDTreeToggle<CR>

""nerdcommenter
filetype plugin on
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

""vim-nerdtree-syntax-highlight
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeLimitedSyntax = 1

""vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

""ctrlp.vim
let g:ctrlp_formatline_func = 's:formatline(s:curtype() == "buf" ? v:val : WebDevIconsGetFileTypeSymbol(v:val) . " " . v:val) '
let g:ctrlp_match_window = 'top,order:ttb,max:15,results:15'
let g:ctrlp_follow_symlinks = 1

"" Tagbar
noremap <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"" syntastic
let g:syntastic_cpp_compiler_options = "-std=c++11"
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol=''
let g:syntastic_warning_symbol=''
let g:syntastic_style_error_symbol = ''
let g:syntastic_style_warning_symbol = ''
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

"" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

""youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

""vim-autoformat
noremap <F5> :Autoformat<CR>

