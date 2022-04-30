" how to install bundle;


" git clone https://github.com/VundleVim/Vundle.vim.git  ~/.vim/bundle/Vundle.vim;


set nu
set relativenumber

set expandtab
set tabstop=4
set shiftwidth=4
" 不要设置 softtabstop, 这样导致 space 和 tab 混用，有些费解, 还容易出 bug

"set smartindent
set autoindent

set ignorecase


set nobackup
set noswapfile
set nrformats=


"filetype off
filetype plugin indent on


"set nocompatible


syntax on


" 在插入模式下使用系统粘贴命令时的行为改变
set pastetoggle=<f5>


" 突出显示光标的行和列
set cursorline
"set cursorcolumn
"
"
"set listchars=eol:¬,tab:⍿·
set listchars=eol:¬,tab:├─
set list


set hlsearch
" highlight search color
" hi Search term=standout ctermfg=0 ctermbg=3
set incsearch


set wildmenu
set wildmode=full

" 缓冲区列表，参数列表
set hidden


"inoremap ,, <ESC>la
"inoremap .. <ESC>A;


set suffixesadd+=.py,.c,.cpp


" what are the differences? vim 中silent 调用外部命令后，屏幕空白，为啥呢
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
"nnoremap  <C-l> :<C-u>nohlsearch<CR><C-l>


" 中文断行
"set formatoptions=tcqlnMm
"
" You can see them by :h fo-table
"
" m       Also break at a multi-byte character above 255.  This is useful for
"         Asian text where every character is a word on its own.
"
" M       When joining lines, don't insert a space before or after a
"         multi-byte
"         character.  Overrules the 'B' flag.
"
" why it doesn't work? every time i open a file, the of is "tcq" again
set formatoptions+=mM


" 配色方案
" https://github.com/tomasr/molokai
"colorscheme molokai    
colorscheme default
hi Search term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow


inoremap <Cap> <Esc>


function HeaderSh()
    call setline(1, "#!/usr/bin/env bash")
    call append(1, "# Author: Bill Scofield")
    call append(2, "# Ctime : ".strftime('%Y-%m-%d',localtime()))
    call append(3, "# Description:\t")
    normal G
    normal o
    normal o
endf
autocmd bufnewfile *.sh call HeaderSh()


function HeaderPython()
    call setline(1, "#!/usr/bin/env python3")
    call append(1, "#coding:utf-8")
    call append(2, "# Author: Bill Scofield")
    call append(3, "# Ctime: ".strftime('%Y-%m-%d',localtime()))
    call append(4, "# Description:\t")
    normal G
    normal o
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()


set rtp+=/root/.vim/bundle/Vundle.vim


" There is package in debian called vim-scripts collected some common vim scripts usefull
" apt-cache show vim-scripts








call vundle#begin()
"Bundle 'VundleVim/Vundle.vim'
Bundle 'https://gitee.com/billscofield/vundle.vim.git'


" align from vim-scripts


" 实现markdown 自动预览
" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'


"Plugin 'suan/vim-instant-markdown'
"let g:mkdp_path_to_chrome="google-chrome"
"let g:instant_markdown_autostart = 0


"Plugin 'iamcco/markdown-preview.vim'

"----

"Plugin 'mattn/emmet-vim'
Bundle 'https://gitee.com/billscofield/emmet-vim'
"let g:user_emmet_expandabbr_key = '<Tab>'
"let g:user_emmet_settings = {'indentation': '    '}
"let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


"Bundle 'jiangmiao/auto-pairs'
Bundle 'https://gitee.com/billscofield/auto-pairs'


"Plugin 'maksimr/vim-jsbeautify'


"Bundle 'pangloss/vim-javascript'
Bundle 'https://gitee.com/billscofield/vim-javascript'


"gtk
"Bundle 'https://gitee.com/billscofield/gtk-vim-syntax'

let g:devhelpSearch=1
let g:devhelpAssistant=1

set tags+=/root/.vim/tags/gtk3
set tags+=/root/.vim/tags/ctags


