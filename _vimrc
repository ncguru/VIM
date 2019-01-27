"---한글 상용-------
set enc=utf-8
set fenc=utf-8
set fencs=sjis,cp949,utf-8,ucs-bom,latin1
set nobomb
set langmenu=en_US.UTF-8 


"=======GUI============================================
if has("win32")  
"let $LANG='UTF-8'
"한글 사용
"set encoding=utf-8
"let $LANG='ko_KR.UTF-8'
"set tenc=korea
"set guifont=굴림체:h11:cHANGEUL
"set guifontwide=MS\ Gothic:h11:b
"----일본어 사용---
"set enc=japan
"set enc=sjis
"set guifont=Meiryo\ UI:h11:b
"set guifont=MS\ Mincho:h11:b
"set guifont=MS\ Gothic:h11:b
"set guifont=Consolas:h11
"set guifont=DejaVu_Sans_Mono_for_Powerline:h11
set guifont=Consolas_NF:h11
"set guifont=D2Coding_ligature:h11
"set guifont=Arimo:h11
set guifontwide=MS\ Mincho:h11
"-----GUI Encoding Etc--------------
"set fencs=ucs-bom,utf-8,cp949,latin1
"set guifont=Consolas:h11
" 현재의 encoding 상태표시


"--------------status line---------------- 
"set laststatus=2 "항상 상태바가 나오도록 설정한다.
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

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

endif " if Win32 
"=========================================================================

source $VIMRUNTIME/../vimfiles/plugin/cscope_maps.vim
"source $VIMRUNTIME/../vimfiles/ftplugin/java_vis.vim
"source $VIMRUNTIME/../vimfiles/ftplugin/cs_vis.vim
"source $VIMRUNTIME/../vimfiles/ftplugin/html_vis.vim
"source $VIMRUNTIME/../vimfiles/ftplugin/xml_vis.vim
source $VIMRUNTIME/../vimfiles/plugin/EasyGrep.vim
source $VIMRUNTIME/../vimfiles/plugin/indentLine.vim
source $VIMRUNTIME/../vimfiles/plugin/go.vim

" Colorsheme---------------------------------------------------
colorscheme gruvbox 
set background=dark "gruvbox colormode"
let g:gruvbox_italicize_comments=0
"setting-------------------------------------------------------
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
"set cursorline 
" To Disable Logging HTML & Javascript autoindent
let g:js_indent_log = 0 

"------airline -------------------------------------------
"let g:airline_theme='solarized'
"let g:airline_solarized_bg='light'
"let g:airline_theme='powerlineish'
let g:airline_theme='dark'
"let g:airline_theme='jellybeans'
"let g:airline_theme='light'
set laststatus=2

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#branch#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"let g:airline_left_sep = ' '
"let g:airline_right_sep = ' 걼'
"let g:airline_left_alt_sep = '걼 '
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.crypt = '걳'
"let g:airline_symbols.linenr = 'Line'
"let g:airline_symbols.maxlinenr = ' Column'
"let g:airline_symbols.branch = 'Branch:'
"let g:airline_symbols.paste = 'P'
"let g:airline_symbols.spell = 'S'
"let g:airline_symbols.notexists = 'NOTEX'
"let g:airline_symbols.whitespace = '■'
"let g:airline_symbols.ellipsis = '...'
"let g:airline_symbols.space = ' '
"let g:airline_symbols.modified = '*'
"let g:airline_symbols.readonly = 'ReadOnly'

"======Beep Off======================================
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

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

if has("win32")  
map <F11> :!dir/B/S *.c *.cpp *.h *.cs >cscope.files <CR>
  \:!cscope -b -i cscope.files -f cscope.out<CR>
  \:cs kill -1<CR>:cs add cscope.out<CR>
else "linux 
nmap <F11> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files ;
  \:!cscope -b -i cscope.files -f cscope.out<CR>
  \:cs kill -1<CR>:cs add cscope.out<CR>
endif
" -- ctags --
" map F12 to generate ctags for current folder:
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ./ <CR><CR>
" add current directory's generated tags file to available tags
set tags+=./tags

" JSON ----------------------------------------------------------- 
com! FormatJSON %!python -m json.tool 

" Golong ---------------------------------------------------------
autocmd FileType go         setl ts=4 sw=4 sts=4 noet
filetype plugin indent on
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
"NERTREE---------------------------------------------------
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"netrw-----------------------------------------------------
let g:netrw_liststyle = 3

"End===========================================================================================================

