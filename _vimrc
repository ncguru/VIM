"---한글 상용-------
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,sjis,cp949,ucs-bom,latin1
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
"set guifont=Consolas_NF:h11
set guifont=Fira\ Code:h12
"set guifont=PlemolJP_Console_NF:h13
"set guifont=D2Coding_ligature:h11
"set guifont=Arimo:h11
"set guifontwide=MS\ Mincho:h12
set guifontwide=PlemolJP_Console_NF:h12
"-----GUI Encoding Etc--------------
"set fencs=ucs-bom,utf-8,cp949,latin1
"set guifont=Consolas:h11
" 현재의 encoding 상태표시

"--------------status line------------------------------ 
"set laststatus=2 "항상 상태바가 나오도록 설정한다.
"set statusline=%<%f\|%m%r%h%y\ [%Y/%{&ff}/%{\(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}]%=[%04l(%p%%\|%P),%04v\|\%03.3b,\%02.2B]

"--------------vim 7 이상부터는 direct-x 를 통한 렌더링 가속을 지원하므로 direct-x로 렌더링을 설정하면 GDI 에 비해 glyph 들을 더 빠르고 가독성 좋게 렌더링합니다.
set renderoptions=type:directx,
                        \gamma:1.0,
                        \contrast:0.5,
                        \level:1,
                        \geom:1,
                        \renmode:5,
                        \taamode:1

"====GUI 이면, 시작시 크기 설정========================
if has("gui_running")
" Size 지정
    set lines=90
    set co=250
	winpos  0 0
" Size 전체 화면
	au GUIEnter * simalt ~x
endif
"GUI 설정 
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar


set rtp+=C:\Vim\vim91
set rtp+=C:\Vim\vimfiles

"source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set hlsearch

endif " if Win32 
"=========================================================================

source $VIMRUNTIME/../vimfiles/plugin/cscope_maps.vim
source $VIMRUNTIME/../vimfiles/plugin/autoload_cscope.vim

"-------------- QuicFix Window Height -------------------
au FileType qf call AdjustWindowHeight(3, 40)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction


"setting-------------------------------------------------------
set modifiable
set nocompatible
filetype plugin on
syntax on 
set nu
set cindent
set autoindent
set sw=4
set tabstop=4
set sts=4
set smartindent
"set list " Display Tab etc
set noexpandtab
"set expandtab " Tab을 Space로 사용한다 

"대소 문자 구분
set ignorecase
set nobackup
set notx
set nowrap "줄 Wrap를 하지 않음
" backup file 만들지 않는다.
set nobackup
" un~ Undo파일을 만들지 않는다.
set noundofile
" 편집하고 있는 라인 표시하기 
"set cursorline
" Oldfile 표시 수자 지정 
"set viminfo='50
"set history=10
" To enable Logging HTML & Javascript autoindent
let g:js_indent_log = 1 
"Indentline For Tab
set list lcs=tab:\|\ 
"Window Board charator
set fillchars+=vert:┃ 
" Folding C style
set foldmethod=syntax
set nofoldenable " defaut No folding "


"======Beep Off======================================
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"=Key Map=============================================
" Map the leader key to ,
let mapleader="\<SPACE>"


" Hilight 표시 후에 Couser이동 하지 않게 하기 
nnoremap * *N
nnoremap gd gd<cr><C-o>
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

map gr :grep <cword> *.c *.cpp *.h *.cs *.js *.hta *.html *.py<CR>
"----- Srcexpl Setting ----

map <F1> zM
map <F2> zR

"map <F2> v]}zf
"map <F3> zo
map <F3> :cd %:p:h
map <F4> :Tlist<cr><C-W><C-W>
map <F5> :tabnew<CR>
map <F6> :tabn<CR>
map <F7> :tabclose<CR>
map <F8> :cs kill -1<CR> 
			\:cs add cscope.out<CR>
			\:e<CR>
