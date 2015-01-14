" no vi-compatible
set nocompatible

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

" required for vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles from GitHub repos:

" Python and PHP Debugger
"Bundle 'fisadev/vim-debug.vim'
" Better file browser
Bundle 'scrooloose/nerdtree'
" Code commenter
Bundle 'scrooloose/nerdcommenter'
" Class/module browser
Bundle 'majutsushi/tagbar'
" Code and files fuzzy finder
Bundle 'kien/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Bundle 'fisadev/vim-ctrlp-cmdpalette'
" Zen coding
Bundle 'mattn/zencoding-vim'
" Git integration
Bundle 'motemen/git-vim'
" Git branch status
Bundle 'tpope/vim-fugitive'
" Tab list panel
Bundle 'kien/tabman.vim'
" Powerline
" Bundle 'Lokaltog/vim-powerline'
" Terminal Vim with 256 colors colorscheme
Bundle 'fisadev/fisa-vim-colorscheme'
" Consoles as buffers
Bundle 'rosenfeld/conque-term'
" Pending tasks list
Bundle 'fisadev/FixedTaskList.vim'
" Surround
Bundle 'tpope/vim-surround'
" Autoclose
Bundle 'Townk/vim-autoclose'
" Indent text object
Bundle 'michaeljsmith/vim-indent-object'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Bundle 'klen/python-mode'
" Snippets manager (SnipMate), dependencies, and snippets repo
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
" Git diff icons on the side of the file lines
Bundle 'airblade/vim-gitgutter'
" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative
" numbering every time you go to normal mode. Author refuses to add a setting
" to avoid that)
" Bundle 'myusuf3/numbers.vim'
"  OmniCppComplete
Bundle 'vim-scripts/OmniCppComplete'
" Bundles from vim-scripts repos

" Autocompletion
"Bundle 'AutoComplPop'
" Python code checker
Bundle 'pyflakes.vim'
" Search results counter
Bundle 'IndexedSearch'
" XML/HTML tags navigation
Bundle 'matchit.zip'
" Gvim colorscheme
Bundle 'Wombat'
" Yank history navigation
Bundle 'YankRing.vim'
" Buffer Exlporer
" Bundle 'bufexplorer.zip'
" C VIM'
Bundle 'c.vim'
" Indent Line
Bundle 'indentLine.vim'
" Tabular
Bundle 'godlygeek/tabular'
" Vim misc, needed by vim-session
Bundle 'xolox/vim-misc'
" Vim session
Bundle 'xolox/vim-session'
" Nerdtree tabs
Bundle 'jistr/vim-nerdtree-tabs'
" Ack
Bundle 'mileszs/ack.vim'
" Nerdack
Bundle 'tyok/nerdtree-ack'
" minibufexplore
" Bundle "fholgado/minibufexpl.vim"
" vim-airline
Bundle "bling/vim-airline"
" mark-signature
Bundle "kshenoy/vim-signature"
" highlight tags
Bundle "vim-scripts/TagHighlight"
" window chooser
Bundle "t9md/vim-choosewin"
" YouCompleteMe
Bundle "Valloric/YouCompleteMe"
Bundle "Valloric/ListToggle"
Bundle "scrooloose/syntastic"

" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" allow plugins by file type
filetype plugin on
filetype indent on

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tablength exceptions
" autocmd FileType html setlocal shiftwidth=2 tabstop=2
" autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType automake setlocal expandtab

" always show status bar
set ls=2

" incremental search
set incsearch

" highlighted search results
set hlsearch

" line numbers
set nu

" map leader to ,
let mapleader = ";"
let g:mapleader = ";"

" toggle Tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on Tagbar open
let g:tagbar_autofocus = 1

" NERDTree toggle
map <F3> :NERDTreeToggle<CR>

" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew
map ts :tab split<CR>
" buffer navigation
map <C-S-Right> :bn<CR>
imap <C-S-Right> <ESC>:bn<CR>
map <C-S-Left> :bp<CR>
imap <C-S-Left> <ESC>:bp<CR>

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

map <C-l> <c-w>l
map <C-h> <c-w>h
map <C-k> <c-w>k
map <C-j> <c-w>j

