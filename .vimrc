" install bundle
" git clone https://github.com/VundleVim/Vundle.vim.git  ~/.vim/bundle/Vundle.vim;


" tells Vim not to load the matchit plugin
let g:loaded_matchit = 1


" colors 配色方案
"hi clear
" https://github.com/tomasr/molokai

" /usr/local/vim9/share/vim/vim90/colors/default.vim
colorscheme pablo
"
" 好像看起来 setbackground=dark/light 不影响 coc.nvim 的 pmenu
"set background=dark
"hi! Pmenu ctermfg=Red ctermbg=193 cterm=NONE guifg=#e1e1e1 guibg=#383838 gui=NONE


" 透明背景
" hi Normal ctermfg=252 ctermbg=none


"autocmd ColorScheme * hi Pmenu ctermfg=160 ctermbg=157 cterm=NONE
"{{{
augroup CustomPmenuHighlight
    autocmd!
    "autocmd ColorScheme * hi Pmenu ctermfg=160 ctermbg=157 cterm=NONE

    " pmenu color
    autocmd ColorScheme * hi CocFloating ctermfg=red ctermbg=none
    " 比 Pmenu 的优先级更好
    "autocmd ColorScheme * hi Pmenu ctermfg=160 ctermbg=235 cterm=NONE

    " autocmd ColorScheme * hi CocFloatDividingLine ctermfg=yellow ctermbg=none

    " 提示的函数参数定义的颜色
    autocmd ColorScheme * hi CocFloatActive  ctermfg=yellow ctermbg=none

    " color of comments
    autocmd ColorScheme * hi Comment  ctermfg=33 ctermbg=none
augroup END
"}}}




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
    call setline(1, "#! /usr/bin/env python3")
    call append(1, "# coding:utf-8")
    call append(2, "# Author: Bill Scofield")
    call append(3, "# Ctime: ".strftime('%Y-%m-%d',localtime()))
    call append(4, "'''")
    call append(5, "Description:")
    call append(6, "'''")
    call append(7, "")
    normal G
    normal o
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()


set rtp+=/root/.vim/bundle/Vundle.vim


" There is package in debian called vim-scripts collected some common vim scripts usefull
" apt-cache show vim-scripts




set updatetime=100








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

" markdown-preview
" {{{
Bundle 'https://gitee.com/billscofield/markdown-preview.nvim.git'
let g:mkdp_auto_start = 1
" :call mkdp#util#install()
" nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
" imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
" nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
" imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode
" }}}


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


" gtk
"{{{
"Bundle 'https://gitee.com/billscofield/gtk-vim-syntax'
"let g:devhelpSearch=1
"let g:devhelpAssistant=1
"set tags+=/root/.vim/tags/gtk3
"}}}

set tags+=/root/.vim/tags/ctags


" youcompleteme
" {{{
"Plugin 'ycm-core/YouCompleteMe' 
"Bundle 'https://gitee.com/billscofield/YouCompleteMe'
"set completeopt=longest,menu
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_global_ycm_extra_conf='/root/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0
"let g:always_populate_location_list = 1
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_complete_in_comments = 1
"map <leader>gd:YcmCompleter GoToDefinitionElseDeclaration<CR>
" }}}


"hi! Pmenu ctermfg=7 ctermbg=236
"hi! PmenuSel ctermfg=white ctermbg=7
"hi CocFloating ctermfg=black ctermbg=240
" 浮动窗口的前景色和背景色
"hi! CocFloating ctermfg=white  ctermbg=240

"hi CocHighlightText ctermfg=red ctermbg=226
"hi CocHintFloat ctermfg=red ctermbg=yellow

" coc.nvim
" {{{
Bundle 'neoclide/coc.nvim'
" coc.begin
" 配置 tabl 键补全
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_node_path = '/opt/node/bin/node'
"let g:coc_package_registry = '[https://registry.npmjs.org]'

