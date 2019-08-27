set nocompatible              " 去除VI一致性,必须要添加
filetype off                  " 必须要添加
syntax on
syntax enable
set t_Co=256
set nu
"colorscheme molokai
set backspace=indent,eol,start
set tags=tags;
set autochdir
set hlsearch

" leader
let mapleader = ","
let g:mapleader = ","

map <F9> :!sh /home/xiaoju/code/cscope.sh<CR>

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'
"Plugin 'tpope/vim-fugitive'
" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略
"Plugin 'L9'
" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'
"Plugin 'git://git.wincent.com/command-t.git'
" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
"Plugin 'file:///home/gmarik/path/to/plugin'
" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
"Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'taglist.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'sfcuboy/phpcheck.vim'

" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on


map <leader>t :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=45
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" }}}
let g:NERDTreeNodeDelimiter = "\u00a0"
" 显示书签列表
let NERDTreeShowBookmarks=1
" vim不指定具体文件打开是，自动使用nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree |endif
" 当vim打开一个目录时，nerdtree自动使用
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) &&
"!exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" 当vim中没有其他文件，值剩下nerdtree的时候，自动关闭窗口
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <F3> :NERDTree<CR>

""DoxygenToolkit
let g:DoxygenToolkit_commentType = "php"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:DoxygenToolkit_briefTag_post = ""
let g:DoxygenToolkit_templateParamTag_pre = "@tparam\t"
let g:DoxygenToolkit_paramTag_pre = "@param\tstring\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_throwTag_pre = "@throw\t"
let g:DoxygenToolkit_fileTag = "@script\t"
let g:DoxygenToolkit_dateTag = "@modify\t"
let g:DoxygenToolkit_authorTag = "@author\t"
let g:DoxygenToolkit_versionTag = "@version\t"
let g:DoxygenToolkit_versionString = "1.0.0"
let g:DoxygenToolkit_blockTag = "@name\t"
let g:DoxygenToolkit_classTag = "@class\t"
let g:DoxygenToolkit_authorName = "liyanjing<liyanjing@didiglobal.com>"
let g:doxygen_enhanced_color = 1
nmap ,hh :DoxAuthor<CR><ESC>k8==j$a
nmap ,ff :Dox<CR><ESC>k8==j$a<TAB>
nmap ,da :DoxAuthor<CR><ESC>k8==
nmap ,db :DoxBlock<CR><ESC>k8==


let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1           "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28               "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1         "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window=1        "在右侧窗口中显示taglist窗口
"let Tlist_Use_Left_Windo =1
map <leader>l :Tlist<CR>


let g:airline_theme="luna"
"这个是安装字体后 必须设置此项"
"let g:airline_theme="kolor"
let g:airline_powerline_fonts = 1
set laststatus=2  "永远显示状态栏
set t_Co=256      "在windows中用xshell连接打开vim可以显示色彩
"打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

" 关闭状态显示空白符号计数,这个对我用处不大"
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'


let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'  "设置全局配置文件的路径
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
let g:ycm_confirm_extra_conf=0  " 打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_key_invoke_completion = '<C-a>' " ctrl + a 触发补全
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)


let g:PHP_SYNTAX_CHECK_BIN = '~/php7/bin/php'