"Plugin 'ycm-core/YouCompleteMe' 
Bundle 'https://gitee.com/billscofield/YouCompleteMe'
set completeopt=longest,menu
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_global_ycm_extra_conf='/root/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:always_populate_location_list = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
map <leader>gd:YcmCompleter GoToDefinitionElseDeclaration<CR>



"Plugin 'jsfaint/gen_tags.vim'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'



Plugin 'https://gitee.com/billscofield/phpcomplete.vim.git'


"Plugin 'marijnh/tern_for_vim'
Bundle 'https://gitee.com/billscofield/tern_for_vim'


"Bundle 'vim-syntastic/syntastic'
Bundle 'https://gitee.com/billscofield/syntastic'


"Bundle 'tpope/vim-surround'
Bundle 'https://gitee.com/billscofield/vim-surround.git'


"Plugin 'scrooloose/nerdtree'
Bundle 'https://gitee.com/billscofield/nerdtree'
let g:NERDTree_title="[NERDTree]" 
" nerdTree快捷键映射
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" open a NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree

" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']


" map a specific key or shortcut to open NERDTree
nnoremap <F2> :NERDTreeToggle<CR>


" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" 启动NERDTree时显示书签
let NERDTreeShowBookmarks = 1




"Plugin 'Xuyuanp/nerdtree-git-plugin'
Bundle 'https://gitee.com/billscofield/nerdtree-git-plugin'


"Bundle 'scrooloose/nerdcommenter'
Bundle 'https://gitee.com/billscofield/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1


" vim plugin for golang
"Plugin 'fatih/vim-go'
Bundle 'https://gitee.com/billscofield/vim-go'
let g:go_gopls_enabled = 0


"Plugin 'Blackrush/vim-gocode'


"缩进插件1
"Plugin 'nathanaelkane/vim-indent-guides'
Bundle 'https://gitee.com/billscofield/vim-indent-guides'
" to have indent guides enabled by default
let g:indent_guides_enable_on_vim_startup = 1
" 从第2层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" # 设定基数列和偶数列的缩进线颜色
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=white ctermbg=white
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=red ctermbg=red


"Plugin 'thaerkh/vim-indentguides'
"let g:indentguides_spacechar = '┆'
"let g:indentguides_tabchar = '|'


"缩进线2
"Bundle 'Yggdroot/indentLine'
"let g:indentLine_color_term = 2


" tagbar begin
"Bundle 'majutsushi/tagbar'
Bundle 'https://gitee.com/billscofield/tagbar'
"nmap <Leader>tb :TagbarToggle<CR> 不管用啊
nmap <F8> :TagbarToggle<CR>
" 启动时自动focus
let g:tagbar_autofocus = 1
"开启自动预览(随着光标在标签上的移动，顶部会出现一个实时的预览窗口)
"let g:tagbar_autopreview = 1
"关闭排序,即按标签本身在文件中的位置排序
let g:tagbar_sort = 0
" 能够和NERDTree在同一个列中
let g:tagbar_vertical = 25

"Possible values are:
"0: Don't show any line numbers.
"1: Show absolute line numbers.
"2: Show relative line numbers.
"-1: Use the global line number settings.

let g:tagbar_show_linenumbers = 2


"Plugin 'vim-airline/vim-airline'
Bundle 'https://gitee.com/billscofiled/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Bundle 'https://gitee.com/billscofield/vim-airline-themes'
"Plugin 'terryma/vim-multiple-cursors'
Bundle 'https://gitee.com/billscofield/vim-multiple-cursors'



" 它可以让tmux的状态栏跟vim主题颜色一致
" Plugin 'git://github.com/edkolev/tmuxline.vim.git'


"Plugin 'mattn/webapi-vim'
Bundle 'https://gitee.com/billscofield/webapi-vim'


" Vue
" Plugin 'posva/vim-vue'
" autocmd FileType vue syntax sync fromstart
" autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css


" 成对标签之间的跳转
"Bundle 'vim-scripts/matchit.zip'
Bundle 'https://gitee.com/billscofield/matchit.zip'


" jinja
"Bundle 'https://gitee.com/billscofield/vim-jinja'


