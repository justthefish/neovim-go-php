
call plug#begin('~/.config/nvim/plugged')
" your plugins will go here

Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justthefish/vim-thefish-colors'
Plug 'tpope/vim-surround'

"--------------------------------------------------
" Php syntax hilite
 Plug 'StanAngeloff/php.vim', {'for': 'php'}

"--------------------------------------------------
" Indexer 
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'
Plug 'vim-scripts/indexer.tar.gz'


"--------------------------------------------------
" Ack-grep
Plug 'mileszs/ack.vim'

"--------------------------------------------------
" Syntastic replacement
" Plug 'w0rp/ale'

"--------------------------------------------------
" JSON, vue, markdown etc
Plug 'sheerun/vim-polyglot'

"--------------------------------------------------
" See current changes
Plug 'mhinz/vim-signify'

"--------------------------------------------------
" Php completion daemon
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

"--------------------------------------------------
" php + Autocompletion

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

"--------------------------------------------------
" Golang
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'nsf/gocode'
Plug 'jodosha/vim-godebug', {'for': 'go'}

"--------------------------------------------------
" Snippets 
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

"--------------------------------------------------
"" Character encoding
set termencoding=utf-8        
set encoding=utf-8            
set fileencodings^=utf-8      

"--------------------------------------------------
"" Base settings
set nocompatible          " We're running Vim, not Vi!
syntax on                 " syntax highlingt
set autoindent            " automatical code indent
set cindent
set smartindent
set backspace=2           " backspace del all
set history=50            " history of commands
set hlsearch              " highlignt search fraze
filetype plugin on        " file type based syntax highliht
filetype indent on
set ts=4                  " tab stop
set sw=4                  " shift width (with autoindent)
set textwidth=2048        " text witdth
set nu                    " show numbers
set lcs=tab:>.,eol:$      " show non printed chars
set whichwrap+=<,>,[,]    " where wrap long lines
set gdefault              " /g default on s///
set showcmd               " show typed commands
set statusline=%<%f\ (%{&encoding})\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2          " always show status line
set viminfo='1000,f1,:1000,/1000  " big viminfo :)
set history=500
set lazyredraw
set wmh=0
set t_Co=256              " color numbers
set nowrap                " do not wrap lines

"-------------------------------------------------
" ESC-c ... capitalize current word (and goto next word)
map <esc>c viwu~W
" ESC-l ... lowercase current word (and goto next word)
map <esc>l viwuW
" ESC-u ... UPPERCASE current word (and goto next word)
map <esc>u viwUW

"--------------------------------------------------
" Duplicate line
"--------------------------------------------------
map! <c-d> <esc>yypi
map <c-d> <esc>yyp

"--------------------------------------------------
" File tree on F7
"--------------------------------------------------
map <silent> <F7> :NERDTreeToggle<CR>
" let NERDTreeMapActivateNode='<CR>'

"--------------------------------------------------
" NERDTree settings
"--------------------------------------------------
let NERDTreeShowHidden=1 " Show hidden files (.htaccess)
" set autochdir
let NERDTreeChDirMode=2 " always open in current dir

"--------------------------------------------------
" Non indend paste: <F12><S-Ins><F12>
"--------------------------------------------------
set pastetoggle=<F12>

"--------------------------------------------------
" Syntax coloring (~/.vim/colors/)
"--------------------------------------------------
colorscheme ir_black2


"---------------------------------------------------
" Tab size
"--------------------------------------------------
:set tabstop=4        " Force tabs to be displayed/expanded to 2 spaces (instead of default 8).
:set softtabstop=4    " Make Vim treat <Tab> key as 4 spaces, but respect hard Tabs.
                      " I don't think this one will do what you want.
:set expandtab        " Turn Tab keypresses into spaces.  Sounds like this is happening to you.
                      " You can still insert real Tabs as [Ctrl]-V [Tab].
:set shiftwidth=4     " When auto-indenting, indent by this much.
                      " (Use spaces/tabs per "expandtab".)
:retab                " Change all the existing tab characters to match the current tab settings

"  ------------------------------------------------------
"  Using the xclip as system clipboard with ctrl+y and ctrl+p
"  ------------------------------------------------------
vmap <C-y> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!xclip -selection c<CR>u
map <C-p> :set paste<CR>i<CR><CR><Esc>k:.!xclip -o<CR>JxkJx:set nopaste<CR>

" -----------------------------------------------------
"  Ctrl+Z Undo
" -----------------------------------------------------
map <C-Z> u<CR>
imap <C-Z> <Esc>u<CR>i

" -----------------------------------------------------
"  F2 to save file
" -----------------------------------------------------
map <F2> :w<CR>
imap <F2> <Esc>:w<CR>i

" -----------------------------------------------------
" JJ to escape 
" -----------------------------------------------------
inoremap jj <Esc>


" -----------------------------------------------------
" Deoplete config
" Use deoplete.
" -----------------------------------------------------
let g:deoplete#enable_at_startup = 1

let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']

" ALE steup
let g:ale_sign_column_always = 1
let g:ale_sign_error = '⚑'
let g:ale_sign_warning = '⚐'

" polyglot Markdown setup
let g:vim_markdown_conceal = 0

" vim-godebug setup
map <C-BS> :call GoToggleBreakpoint()
map <C-F9> :call GoDebug()

" -----------------------------------------------------
"  Indexer setup
"  ----------------------------------------------------
" let g:Indexer_ctagsCommandLineOptions=""
let g:indexer_tagsDirname = $HOME."/.config/nvim/tags"
" let g:indexer_lookForProjectDir = 0 
let g:indexer_ctagsCommandLineOptions="-h '.php' --exclude='\.git' --totals=yes --tag-relative=yes --regex-PHP='/abstract class ([^ ]*)/\1/c/' --regex-PHP='/interface ([^ ]*)/\1/c/' --regex-PHP='/(public\s+|static\s+|protected\s+|private\s+)\$([^ \t=]+)/\2/p/' --regex-PHP='/const\s+([^ \t=]+)/\1/d/' --regex-PHP='/final\s+(public\s+|static\s+|abstract\s+|protected\s+|private\s+)function\s+\&?\s*([^ (]+)/\2/f/' --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/' --PHP-kinds=+cpdf-v "
let g:indexer_ctagsDontSpecifyFilesIfPossible = 1
let g:indexer_disableCtagsWarning = 1
let g:indexer_disableIndexerFilesDirsWarning=1