map <F9> :!ctags -R . <CR>
" ---- CSCOPE ----
if has("win32")  
	map <F11> :cs kill -1<CR>
				\:!dir/B/S *.c *.cpp *.h *.cs >cscope.files <CR>
				\:!cscope -b -i cscope.files -f cscope.out<CR>
				\:cs add cscope.out<CR>
				\:e<CR>
else "linux 
	nmap <F11> :cs kill -1<CR>
				\:!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files ;
				\:!cscope -b -i cscope.files -f cscope.out<CR>
				\:cs add cscope.out<CR>
				\:e<CR>
endif

" -- ctags --
" map F12 to generate ctags for current folder:
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ./ <CR><CR>

"-------------- tags----------------------------------------------
" add current directory's generated tags file to available tags
set tags+=./tags
let Tlist_WinWidth = 50
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
"let g:NERDTreeDirArrowExpandable = '▸' " 접혀 있는 디렉터리
"let g:NERDTreeDirArrowCollapsible = '▾' " 펼쳐 있는 디렉터리
"netrw-----------------------------------------------------
let g:netrw_liststyle = 3

"==== IME 입력 모드에서 명령모드 변경시 IME 영문으로 자동변경============= 
"- 현재는IM-select를 Plugin을 사용하고 있으므로 아래설정은 비활성화 한다
"コマンドラインの高さを2に
"set cmdheight=1

"<C-^>でIM制御が行える場合の設定
"let IM_CtrlMode = 4
"ctrl+jで日本語入力固定モードをOnOff
"inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>


"=Plugin=============================================================================================================
" plug#begin 과 plug#end 사이에 사용하고 싶은 플러그인들을 선언해 줍니다.
call plug#begin('~/.vim/plugged')
    "Plug 'GitHub계정명/저장소명'   " 추가하고 싶은 플러그인의 GitHub 저장소 주소를 Plug 뒤에 적어줍니다.
"괄호
"Plug 'vim-scripts/matchparenpp'                       " 괄호 확인
"Plug 'townk/vim-autoclose'                " 자동 괄호 닫힘

"Session
Plug 'mhinz/vim-startify'

"indent guide line
Plug 'Yggdroot/indentLine'

"taglist
Plug 'yegappan/taglist'
"FzF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Tree
Plug 'preservim/nerdtree'

"airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Colorschemes
"Plug 'sainnhe/gruvbox-material'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
"Plug 'dracula/vim'

" Auto Rooter directory
Plug 'airblade/vim-rooter'

" Font Icon
"Plug 'ryanoasis/vim-devicons'

" C and C++ syntax
"Plug 'bfrg/vim-cpp-modern'

" html5 syntax
Plug 'othree/html5.vim'


"lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" snippet
" Track the engine.
"Plug 'SirVer/ultisnips'

"Plug 'thomasfaingnaert/vim-lsp-snippets'
"Plug 'thomasfaingnaert/vim-lsp-ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" This repository contains snippets files
"Plug 'honza/vim-snippets'

" Git 
Plug 'tpope/vim-fugitive'

" 20220305 - javascript syntax highlight
Plug 'pangloss/vim-javascript'

"html ccs
Plug 'emmetio/emmet'

"syntax
"Plug 'sheerun/vim-polyglot'

"oldfiles
Plug 'gpanders/vim-oldfiles'

"Rianbow Color CSV 
"Plug 'mechatroner/rainbow_csv'

"IME자동 복귀 기능
Plug 'brglng/vim-im-select'

" Functionalities - Python
Plug 'psf/black', { 'branch': 'stable' }
Plug 'heavenshell/vim-pydocstring'

" syntax Color"
Plug 'frazrepo/vim-rainbow'


call plug#end()

"Indent Guides
let g:indentLine_enabled = 1


let g:rainbow_active = 1

"======LSP===================================================================
let g:lsp_settings_root_markers = [
\   '.repo',
\   'cscope.out',
\   '.thisRoot',
\ ]

"let g:lsp_settings_root_markers = [
"\   'cscope.out',
"\   '.git',
"\   '.git/',
"\   '.svn',
"\   '.hg',
"\   '.bzr',
"\   '.mxproject', 
"\   '.thisRoot',
"\ ]
"

