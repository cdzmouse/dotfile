set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" " }
Bundle 'gmarik/vundle'
"
"   vundle 本身的安装：
"   git clone https://github.com/VundleVim/Vundle.vim.git vim/bundle/vundle
"
"  " github上的用户写的插件，使用这种用户名+repo名称的方式
"  " vimscripts的repo使用下面的格式，直接是插件名称
"
" 非github的插件，可以直接使用其git地址
" " Bundle 'git://git.wincent.com/command-t.git'
"
"" Brief help
" :BundleList          - list configured bundles
" " :BundleInstall(!)    - install(update) bundles
" " :BundleSearch(!) foo - search(or refresh cache first) for foo
" " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" "
" vundle主要就是上面这个四个命令，例如BundleInstall是全部重新安装，BundleInstall!则是更新
" " 一般安装插件的流程为，先BundleSearch一个插件，然后在列表中选中，按i安装
" " 安装完之后，在vimrc中，添加Bundle
" 'XXX'，使得bundle能够加载，这个插件，同时如果
" " 需要配置这个插件，也是在vimrc中设置即可
Bundle 'taglist.vim'
Bundle 'genutils'
Bundle 'winmanager'
Bundle 'c.vim'
Bundle 'snipMate'
Bundle 'https://github.com/Lokaltog/vim-powerline.git'
Bundle 'Pydiction'
Bundle 'SnippetComplete'
Bundle 'YankRing.vim'
Bundle 'a.vim'
Bundle 'omnicppcomplete'
Bundle 'bufexplorer.zip'
Bundle 'The-NERD-Commenter'
Bundle 'Mark'
Bundle 'DoxygenToolkit.vim'
Bundle 'https://github.com/kien/ctrlp.vim.git'
Bundle 'ack.vim'

let mapleader = ";"    " 比较习惯用;作为命令前缀，右手小拇指直接能按到
" 把空格键映射成:
nmap <space> :

" 快捷打开编辑vimrc文件的键盘绑定
map <silent> <leader>ee :e $HOME/.vimrc<cr>
autocmd! bufwritepost *.vimrc source $HOME/.vimrc


" ^z快速进入shell
"inoremap <leader>n <esc>

set nocompatible    " 关闭兼容模式
syntax enable       " 语法高亮
filetype on
filetype plugin on  " 文件类型插件
filetype indent on
filetype plugin indent on
set shortmess=atI   " 去掉欢迎界面
set autoindent
autocmd BufEnter * :syntax sync fromstart
set nu              " 显示行号
set showcmd         " 显示命令
set lz              " 当运行宏时，在命令执行完成之前，不重绘屏幕
set hid             " 可以在没有保存的情况下切换buffer
set backspace=eol,start,indent 
set whichwrap+=<,>,h,l " 退格键和方向键可以换行
set incsearch       " 增量式搜索
set nohlsearch
"set hlsearch        " 高亮搜索
set ignorecase      " 搜索时忽略大小写
set magic           " 额，自己:h magic吧，一行很难解释
set showmatch       " 显示匹配的括号
set nobackup        " 关闭备份
set nowb
set noswapfile      " 不使用swp文件，注意，错误退出后无法恢复
set lbr             " 在breakat字符处而不是最后一个字符处断行
set ai              " 自动缩进
set si              " 智能缩进
set cindent         " C/C++风格缩进
set wildmenu         
set nofen
set fdl=10
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  

" tab转化为4个字符
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" 不使用beep或flash 
set vb t_vb=

set background=dark
set t_Co=256
"colorscheme xoria256

set history=400  " vim记住的历史操作的数量，默认的是20
set autoread     " 当文件在外部被修改时，自动重新读取
set mouse=     " 在所有模式下都允许使用鼠标，还可以是n,v,i,c等

set encoding=utf8
set fileencodings=utf8,gb2312,gb18030,ucs-bom,latin1


" 状态栏
set laststatus=2
set t_Co=256
let g:Powerline_symbols='unicode'
set encoding=utf8

" 第80列往后加下划线
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

" 根据给定方向搜索当前光标下的单词，结合下面两个绑定使用
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'b'
        execute "normal ?" . l:pattern . "<cr>"
    else
        execute "normal /" . l:pattern . "<cr>"
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
" 用 */# 向 前/后 搜索光标下的单词
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" 在文件名上按gf时，在新的tab中打开
"map gf :tabnew <cfile><cr>

" 用c-j,k在buffer之间切换
nn <C-J> :bn<cr>
nn <C-K> :bp<cr>


" 恢复上次文件打开位置
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" 删除buffer时不关闭窗口
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction


" 快捷输入
" 自动完成括号和引号
inoremap <leader>1 ()<esc>:let leavechar=")"<cr>i
inoremap <leader>2 []<esc>:let leavechar="]"<cr>i
inoremap <leader>3 {}<esc>:let leavechar="}"<cr>i
inoremap <leader>4 {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap <leader>q ''<esc>:let leavechar="'"<cr>i
inoremap <leader>w ""<esc>:let leavechar='"'<cr>i


" 插件窗口的宽度，如TagList,NERD_tree等，自己设置
let s:PlugWinSize = 25

" OmniCppComplete.vim
" http://www.vim.org/scripts/script.php?script_id=1520
set completeopt=menu
let OmniCpp_ShowPrototypeInAbbr = 1 
let OmniCpp_DefaultNamespaces = ["std"]     " 逗号分割的字符串
let OmniCpp_MayCompleteScope = 1 
let OmniCpp_ShowPrototypeInAbbr = 0 
let OmniCpp_SelectFirstItem = 2 
" c-j自动补全，当补全菜单打开时，c-j,k上下选择
imap <expr> <c-j>      pumvisible()?"\<C-N>":"\<C-X><C-O>"
imap <expr> <c-k>      pumvisible()?"\<C-P>":"\<esc>"
" f:文件名补全，l:行补全，d:字典补全，]:tag补全
imap <C-]>             <C-X><C-]>
imap <C-F>             <C-X><C-F>
imap <C-D>             <C-X><C-D>
imap <C-L>             <C-X><C-L> 

