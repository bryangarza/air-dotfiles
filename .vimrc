" Use Vim settings, rather than Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible
set encoding=utf-8

" Set terminal title to filename
set title

" Plugins
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'https://github.com/mattn/gist-vim'
NeoBundle 'https://github.com/mattn/webapi-vim'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'tpope/vim-classpath.git'
NeoBundle 'tpope/vim-leiningen'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'guns/vim-clojure-highlight'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'vim-scripts/paredit.vim'
NeoBundle 'pangloss/vim-javascript.git'

NeoBundleCheck

let g:ctrlp_map = '<Leader>f'
let g:gist_clip_command = 'pbcopy'
let g:airline_theme='dark'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

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
" Note: This broke colors.
"set background=dark

" Set the color scheme.
"colorscheme koehler
"colorscheme elflord
"colorscheme hybrid
colorscheme peachpuff
let g:hybrid_use_iTerm_colors = 1
highlight LineNr ctermfg=238

" Print in black and white
set printoptions+=syntax:n

highlight clear SignColumn
let g:gitgutter_sign_modified_removed = 'x'

" Print the line number in front of each line.
set number

" Highlight the screen line of the cursor with CursorLine.
set cursorline
" set cursorcolumn
highlight CursorLine cterm=NONE ctermbg=233

" View the changes you have made to a buffer since the file was loaded
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

set laststatus=2

" Highlight the trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
" To 'auto-trim' trailing whitespace
"autocmd BufWritePre     *.rb :call TrimWhiteSpace()

au FileType sh setl sw=2 sts=2 et
au FileType javascript setl sw=2 sts=2 et
au FileType ruby setl sw=2 sts=2 et
au FileType eruby setl sw=2 sts=2 et
au FileType css setl sw=2 sts=2 et
au FileType scss setl sw=2 sts=2 et
au FileType java setl sw=4 sts=4 et
au FileType html setl sw=2 sts=2 et wrap tw=0 wrapmargin=0 lbr
au FileType jade setl sw=2 sts=2 et wrap tw=0 wrapmargin=0 lbr

set pastetoggle=<F10>
nnoremap <F11> :set nonumber!<CR>

" underline matches instead of highlighting with that ugly yellow
highlight Search ctermfg=black ctermbg=white
highlight IncSearch ctermbg=black ctermfg=grey
