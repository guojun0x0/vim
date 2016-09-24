function Do_CsTag()
    silent! execute "!rm -f cscope.out"
    silent! execute "!rm -f cscope.in.out"
    silent! execute "!rm -f cscope.po"
    silent! execute "!rm -f tags"
    silent! execute "!ctags -R --c++-kinds=+px --fields=+iaS --extra=+q > /dev/null 2>&1 &"
    if (executable('cscope') && has("cscope"))
        silent! execute "!find -L `pwd` -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' -o -name '*.cxx' -o -name '*.hxx' -o -name '*.hpp' -o -name '*.py' > cscope.files"
    endif
    silent! execute "!cscope -bq > /dev/null 2>&1 &"
    silent! execute ":cs reset"
endf 

function Add_CsTag()
    execute "set tags+=./tags"
    if filereadable("cscope.out")
        execute "cs add cscope.out"
    endif
endf

func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle % --style=ansi --suffix=none %"
        exec "e! %"
    elseif &filetype == 'cpp'
        exec "!astyle % --style=ansi --suffix=none %"
        exec "e! %"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
        exec "e! %"
    elseif &filetype == 'py'
        exec "!astyle --style=gnu --suffix=none %"
        exec "e! %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
        exec "e! %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
        exec "e! %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
        exec "e! %"
    elseif &filetype == 'html'
        exec "!astyle --style=gnu --suffix=none %"
        exec "e! %"
    elseif &filetype == 'htm'
        exec "!astyle --style=gnu --suffix=none %"
        exec "e! %"
    endif
endfunc

function NormalG()
    if line("'\"") > 0 && line ("'\"") <= line("$")
        exe "normal g'\"" |
    endif
endfunc

function ToggleSideBar()
    exe "NERDTreeToggle"
    exe "TagbarToggle"
endfun

if $TERM == "xterm-256color"
    set t_Co=256
endif

let mapleader=","

"disable vi compatible mode
set nocompatible

"enable filetype
filetype plugin indent on

"enable syntax hightlight
syntax enable

set wildmenu

"disable mouse
set mouse= 

"show line number
set number

"set folder type
set foldmethod=indent

set sta

"set indent size to 4
set tabstop=4
set softtabstop=4
set shiftwidth=4

"expand tab to white space
set expandtab

"use indent style of c language
set cindent
"c++ public private procted
set cinoptions+=g0
"switch
set cinoptions+=:0
"namespace
set cinoptions+=N-s

"set autoindent
set autoindent
set smartindent

"could use backspace to delete in insert mode
set backspace=2

"set history size
set history=1000

"set match style
set showmatch

"auto search when input search string
set incsearch

"hight the late search result
set hlsearch

"set character set
if has("win32")
    set enc=gbk
else
    set enc=utf-8
endif
set fileencodings=utf-8,gbk,ucs-bom,cp936

"set bomb

"not use alt
set winaltkeys=no

"always show status
set laststatus=2

"show position of mouse pointer
set ruler
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P>

"设置隐藏已修改buffer
set hidden

"set python edit style
autocmd FileType python setlocal et sta sw=4 sts=4

"set the language of help document
set helplang=cn

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-airline'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'a.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'unite.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
"Plugin 'craigemery/vim-autotag'
"Plugin 'bling/vim-bufferline'
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'vim-scripts/Conque-GDB'
"Plugin 'ervandew/supertab'
call vundle#end()

if has("gui_running")
    "set color style
    "set background=light
    set background=dark
    "colorscheme evening
    "colorscheme desert
    "colorscheme solarized
    colorscheme molokai
    "colorscheme solarized
    "colorscheme mustang
    "highlight Normal ctermbg=NONE
    "highlight nonText ctermbg=NONE
else
    "set color style
    "set background=light
    set background=dark
    "colorscheme evening
    "colorscheme desert
    "colorscheme solarized
    colorscheme molokai
    "colorscheme desert256
    "colorscheme solarized
    "colorscheme mustang
    "highlight Normal ctermbg=NONE
    "highlight nonText ctermbg=NONE
endif

"colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

"TagList setting
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_Right_Window=1
let Tlist_Compact_Format=1
"let Tlist_Inc_Winwidth=0
let Tlist_Enable_Fold_Column=0
let Tlist_File_Fold_Auto_Close=1
let Tlist_WinHeight=300

"minibufferexp
"let g:miniBufExplorerMoreThanOne=1

"code-complete key
let g:completekey = "<C-b>"

"supertab
"let g:SuperTabDefaultCompletionType = '<c-c>'

"YouCompleteMe
"let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_confirm_extra_conf=0 "避免YCM每次加载都对用户提示是否加载
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_seed_identifiers_with_syntax=1
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
"let g:ycm_collect_indentifiers_from_tags_files=1
"let g:ycm_seed_identifiers_with_syntax=1
"let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments=1  "在注释输入中也能补全
let g:ycm_complete_in_strings=1   "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings=1  "注释和字符串中的文字也会被收入补全
"nnoremap <F2> :YcmCompleter GoToDefinitionElseDeclaration<CR>  "跳到定义或声明
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR> "强制进行编译
set completeopt=longest,menu "设置补全菜单，关闭预览窗空scratch
"inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>" "补全回车选中
let g:ycm_python_binary_path = '/usr/bin/python3'

"omnicppcomplete
set completeopt=longest,menu

"airline
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
"关闭状态显示空白符号计数,这个对我用处不大"
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

"UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"autocmd setting
autocmd BufRead *.txt set tw=78
autocmd BufReadPost * exec ":call NormalG()"
autocmd BufNewFile *.java,*.xx exec ":call SetTitle()"
autocmd BufWritePost *.sh,*.py exec ":call ModeChange()"
"autocmd BufWritePost *.c,*.cpp,*.cc,*.h,*.hpp exec ":call Do_CsTag()"

"scons
"set makeprg=make
"set makeprg=scons
"au BufNewFile,BufRead SCons* set filetype=scons

"add tags and cscope of the current project
silent! execute "call Add_CsTag()"

"shortcut setting
"map <F3>    :GtagsCursor<CR>
map <F3>     :YcmCompleter GoTo<CR>
"map <F4>    :call FormartSrc()<CR>
map <F4>     :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <F5>     :call Do_CsTag()<CR>
map <F6>     :cs find
map <F7>     :cn<CR>
"map <C-F7>  :cp<CR>
map <F8>     :bn<CR>
map <C-F8>   :bp<CR>
map <F9>     :call ToggleSideBar()<CR>
map <F12>    :tabnext<CR>
"map <C-F12> :tabprev<CR>
map <C-a>    ggVG<CR>
map <leader>uf :Unite file<CR>
map <leader>ub :Unite buffer<CR>