" automatically close autocompletion window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>

" show pending tasks list
map <F2> :TaskList<CR>

" save as sudo
ca w!! w !sudo tee "%"

" colors and settings of autocompletion
highlight Pmenu ctermbg=4 guibg=LightGray
" highlight PmenuSel ctermbg=8 guibg=DarkBlue guifg=Red
" highlight PmenuSbar ctermbg=7 guibg=DarkGray
" highlight PmenuThumb guibg=Black
" use global scope search
let OmniCpp_GlobalScopeSearch = 1
" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 2
" 0 = auto
" 1 = always show all members
let OmniCpp_DisplayMode = 1
" 0 = don't show scope in abbreviation
" 1 = show scope in abbreviation and remove the last column
let OmniCpp_ShowScopeInAbbr = 0
" This option allows to display the prototype of a function in the abbreviation part of the popup menu.
" 0 = don't display prototype in abbreviation
" 1 = display prototype in abbreviation
let OmniCpp_ShowPrototypeInAbbr = 1
" This option allows to show/hide the access information ('+', '#', '-') in the popup menu.
" 0 = hide access
" 1 = show access
let OmniCpp_ShowAccess = 1
" This option can be use if you don't want to parse using namespace declarations in included files and want to add
" namespaces that are always used in your project.
let OmniCpp_DefaultNamespaces = ["std"]
" Complete Behaviour
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 0
" When 'completeopt' does not contain "longest", Vim automatically select the first entry of the popup menu. You can
" change this behaviour with the OmniCpp_SelectFirstItem option.
let OmniCpp_SelectFirstItem = 0
set completeopt-=preview
" debugger keyboard shortcuts
"map <F5> :Dbg over<CR>
"map <F6> :Dbg into<CR>
"map <F7> :Dbg out<CR>
"map <F8> :Dbg here<CR>
"map <F9> :Dbg break<CR>
"map <F10> :Dbg watch<CR>
"map <F11> :Dbg down<CR>
"map <F12> :Dbg up<CR>

" CtrlP (new fuzzy finder)
let g:ctrlp_map = ',e'
nmap ,g :CtrlPBufTag<CR>
nmap ,G :CtrlPBufTagAll<CR>
nmap ,f :CtrlPLine<CR>
nmap ,m :CtrlPMRUFiles<CR>
nmap ,c :CtrlPCmdPalette<CR>
nmap ,b :CtrlPBuffer<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" CtrlP with default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" Don't change working directory
let g:ctrlp_working_path_mode = 0
" Ignore files on fuzzy finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.pyc$\|\.pyo$|\.o|\.a$',
  \ }

" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.o$', '\.a$', '\.la$', '\.lo$']

" simple recursive grep
command! -nargs=1 RecurGrep lvimgrep /<args>/gj ./**/*.* | lopen | set nowrap
command! -nargs=1 RecurGrepFast silent exec 'lgrep! <q-args> ./**/*.*' | lopen
nmap ,R :RecurGrep
nmap ,r :RecurGrepFast
nmap ,wR :RecurGrep <cword><CR>
nmap ,wr :RecurGrepFast <cword><CR>

" python-mode settings
" don't show lint result every time we save a file
let g:pymode_lint_write = 0
" run pep8+pyflakes+pylint validator with \8
autocmd FileType python map <buffer> <leader>8 :PyLint<CR>
" rules to ignore (example: "E501,W293")
let g:pymode_lint_ignore = ""
" don't add extra column for error icons (on console vim creates a 2-char-wide
" extra column)
let g:pymode_lint_signs = 0
" don't fold python code on open
let g:pymode_folding = 0
" don't load rope by default. Change to 1 to use rope
let g:pymode_rope = 1

" rope (from python-mode) settings
nmap ,d :RopeGotoDefinition<CR>
nmap ,D :tab split<CR>:RopeGotoDefinition<CR>
nmap ,o :RopeFindOccurrences<CR>

" don't let pyflakes allways override the quickfix list
let g:pyflakes_use_quickfix = 0

" tabman shortcuts
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
    let &t_Co = 256
    " color
    colorscheme fisa