"let g:coc_global_extensions = ['coc-pyright', 'coc-pyright-mypy', 'coc-pyright-pylance', 'coc-pyright-typing', 'coc-pyside6']

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


inoremap <silent><expr> <c-space> coc#refresh()
" }}}


" ale
" {{{
"Bundle 'https://gitee.com/billscofield/ale.git'
""let g:ale_linters = { 'python': ['pylint'] }
"let g:ale_python_pylint_options = '--rcfile=pylintrc'
" }}}


" ABORTED - syntastic
" {{{
" "This project is no longer maintained. If you need a syntax checking plugin
" for Vim you might be interested in Syntastic's spiritual succesor, ALE. 
" Bundle 'https://gitee.com/billscofield/syntastic'
" }}}


" vim-prettier
" {{{
Bundle 'prettier/vim-prettier'
let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue PrettierAsync
" }}}


"Plugin 'jsfaint/gen_tags.vim'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'


" php
" {{{
"Plugin 'https://gitee.com/billscofield/phpcomplete.vim.git'

"CompletePHP
"autocmd FileType php set omnifunc=phpcomplete
" }}}


" tern_for_vim
" {{{
"This is a Vim plugin that provides Tern-based JavaScript editing support.
"Tern is a stand-alone code-analysis engine for JavaScript.
"Bundle 'https://gitee.com/billscofield/tern_for_vim'
" }}}


" MatchParen color
" {{{
"hi MatchParen cterm=bold ctermbg=green ctermfg=red
" }}}


" nerdtree
" {{{
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
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" 启动NERDTree时显示书签
let NERDTreeShowBookmarks = 1
"}}}


" fzf.vim
" {{{
Bundle 'https://gitee.com/billscofield/fzf.vim.git'
" }}}


" nerdtree-git-plugin
" {{{
"Plugin 'Xuyuanp/nerdtree-git-plugin'
Bundle 'https://gitee.com/billscofield/nerdtree-git-plugin'
" }}}


" nerdcommenter
" {{{
"Bundle 'scrooloose/nerdcommenter'
Bundle 'https://gitee.com/billscofield/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
"}}}


" vim plugin for golang
" {{{
"Plugin 'fatih/vim-go'
Bundle 'https://gitee.com/billscofield/vim-go'
let g:go_gopls_enabled = 0
" }}}


"Plugin 'Blackrush/vim-gocode'


"缩进插件1
"Plugin 'nathanaelkane/vim-indent-guides'
"1Bundle 'https://gitee.com/billscofield/vim-indent-guides'
" to have indent guides enabled by default
"#1let g:indent_guides_enable_on_vim_startup = 1
" 从第2层开始可视化显示缩进
"#1let g:indent_guides_start_level=2
" 色块宽度
"#1let g:indent_guides_guide_size=1
" # 设定基数列和偶数列的缩进线颜色
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=white ctermbg=white
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=red ctermbg=red


"Plugin 'thaerkh/vim-indentguides'
"let g:indentguides_spacechar = '┆'
"let g:indentguides_tabchar = '|'


" 缩进线 indentLine
" {{{
Bundle 'Yggdroot/indentLine'
let g:indent_guides_guide_size = 1
"let g:indentLine_color_term = 2
let g:indent_guides_start_level = 2
" }}}


"Bundle 'https://gitee.com/billscofield/vim-polyglot'


" tagbar
" {{{
"Bundle 'majutsushi/tagbar'
Bundle 'https://gitee.com/billscofield/tagbar'
"nmap <Leader>tb :TagbarToggle<CR> 不管用啊
nmap <F8> :TagbarToggle<CR>
"开启自动预览(随着光标在标签上的移动，顶部会出现一个实时的预览窗口)
"let g:tagbar_autopreview = 1
"关闭排序,即按标签本身在文件中的位置排序
let g:tagbar_sort = 0

"let g:tagbar_position = 'botright vertical'

" 启动时自动focus
let g:tagbar_autofocus = 1

