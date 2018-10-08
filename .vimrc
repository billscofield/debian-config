set nu
set et
set ts=4
set shiftwidth=4
set hlsearch
"set smartindent

" 突出显示光标的行和列
set cursorline
set cursorcolumn

" 配色方案
" https://github.com/tomasr/molokai
colorscheme molokai

inoremap <C-s> <Esc>

"禁止生成临时文件
set nobackup
set noswapfile

" 八进制当成十进制
" 缺省为 "octal,hex"
" alpha:单个字母会被递增和递减。这可以用于使用字母索引的列表a)、b)，等等。
set nrformats =


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

Bundle 'jiangmiao/auto-pairs'


"Plugin 'maksimr/vim-jsbeautify'

Bundle 'pangloss/vim-javascript'

Plugin 'Valloric/YouCompleteMe' 
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'

Plugin 'marijnh/tern_for_vim'


Bundle 'vim-syntastic/syntastic'


" ---


"Bundle 'tpope/vim-surround'

" ---

Plugin 'scrooloose/nerdtree'
" nerdTree快捷键映射
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1

" map a specific key or shortcut to open NERDTree
nnoremap <F2> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

Plugin 'Xuyuanp/nerdtree-git-plugin'
" ---

Bundle 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1


Plugin 'nathanaelkane/vim-indent-guides'
" to have indent guides enabled by default
let g:indent_guides_enable_on_vim_startup = 1
" 从第2层开始可视化显示缩进
let g:indent_guides_start_level=1
" 色块宽度
let g:indent_guides_guide_size=1



Bundle 'majutsushi/tagbar'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'terryma/vim-multiple-cursors'

" 它可以让tmux的状态栏跟vim主题颜色一致
" Plugin 'git://github.com/edkolev/tmuxline.vim.git'



Plugin 'mattn/webapi-vim'



" Vue
Plugin 'posva/vim-vue'
" autocmd FileType vue syntax sync fromstart
" autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" 成对标签之间的跳转
Bundle 'vim-scripts/matchit.zip'

call vundle#end()

filetype plugin indent on

let g:ycm_semantic_triggers = {'css': [ 're!^\s{4}', 're!:\s+' ],}

" 支持的文件跳转扩展名
set suffixes=.txt,.md,.js,.css,.vue


"set omnifunc=javascriptcomplete#CompleteJS


" 修改 ( 和 [ 的映射
" inoremap ( ()<ESC>i
" inoremap { {}<ESC>i<CR><ESC>O
" 括号补全
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap { {}<ESC>i
" inoremap ' ''<ESC>i
" inoremap " ""<ESC>i
" inoremap < <><ESC>i


" 背景色透明
"hi Normal ctermfg=252 ctermbg=none

" 输入的命令显示出来，看的清楚些  
set showcmd         


" 允许折叠  
set foldenable      
" 手动折叠  
set foldmethod=manual   




" leader 键
let g:mapleader=";"

" 我的 .vimrc 文件映射
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source 我的 .vimrc 配置文件
nnoremap <leader>sv :source $MYVIMRC<cr>

" 为标签内的文本快速添加双引号
" nnoremap <leader>" vit<esc>a"<esc>hbi"<esc>le
"
" 重新加载当前文件
nnoremap <leader>r :e %<cr>

" 让 esc 不在起作用
" inoremap <esc> <nop>




" 自定义 emmet.vim 快捷键
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))


let g:ycm_python_binary_path = 'python3'

" 透明背景
" hi Normal ctermfg=252 ctermbg=none