" NERD_commenter.vim
" http://www.vim.org/scripts/script.php?script_id=1218
" Toggle单行注释/“性感”注释/注释到行尾/取消注释
map <leader>cc ,c<space>
map <leader>cs ,cs
map <leader>c$ ,c$
map <leader>cu ,cu


" DoxygenToolkit.vim
" http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_briefTag_pre="@brief  "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@return   \<enter>* @note \<enter>\<enter>"
let g:DoxygenToolkit_blockHeader=""
let g:DoxygenToolkit_blockFooter=""
let g:DoxygenToolkit_authorName="zhaoguitian"
let g:DoxygenToolkit_licenseTag="GPL 2.0"

let g:DoxygenToolkit_authorName="zhaoguitian, cdzmouse@gmail.com"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
map <leader>dox :Dox

" 更新ctags和cscope索引
" href: http://www.vimer.cn/2009/10/把vim打造成一个真正的ide2.html
" 稍作修改，提取出DeleteFile函数，修改ctags和cscope执行命令
map <F6> :call Do_CsTag()<cr>
function! Do_CsTag()
    let dir = getcwd()

    "先删除已有的tags和cscope文件，如果存在且无法删除，则报错。
    if ( DeleteFile(dir, "tags") ) 
        return 
    endif
    if ( DeleteFile(dir, "functions") ) 
        return 
    endif
    if ( DeleteFile(dir, "cscope.files") ) 
        return 
    endif
    if ( DeleteFile(dir, "cscope.out") ) 
        return 
    endif

    if(executable('ctags'))
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
        silent! execute "!ctags -R --c-types=f -f functions  *.c  ."
    endif
    if(executable('cscope') && has("cscope") )
        silent! execute "!find . -iname '*.[ch]' -o -name '*.cpp' > cscope.files"
        silent! execute "!find . -iname '*.py' -o -name '*.cpp' >> cscope.files"
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
    " 刷新屏幕
    execute "redr!"
endfunction

function! DeleteFile(dir, filename)
    if filereadable(a:filename)
        let ret = delete("./".a:filename)
        if (ret != 0)
            echohl WarningMsg | echo "Failed to delete ".a:filename | echohl None
            return 1
        else
            return 0
        endif
    endif
    return 0
endfunction


" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py exec ":call Set_Title()" 
""定义函数SetTitle，自动插入文件头 
function! Set_Title() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#########################################################################") 
		call append(line("."), "\# File Name: ".expand("%")) 
		call append(line(".")+1, "\# Author: zgt") 
		call append(line(".")+2, "\# mail: zhaoguitian@galaxywind.com") 
		call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "\#########################################################################") 
		call append(line(".")+5, "\#!/bin/bash") 
		call append(line(".")+6, "") 
	elseif &filetype == 'python'
		call setline(1,"#!/usr/bin/python2.7")
        call setline(2,"#coding:utf-8")
        call setline(3,"\"\"\"")
		call setline(4, "	 File Name: ".expand("%")) 
		call setline(5, "	 Author: zgt") 
		call setline(6, "	 Mail: zhaoguitian@galaxywind.com ") 
		call setline(7, "	 Created Time: ".strftime("%c")) 
		call setline(8, "     note: ") 
		call setline(9, "\"\"\"") 
		call setline(10, "import os,sys,io")
		call setline(11, "")
	else	
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: zgt") 
		call append(line(".")+2, "	> Mail: zhaoguitian@galaxywind.com ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "#include<stdlib.h>")
		call append(line(".")+8, "")
	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc 


" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
nnoremap <C-F2> :vert diffsplit 
"列出当前目录文件  
map <F3> :tabnew .<CR>  
"打开树状文件目录  
map <C-F3> \be  
"C，C++ 按F5编译运行
map <C-F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!java %<"
	elseif &filetype == 'sh'
		:!./%:q

	elseif &filetype == 'py'
		exec "!python %"
		exec "!python %<"
	endif
endfunc


filetype plugin on
autocmd FileType javascrīpt set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
                                                   
                                                   
"pydiction 1.2 python auto complete
filetype plugin on
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
" 映射全选+复制 ctrl+a
"defalut g:pydiction_menu_height == 10
"let g:pydiction_menu_height = 10 

"缓冲区捷命令
"打开缓冲区浏览器
map <leader>be :BufExplorer<cr>
"关闭当前缓冲
map <leader>bd :Bclose<cr>
map <leader>ex :Explore<cr>
map <leader>tl :Tlist<cr>



"cscope 快捷键配置
"nmap <C-x>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-x>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-x>c  :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-x>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-x>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-x>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-x>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-x>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"""""""""""""""""""""""""""""" 
" lookupfile setting
"""""""""""""""""""""""""""""" 
"let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
"let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
"let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
"let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
"let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
"if filereadable("./filenametags")                "设置tag文件的名字
"  let g:LookupFile_TagExpr = '"./filenametags"'
"endif
""映射LookupFile为,lk
"nmap <silent> <leader>lk :LUTags<cr>
"映射LUBufs为,ll
"nmap <silent> <leader>ll :LUBufs<cr>
"映射LUWalk为,lw
"nmap <silent> <leader>lw :LUWalk<cr>