"Possible values are:
"0: Don't show any line numbers.
"1: Show absolute line numbers.
"2: Show relative line numbers.
"-1: Use the global line number settings.
"
"let g:tagbar_position = 'botright vertical"

let g:tagbar_show_linenumbers = 2"}}}
"autocmd BufNew,BufRead,BufEnter * TagbarOpen
"autocmd FileType python,c,cpp TagbarOpen
"}}}



"autocmd VimLeave * if exists('t:tagbar') | call tagbar#close() | endif
"autocmd VimLeavePre *  TagbarClose

" close vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



" auto close buffers of tagbar or nerdtree when they are the only buffers
" here are problems left
" {{{
"function! CloseVimIfOnlyTagbarLeft()"{{{
"    if len(filter(range(1, winnr('$')), 'bufname(winbufnr(v:val)) =~# "^__Tagbar_"')) == winnr('$') - 1
"        quit
"    endif
"
"    if len(filter(range(1, winnr('$')), 'bufname(winbufnr(v:val)) =~# "NERD_tree_"')) == winnr('$') - 1
"        quit
"    endif
"
"    "let tagbar_or_nerdtree_windows = filter(range(1, winnr('$')), 'bufname(winbufnr(v:val)) =~# "^__Tagbar_" || bufname(winbufnr(v:val)) =~# "NERD_tree_"')
"
"    "if len(filter(range(1, bufnr('$')), 'buflisted(v:val')) == 2 
"    "    let filetype = getbufvar(buf, '&filetype')
"    "    if filetype == 'nerdtree' || filetype == 'tagbar'
"    "        execute 'bdelete' buf
"    "    endif
"    "endif
"
"endfunction
"
"autocmd BufWinLeave * call CloseVimIfOnlyTagbarLeft()
" }}}}}}


" Bundle 'https://gitee.com/billscofield/taglist.git'
" taglist is not familiar with chinese



"Plugin 'vim-airline/vim-airline'
Bundle 'https://gitee.com/billscofiled/vim-airline'
" Automatically displays all buffers when there's only one tab open. 在最上边
" 显示buffer
"let g:airline#extensions#tabline#enabled = 1




"Plugin 'vim-airline/vim-airline-themes'
Bundle 'https://gitee.com/billscofield/vim-airline-themes'


"Plugin 'terryma/vim-multiple-cursors'
Bundle 'https://gitee.com/billscofield/vim-multiple-cursors'


" 它可以让tmux的状态栏跟vim主题颜色一致
" Plugin 'git://github.com/edkolev/tmuxline.vim.git'


" webapi-vim
" {{{
"Plugin 'mattn/webapi-vim'
"Bundle 'https://gitee.com/billscofield/webapi-vim'
"}}}


" Vue
" Plugin 'posva/vim-vue'
" autocmd FileType vue syntax sync fromstart
" autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css


Bundle 'andymass/vim-matchup'
"To enable match highlighting at |startup|, default enabled
let g:matchup_matchparen_enabled = 1
" It will ignore the if and else if because they are not defined in vim's C file type plugin.


" matchit 成对标签之间的跳转
" {{{
"Bundle 'vim-scripts/matchit.zip'
"let b:match_ignorecase = 1
" 匹配 begin 和 end 关键字
"let b:match_words='\<begin\>:\<end\>'
"let b:match_words='\<begin\>:\<end\>,'
"    \ . '\<while\>:\<continue\>:<break\>:\<endwhile\>,'
"    \ . '\<if\>:\<elseif\>:<else\>,'
"    \ . '\<module\>:\<endmodule\>,'
"    \ . '\<task\>:\<endtask\>,'
"    \ . '\<function\>:\<endfunction\>,'
"    \ . '\<program\>:\<endprogram\>'
"Bundle 'https://gitee.com/billscofield/matchit.zip'
"matchit 插件是vim默认自带的，但是不安装。安装方法可以在vim 的help里查看：:
"help matchit-install
" }}}


" vim-surround
" {{{
" Surround.vim is all about 'surroundings': parentheses, brackets, quotes, XML
" tags, and more. The plugin provides mappings to easily delete, change and
" add such surroundings in pairs.
Bundle 'https://gitee.com/billscofield/vim-surround.git'
" }}}


" jinja2
" {{{
Bundle 'https://gitee.com/billscofield/Vim-Jinja2-Syntax'
" }}}


"Bundle 'https://gitee.com/billscofield/vim-jinja'


" simpylfold python代码折叠
"Bundle 'tmhedberg/SimpylFold'
"Bundle 'https://gitee.com/billscofield/SimpylFold'
"let g:SimpylFold_docstring_preview = 1
"let g:SimpylFold_fold_import = 0


" 保存折叠
autocmd BufWinLeave *.vim mkview
autocmd BufWinEnter *.vim silent loadview
"保存在 ~/.vim/view


"Bundle 'nvie/vim-flake8
"{{{
"需要首先pip install autopep8
"Bundle 'tell-k/vim-autopep8'
Bundle 'https://gitee.com/billscofield/vim-autopep8'
"}}}


"Bundle 'Lokaltog/vim-easymotion'
"map <Leader><Leader>l <Plug>(easymotion-lineforward)
"map <Leader><Leader>j <Plug>(easymotion-j)
"map <Leader><Leader>k <Plug>(easymotion-k)
"map <Leader><Leader>h <Plug>(easymotion-linebackward)


"Plugin 'jlanzarotta/bufexplorer'
Bundle 'https://gitee.com/billscofield/bufexplorer'


" gitgutter
Bundle 'https://gitee.com/billscofield/vim-gitgutter.git'


" git -> fugitive
Bundle 'https://gitee.com/billscofield/vim-fugitive.git'


" solidity
Bundle 'https://gitee.com/billscofield/vim-solidity.git'


" ai codeium
" {{{
Bundle 'https://github.com/Exafunction/codeium.vim.git'
imap <C-]>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-Down>   <Cmd>call codeium#Clear()<CR>
let g:airline_section_z='{…}:%3{codeium#GetStatusString()}'

" Codeium's default keybindings can be disabled by setting
" let g:codeium_disable_bindings = 1
" }}}


" 翻译
" {{{
Bundle 'https://gitee.com/billscofield/vim-translator.git'
let g:translator_default_engines = 'bing'
" 光标放在需要的单词上, 
" :Translate   这个是在嘴下边显示翻译的内容
" :TranslateW  这个是弹出一个窗口显示翻译内容
" 为什么映射不行呢???
" }}}


" 总是将vim-devicons作为最后一个插件加载
Bundle 'https://gitee.com/billscofield/vim-devicons.git'
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


" 输入的命令显示出来，看的清楚些
set showcmd         


" 折叠
" {{{
set foldenable
" 手动折叠
set foldmethod=syntax


"augroup vimrc
"    au BufReadPre * setlocal foldmethod=indent
"    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END
"
"
"augroup vimfiles
"    autocmd!
"    autocmd BufRead,BufNewFile *.vim  setlocal foldmethod=marker
"augroup END

augroup vimfiles
    autocmd!
    autocmd BufRead,BufNewFile *.vimrc setlocal foldmethod=marker
    autocmd BufWritePre,FileWritePre *.vimrc execute 'mkview! ' . expand('%:p') . '.view'
    autocmd BufRead *.vimrc execute 'silent! loadview ' . expand('%:p') . '.view'
augroup END

augroup vimrc
    autocmd!
    autocmd BufReadPre * if expand('%:e') != 'vimrc' | setlocal foldmethod=indent | endif
    "autocmd BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
    " fdm 是不能共存的，但是如果使用了 tagbar fdm=indent 就会保留，并且最后会
    " 设置 fdm=manual, 奇怪
augroup END

" }}}


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