" jinja2
Bundle 'https://gitee.com/billscofield/Vim-Jinja2-Syntax'


" simpylfold python代码折叠
"Bundle 'tmhedberg/SimpylFold'
Bundle 'https://gitee.com/billscofield/SimpylFold'
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_import = 0


"Bundle 'nvie/vim-flake8'
"需要首先pip install autopep8
"Bundle 'tell-k/vim-autopep8'
Bundle 'https://gitee.com/billscofield/vim-autopep8'

"Bundle 'Lokaltog/vim-easymotion'
"map <Leader><Leader>l <Plug>(easymotion-lineforward)
"map <Leader><Leader>j <Plug>(easymotion-j)
"map <Leader><Leader>k <Plug>(easymotion-k)
"map <Leader><Leader>h <Plug>(easymotion-linebackward)


"Plugin 'jlanzarotta/bufexplorer'
Bundle 'https://gitee.com/billscofield/bufexplorer'


" coc.nvim补全
"Plugin 'neoclide/coc.nvim'


Bundle 'https://gitee.com/billscofield/taglist.git'


" gitgutter
Bundle 'https://gitee.com/billscofield/vim-gitgutter.git'


" git -> fugitive
Bundle 'https://gitee.com/billscofield/vim-fugitive.git'
call vundle#end()





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


" 重新加载当前文件
nnoremap <leader>r :e %<cr>


" 让 esc 不在起作用
" inoremap <esc> <nop>


" 自定义 emmet.vim 快捷键
"let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n")) #bill

""" 需要更改
let g:ycm_python_binary_path = 'python3'
"let g:ycm_python_binary_path = '/root/practise/bin/python'

" 透明背景
" hi Normal ctermfg=252 ctermbg=none


"要支持PEP8风格的缩进，请在 .vimrc 文件中添加下面的代码：
"autocmd FileType python exec ":call Pythonset()"
"func Pythonset()
"    set tabstop=8
"    set softtabstop=4
"    set shiftwidth=4
"    set textwidth=80
"    set expandtab
"    set autoindent
"    set fileformat=unix
"endfunc




" taglist
"默认打开taglist
let Tlist_Auto_Open = 1
let Tlist_Ctags_Cmd = '/usr/bin/ctags'

" 不同时显示多个文件的 tag, 只显示当前文件的
let Tlist_Show_One_File = 1 
let Tlist_Exit_OnlyWindow = 1

"当剩余的窗口都不是文件编辑窗口时，自动退出vim
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif


" ctags 和 taglist 自动更新
function! UpdateCtags()
    let curdir=getcwd()
    while !filereadable("./tags")
        cd ..
        if getcwd() == "/"
            break
        endif
    endwhile
    if filewritable("./tags")
        !ctags -R --file-scope=yes --langmap=c:+.h --languages=c,c++,Python --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q
        :TlistUpdate
    endif
    execute ":cd " . curdir
endfunction

autocmd BufWritePost *.c,*.h,*.cpp,*.py call UpdateCtags()


set tags+=tags;


"set tags+=~/.vim/tags/python3.7.tags
"set tags+=~/.vim/tags/tags
set tags+=/root/.pyenv/versions/3.9.0/lib/python3.9/site-packages/flask/tags

" nump matplotlib
set tags+=/root/.pyenv/versions/3.9.0/envs/data/lib/python3.9/site-packages/tags

set tags+=~/.vim/tags/python3.9.tags
set tags+=/root/.pyenv/versions/3.9.7/envs/flask/lib/python3.9/site-packages/tags
set tags+=/root/.pyenv/versions/3.9.7/envs/datamine/lib/python3.9/site-packages/tags
" 系统函数库 在 debianinit.sh 中有命令
set tags+=~/.vim/tags/systags


"autocmd FileType python set omnifunc=pythoncomplete#Complete


nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

iabbrev ssig ------------- <cr>Bill Scofield<cr>billscofield@126.com


if exists("did_load_filetypes")
    finish
endif
augroup filetype detect
    au! BufRead,BufNewFile *.tpp  setfiletype tpp
augroup END
set encoding=utf-8
