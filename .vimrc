set nu!
set et
set ts=4
set shiftwidth=4
set hlsearch
set nobackup
"set smartindent
colorscheme torte

set nocompatible
filetype off

set rtp+=/home/bill/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'VundleVim/Vundle.vim'

"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'

"Plugin 'suan/vim-instant-markdown'
"let g:mkdp_path_to_chrome="google-chrome"
"let g:instant_markdown_autostart = 0

"Plugin 'iamcco/markdown-preview.vim'

Plugin 'mattn/emmet-vim'
"let g:user_emmet_expandabbr_key = '<Tab>'
"let g:user_emmet_settings = {'indentation': '    '}
"let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Bundle 'jiangmiao/auto-pairs'


"Plugin 'maksimr/vim-jsbeautify'

Bundle 'pangloss/vim-javascript'

Plugin 'Valloric/YouCompleteMe' 

Plugin 'marijnh/tern_for_vim'


Bundle 'vim-syntastic/syntastic'

"Bundle 'tpope/vim-surround'

Plugin 'scrooloose/nerdtree'
" nerdTree快捷键映射
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" map <F2> :NERDTreeToggle<CR>

Bundle 'majutsushi/tagbar'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'terryma/vim-multiple-cursors'

" 它可以让tmux的状态栏跟vim主题颜色一致
" Plugin 'git://github.com/edkolev/tmuxline.vim.git'



Plugin 'mattn/webapi-vim'


call vundle#end()

filetype plugin indent on

let g:ycm_semantic_triggers = {'css': [ 're!^\s{4}', 're!:\s+' ],}


set suffixes=.txt,.md,.js,.css


"set omnifunc=javascriptcomplete#CompleteJS

" 修改 ( 和 [ 的映射
" imap ( ()<ESC>i
imap { {}<ESC>i<CR><ESC>O



" 背景色透明
"hi Normal ctermfg=252 ctermbg=none


" 自定义 emmet.vim 快捷键
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.vim/.snippets_custom.json')), "\n"))