let g:lsp_diagnostics_enabled = 0

if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif


if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif


if executable("deno")
  augroup LspTypeScript
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
    \ "name": "deno lsp",
    \ "cmd": {server_info -> ["deno", "lsp"]},
    \ "root_uri": {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), "tsconfig.json"))},
    \ "allowlist": ["typescript", "typescript.tsx"],
    \ "initialization_options": {
    \     "enable": v:true,
    \     "lint": v:true,
    \     "unstable": v:true,
    \   },
    \ })
  augroup END
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"===Snippent==============================================================
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical""
"
"
""-------- file type "syntax---------------------------------------------------------------------------
au BufRead,BufNewFile *.xaml setfiletype xml
au BufRead,BufNewFile *.hta setfiletype Javascript

"======================CSCOPE Auto load====================================================
au  BufRead *
	\if has("cscope")
		\add any database in current dir
		\if filereadable("cscope.out")
			\cs add cscope.out
		\endif
	\endif
"
"======= Automatically change the current directory =========================
"autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

"=======Plug 'airblade/vim-rooter'=========================
"To specify the root has a certain directory or file (which may be a glob), just give the name:
"let g:rooter_patterns = ['cscope.out', '.repo', '.git', '.svn', '.mxproject', '.thisRoot']
let g:rooter_patterns = ['.repo', 'cscope.out', '.thisRoot']
" Change to file's directory (similar to autochdir).
let g:rooter_change_directory_for_non_project_files = 'current'

"===vim-cpp-modern c and c++ syntax================================================================================
" Disable function highlighting (affects both C and C++ files)
let g:cpp_no_function_highlight = 0

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 0


" Colorsheme
set background=dark
if has('termguicolors')
	set termguicolors
endif
" Colorsheme gruvbox   --------------------------------------------------
let g:gruvbox_italic = 0
"let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_bold = 0
let g:gruvbox_improved_strings=0
" Colorsheme gruvbox-material--------------------------------------------------

let g:gruvbox_material_palette = 'original'
"soft hard, medium"
let g:gruvbox_material_background = 'soft' 
"let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1
"let g:gruvbox_material_current_word = 'bold'
let g:gruvbox_material_enable_bold = 0 "To enable bold in function name just like the original gruvbox
let g:gruvbox_material_diagnostic_virtual_text = 'colored'

" colorsheme jellybeans --------------------------------------------------------
let g:jellybeans_use_gui_italics = 0
let g:jellybeans_use_term_italics = 0

"colorscheme gruvbox-material
"colorscheme jellybeans
"colorscheme molokai_noitalic
colorscheme gruvbox_custom



"------airline -------------------------------------------
"let g:airline_theme='solarized'
"let g:airline_solarized_bg='light'
"let g:airline_theme='powerlineish'
let g:airline_theme='base16_gruvbox_dark_hard'
"let g:airline_theme='dark'
"let g:airline_theme='jellybeans'
"let g:airline_theme='light'
"let g:airline_theme='molokai'

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#branch#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"=========FZF=========================================================================================
" For FZF bash
let $PATH = "C:\\Program Files\\Git\\bin;" . $PATH
" Preview window on the right side of the window,
" hidden by default, ctrl-/ to toggle
let g:fzf_layout = { 'down': '~80%' }
let g:fzf_preview_window = [] " disable
"let g:fzf_preview_window = ['right:hidden', 'ctrl-/']
"let g:fzf_preview_window = ['down:hidden', 'ctrl-/']



"=======================Plug 'SirVer/ultisnips'======================
"let g:UltiSnipsExpandTrigger="<Tab>"
"let g:UltiSnipsJumpForwardTrigger="<Tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
"let g:UltiSnipsEditSplit="vertical"
"" let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips']
"let g:UltiSnipsSnippetDirectories = ['UltiSnips']
"
"=======================Plug 'startify'======================
"Enable the option only in case you think Vim starts too slowly (because of
":Startify) or if you often edit files on remote filesystems.
let g:startify_enable_unsafe = 1

"End===========================================================================================================

