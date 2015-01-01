" Use Vim settings, rather than Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible
set encoding=utf-8

" Set terminal title to filename
set title

" When you type the first tab hit will complete as much as possible, the second
" tab hit will provide a list, the third and subsequent tabs will cycle through
" completion options so you can complete the file without further keys
set wildmode=longest,list,full
set wildmenu

" Highlight matches
set hlsearch
" Incremental searching
set incsearch
" Case-insensitive searching...
set ignorecase
" Unless they contain at least one capital letter.
set smartcase
" While typing a search command, show where the pattern, as it was typed so far,
" When a bracket is inserted, briefly jump to the matching one. A Beep is given
" if there is no match.
set showmatch
" Clear highlighted matches until next search

nnoremap <esc> :noh<return><esc>
" Number of spaces that a <Tab> in the file counts for.
set tabstop=4
" Controls how many columns Vim uses when <Tab> is pressed in insert mode.
set softtabstop=4
" When set, hitting <Tab> in insert mode will produce the appropriate
" number of spaces.
set expandtab
" How many columns text is indented with reindent operations (>> & <<) and
" automatic C-style indentation
set shiftwidth=4
" When on, a <Tab> in front of a line inserts balnks according to 'shiftwidth'
set smarttab

" Let me hide modified buffers
set hidden
" Change the leader key from \ to ,
let mapleader=","
" Use ,n / ,p / ,d
map <Leader>n :bnext<CR>
map <Leader>p :bprevious<CR>
map <Leader>d :bdelete<CR>

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Open new split panes to right and bottom, which feels more natural than Vim’s
"default:
set splitbelow
set splitright

map OD <left>
map OC <right>
map OA <up>
map OB <down>

" Switch syntax highlighting on.
syntax on
" Enable loading the plugin + indent files for specific file types.
filetype plugin indent on
" Copy indent from current line when starting a new line.
set autoindent

" disable usage of cursor keys within insert mode, removes delay when pressing
" <Shift><o> immediately after <Esc>.
" NOTE: somehow this was messing with the arrow keys on Mavericks, and making
" the arrow keys insert A B C D
set noesckeys

" Fix the delete key
fixdel

" Influences the working of <BS>, <Del>, <CTRL-W>, <CTRL-U> in Insert mode.
" This is a list of items, separated by commas. Each item allows a way to
" backspace over something:
" value     effect
" indent    allow backspacing over autoindent
" eol       allow backspacing over line breaks (join lines)
" start     allow backspacing over the start of insert; CTRL-W and CTRL-U stop
"           once at the start of insert.
set backspace=indent,eol,start

" Maximum width of text that is being inserted. A longer line will be broken
" after whitespace to get this width. A zero value disables this.
set textwidth=79

" When set to dark, Vim will try to use colors that look good on a dark bg.
" set background=dark

" Print the line number in front of each line.
set relativenumber
set number

" Set the color scheme.
"colorscheme koehler
"colorscheme elflord
"colorscheme hybrid
colorscheme base16-eighties
"colorscheme pablo
let g:hybrid_use_iTerm_colors = 1
highlight LineNr ctermfg=238 ctermbg=0
highlight CursorLineNr ctermfg=gray ctermbg=0
set fillchars+=vert:\│
highlight VertSplit ctermfg=0 ctermbg=0
" Remove the tildes (~) from past the EOF
highlight NonText ctermfg=bg
highlight MatchParen cterm=bold ctermbg=red ctermfg=0

" Print in black and white
set printoptions+=syntax:n

highlight clear SignColumn
let g:gitgutter_sign_modified_removed = 'x'

" Highlight the screen line of the cursor with CursorLine.
"set cursorline
" set cursorcolumn
"highlight CursorLine cterm=NONE ctermbg=0

" View the changes you have made to a buffer since the file was loaded
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

set noshowmode
set laststatus=2

function! CenterSplit()
    execute 'topleft' ((&columns - &textwidth) / 2 - 1) . 'vsplit _p_' |
                \ wincmd p
endfunction

" Highlight the trailing whitespace
function! HLWhitespace()
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
endfunction

call HLWhitespace()

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
" To 'auto-trim' trailing whitespace
"autocmd BufWritePre     *.rb :call TrimWhiteSpace()

au FileType c setl sw=8 sts=8 et
au FileType sh setl sw=2 sts=2 et
au FileType javascript setl sw=2 sts=2 et
au FileType ruby setl sw=2 sts=2 et
au FileType eruby setl sw=2 sts=2 et
au FileType css setl sw=2 sts=2 et
au FileType scss setl sw=2 sts=2 et
au FileType java setl sw=4 sts=4 et
au FileType html setl sw=2 sts=2 et wrap tw=0 wrapmargin=0 lbr
au FileType jade setl sw=2 sts=2 et wrap tw=0 wrapmargin=0 lbr
au FileType coffee setl sw=2 et

" For Example: if not coffeescript
"
" if &ft !~ 'coffee'
"     call HLWhitespace()
" endif

set pastetoggle=<F10>
nnoremap <F11> :set nonumber!<CR>

" underline matches instead of highlighting with that ugly yellow
highlight Search ctermfg=black ctermbg=white
highlight IncSearch ctermbg=black ctermfg=grey

set shell=/bin/bash

" Plugins
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'https://github.com/mattn/gist-vim'
NeoBundle 'https://github.com/mattn/webapi-vim'
NeoBundle 'eapache/rainbow_parentheses.vim'
NeoBundle 'tpope/vim-commentary'
"NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'tpope/vim-classpath.git'
NeoBundle 'tpope/vim-leiningen'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'guns/vim-clojure-highlight'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kovisoft/paredit'
NeoBundle 'pangloss/vim-javascript.git'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'fatih/vim-go'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'elzr/vim-json'
NeoBundle 'sjl/vitality.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'wting/rust.vim'

call neobundle#end()

NeoBundleCheck

let g:ctrlp_map = '<Leader>f'
let g:gist_clip_command = 'pbcopy'
let g:airline_theme='dark'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" let g:airline_theme = 'badwolf'

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Use gofmt instead of gomimports to stop deleting imports
" Not sure if this is needed, will wait until the problem pops up again.
"let g:go_fmt_command = "gofmt"

highlight GitGutterAdd ctermbg=none
highlight GitGutterChange ctermbg=none
highlight GitGutterDelete ctermbg=none
highlight GitGutterChangeDelete ctermbg=none

highlight CtrlPPrtText ctermbg=black ctermfg=gray
highlight CtrlPPrtBase ctermbg=black ctermfg=gray
highlight CursorLine ctermbg=black ctermfg=gray

highlight link coffeeSpaceError NONE

" Include JSX highlighting in `.js` files also, not just `.jsx`
let g:jsx_ext_required = 0

" Don't process focus events (Vitality) -- FocusLost/FocusGained
" I only want the cursor to change shape
let g:vitality_fix_focus = 0

" Disable bufferline integration w/ airline (having many buffers was crowded)
let g:airline#extensions#bufferline#enabled = 0
