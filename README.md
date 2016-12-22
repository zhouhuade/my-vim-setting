# my-vim-setting

Loading [Contrib]/a11y/accessibility-menu.js
[TOC]

##mac 上安装vim 8.0

>http://www.sunzhongwei.com/install-vim8-on-mac-os

他会自动安装python

##.vimrc普通部分分析

```

let mapleader = ','    " leader按键

nnoremap <space> :

" nnoremap是normal模式下的映射

" vnoremap是visual模式下的映射 可视模式

nnoremap <c-p> :bp<cr>  " previous 切换到上一个文件

nnoremap <c-n> :bn<cr> " next 切换到下一个文件

nnoremap <leader>" ciw""<esc>P " "补全 “”

nnoremap <leader>' ciw''<esc>P " 补全 ''

nnoremap <leader>< ciw<><esc>P " 补全<>

nnoremap <leader>( ciw()<esc>P

nnoremap <leader>[ ciw[]<esc>P

nnoremap <leader>{ ciw{}<esc>P

vnoremap <leader>" di""<esc>P " 同上补全，可视化模式下进行，进入可视化模式 --->“v ，V ，crtl +v”

vnoremap <leader>' di''<esc>P

vnoremap <leader>< di<><esc>P

vnoremap <leader>( di()<esc>P

vnoremap <leader>[ di[]<esc>P

vnoremap <leader>{ di{}<esc>P

vnoremap * y/^R0<cr>

vnoremap # y?^R0<cr>

```

```

"insert mode keymap

在插入模式进行的左右快捷键，就可以不用按方向键了

inoremap <c-b> <left>  "b back 

inoremap <c-f> <right> "f forward

```

```

"ex mode keymap  命令行模式增强

cnoremap <c-d> <del> 

cnoremap <c-a> <Home> 到行首

cnoremap <c-b> <left>

cnoremap <c-f> <right>

cnoremap <c-x> <c-f>

```



##高亮单词 mark.vim

```

nnoremap <leader>c :MarkClear<cr>  "清除所有高亮

```

,m : 高亮或取消高亮当前光标下的单词 



##Tagbar 显示函数列表

```

nnoremap <silent> <leader>t :TagbarToggle<CR>

let g:tagbar_autofocus = 1

set updatetime=1000

```

用,t打开

## NERDTree 文件查看和管理工具

```

nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

nnoremap <silent> <leader>nf :NERDTreeFind<CR>

```

>Ctrl+ww——依次向后切换到下一个窗格中



##stack tag跳转

```

set tags=tags;

nmap <leader>j :tn<cr>  "上一个tag

nmap <leader>k :tp<cr> "下一个tag

" 实质上是和 hjkl左下上右有关

```

## 标签切换

多个标签间进行切换时向右切换**gt**，向左切换用**gT**

```

多个标签间进行切换时向右切换gt，向左切换用gT
在编辑的时候想增加一个标签就可以:tabnew filename
:tabc       关闭当前的tab
:tabo       关闭所有其他的tab
:tabs       查看所有打开的tab
:tabp      前一个
:tabn      后一个

```

##ctrlp 快速文件模糊搜索

```

let g:ctrlp_map = '<leader>p'

let g:ctrlp_by_filename = 1 

let g:ctrlp_working_path_mode = 'rw'

let g:ctrlp_root_markers = ["tags", "cscope.out"]

let g:ctrlp_clear_cache_on_exit = 0                                                                                            

set wildignore=*.o,*.obj,*.d,*/.git/*,*.a,*.so

nnoremap <leader>b :CtrlPBuffer<cr> "搜索当前被使用的所有文件

nnoremap <leader>u :CtrlPMRUFiles<cr> "搜索最近使用的文件

```

>",p 搜索工作目录下的所有文件

>[enter] : 打开选择的文件
>[c­j][c­k] : 选择文件
>[c­p][c­n] : 搜索上一个或下一个搜索历史

>ctrl + x 在当前窗口水平分屏打开文件
>ctrl + v 同上, 垂直分屏 

>ctrl + t 在标签中打开



##cscope 函数查找 类似SI

```

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

```

使用该插件前,请确认当前使用的服务器已安装cscope。 如果没有安装,可通过以下途径解决:

>1. apt­get install cscope 安装cscope 

>2. 拷贝附件的bin/cscope到~/bin/ 


>快捷键
>,fg : 查找到函数定义
>,fc : 查找到函数调用
>,fs : 查找到c符号(一般用于变量)
>,ft : 查找到该字符串
>,fa : 自定义查找(大小写敏感) 

往复跳转的指令：[ctrl-­o][ctrl-­i]