else
    " color
    colorscheme delek
endif

" colors for gvim
if has('gui_running')
    colorscheme wombat
endif

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" to use fancy symbols for powerline, uncomment the following line and use a
" patched font (more info on the README.rst)
"let g:Powerline_symbols = 'fancy'

" vim-airline settings
let g:airline_powerline_fonts = 1
let g:airline_enable_branch = 1

" Powerline symbols for vim-airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮁'
let g:airline#extensions#tabline#right_sep = '⮂'
let g:airline#extensions#tabline#right_alt_sep = '⮃'

" 设置新文件的编码为 UTF-8
set fileencoding=utf-8
"
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,gb18030,default

" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
"nnoremap <silent> <M-F12> :BufExplorer<CR>
"nnoremap <silent> <F12> :bn<CR>
"nnoremap <silent> <S-F12> :bp<CR>

" Buffers navigation
noremap <C-Tab>   :bn<CR>
noremap <C-S-Tab> :bp<CR>

" Buffers quick search
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

if has("autocmd")
    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
    au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
endif
" CTags update
noremap <silent> <F12> :!ctags -R --c++-kinds=+p --fields=+liaS --extra=+q .<CR>
" imap <silent> <F12> <ESC>:!ctags -R --c++-kinds=+p --fields=+liaS --extra=+q .<CR>
set tags+=~/.vim/systags

" YouCompleteMe TypesFile Update
noremap <silent> <F10> :UpdateTypesFile<CR>

" Mousable
if has('mouse')
    set mouse=n
endif

" Set indentLine
let g:indentLine_color_term = 239

let g:C_FormatDate = '%Y.%m.%d'

set listchars=tab:>-,trail:-
set list

" Set clipboard not override when delete
xnoremap p pgvy

" Set fold
"set fdm=syntax

" Session
let g:session_autosave = 'no'

" TagHighlight
let g:TagHighlightSettings = {'TagFileName': 'tags', 'CtagsExecutable': 'ctags'}

nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" Shortcuts for save
" <LEADER>w : save
" <LEADER>w : save and quit
nnoremap <LEADER>w :w<CR>
inoremap <LEADER>w <ESC>:w<CR> i
nnoremap <LEADER>wq :wq<CR>
inoremap <LEADER>wq <ESC>:wq<CR>

"youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全,
"不过python关键字都很短，所以，需要的自己打开
let g:ycm_collect_identifiers_from_tags_files = 1
" 引入，可以补全系统，以及python的第三方包 针对新老版本YCM做了兼容
"old version
if !empty(glob("~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
endif
" new version
if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
endif

" Do not ask for ycm_extra_conf load
let g:ycm_confirm_extra_conf = 0
" 直接触发自动补全
let g:ycm_key_invoke_completion = '<C-Space>'
" 黑名单,不启用
 let g:ycm_filetype_blacklist = {
       \ 'tagbar' : 1,
       \ 'gitcommit' : 1,
       \}
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_filepath_completion_use_working_dir = 1
let g:syntastic_always_populate_loc_list = 1

" Close c.vim's C-J map
let g:C_Ctrl_j = 'off'

"Use arrow key to change buffer"
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>

" F4 to temprarily disable highlight search
noremap <silent> <F4> :nohlsearch<CR>

" F8 to search the selected text
set guioptions+=a
function! MakePattern(text)
  let pat = escape(a:text, '\')
  let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
  let pat = substitute(pat, '^\_s\+', '\\s\\*', '')
  let pat = substitute(pat, '\_s\+',  '\\_s\\+', 'g')
  return '\\V' . escape(pat, '\"')
endfunction
vnoremap <silent> <F8> :<C-U>let @/="<C-R>=MakePattern(@*)<CR>"<CR>:set hls<CR>

" F5, F6 to navigate in location list
noremap <silent> <F6> :lprevious<CR>
noremap <silent> <F7> :lnext<CR>

" Copy to system pastepad
noremap <LEADER>y "+y

" Highlight text over 80 width coloumn
set cc=100
highlight ColorColumn ctermbg=217 ctermfg=8 guibg=#592929

