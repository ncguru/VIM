
"=========================================================================
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim

source $VIMRUNTIME/../vimfiles/plugin/cscope_maps.vim
"source $VIMRUNTIME/../vimfiles/ftplugin/java_vis.vim
"source $VIMRUNTIME/../vimfiles/ftplugin/cs_vis.vim
"source $VIMRUNTIME/../vimfiles/ftplugin/html_vis.vim
"source $VIMRUNTIME/../vimfiles/ftplugin/xml_vis.vim
source $VIMRUNTIME/../vimfiles/plugin/EasyGrep.vim
source $VIMRUNTIME/../vimfiles/plugin/indentLine.vim
source $VIMRUNTIME/../vimfiles/plugin/go.vim

behave mswin
"=======GUI============================================
"---한글 상용-------
"set enc=utf-8
"set fenc=utf-8
"set fencs=ucs-bom,utf-8,cp949,latin1
"set nobomb
"set langmenu=en_US.UTF-8 

"let $LANG='UTF-8'
"한글 사용
"set encoding=utf-8
"let $LANG='ko_KR.UTF-8'
"set tenc=korea
"set guifont=굴림체:h11:cHANGEUL
"set guifontwide=MS\ Gothic:h11:b
"----일본어 사용---
"set enc=japan
set enc=sjis
"set guifont=Meiryo\ UI:h11:b
"set guifont=MS\ Mincho:h11:b
"set guifont=MS\ Gothic:h11:b
set guifont=Consolas:h11
"-----GUI Encoding Etc--------------
"set fencs=ucs-bom,utf-8,cp949,latin1
"set guifont=Consolas:h11
" 현재의 encoding 상태표시
"--------------status line---------------- 
set laststatus=2 "항상 상태바가 나오도록 설정한다.
"set statusline=%<%f\|%m%r%h%y\ [%Y/%{&ff}/%{\(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}]%=[%04l(%p%%\|%P),%04v\|\%03.3b,\%02.2B]


"====GUI 이면, 시작시 크기 설정========================
if has("gui_running")
    set lines=89
    set co=114
endif
"GUI 설정 
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"colorscheme zellner"컬러스킴을 변경
"colorscheme pyte_noitalic
"colorscheme jellybeans
"colorscheme koehler
colorscheme gruvbox 
set background=dark "gruvbox colormode"
let g:gruvbox_italicize_comments=0
" for tetris game

"=Key Map=============================================
map gr :grep <cword> *.c *.cpp *.h *.cs<CR>
"----- Srcexpl Setting ----
map <F2> :SrcExplToggle<CR>

"map <F2> v]}zf
map <F3> zo
map <F4> :Tlist<cr><C-W><C-W>
map <F5> :tabnew<CR>
map <F6> :tabn<CR>
map <F7> :tabclose<CR>
map <F8> :cs add cscope.out<CR>
map <F9> :!ctags -R . <CR>
map <F10> :!dir/B/S *.c *.cpp *.h *.cs >cscope.files <CR>
map <F11> :!cscope -b -q -k <CR>
" -- ctags --
" map F12 to generate ctags for current folder:
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ./ <CR><CR>
" add current directory's generated tags file to available tags
set tags+=./tags




"============== buffer Setting ===========
"map 1 :b!1<CR>
"map 2 :b!2<CR>
map 3 :b!3<CR>
map 4 :b!4<CR>
map 5 :b!5<CR>
map 6 :b!6<CR>
map 7 :b!7<CR>
map 8 :b!8<CR>
map 9 :b!9<CR>
map 0 :b!0<CR>
" - : close, + : buffer all 
map - :bw<CR>
map + :al<CR>

"===================================================
"=============set===================================
"===================================================

"===== JSON ========================================
com! FormatJSON %!python -m json.tool 

"===== Golong ===========================================
autocmd FileType go         setl ts=4 sw=4 sts=4 noet
filetype plugin indent on
"-------------------------------------------------------
set modifiable

set nocompatible

syntax on 
set nu
set cindent
set autoindent
set sw=4
set ts=4
set sts=4
set smartindent
set ignorecase
set nobackup
set notx
"set list " Display Tab etc
set noexpandtab
"set expandtab
set nowrap "줄 Wrap를 하지 않음
"텝표시 "
"set list 
" backup file 만들지 않는다.
set nobackup
" un~ Undo파일을 만들지 않는다.
set noundofile
" 편집하고 있는 라인 표시하기 
set cursorline 
" To Disable Logging HTML & Javascript autoindent
let g:js_indent_log = 0 
"-----------Doxygen -------------------------------
let g:DoxygenToolkit_briefTag_pre = "@fn "
let g:DoxygenToolkit_briefTag_post = "\n* @brief "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="--------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Kim Gisaeng"
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:DoxygenToolkit_briefTag_className = "yes"
let g:DoxygenToolkit_briefTag_structName = "yes"
let g:DoxygenToolkit_briefTag_enumName = "yes"
let g:DoxygenToolkit_briefTag_namespaceName = "yes"
"---------------------------------------------------
"======NERDTREE===============================================
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"======netrw===============================================
let g:netrw_liststyle = 3


