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

NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'airblade/vim-gitgutter'

NeoBundleCheck

let g:airline_theme='base16'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:bufferline_echo = 0
autocmd VimEnter *
            \ let &statusline='%{bufferline#refresh_status()}'
            \ .bufferline#get_status_string()


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

" Use ,n and ,p (:bn => :bnext; :bp => :bprevious)
map <Leader>n :bnext<CR>
map <Leader>p :bprevious<CR>


" Switch syntax highlighting on.
syntax on

" Enable loading the plugin + indent files for specific file types.
filetype plugin indent on

" Copy indent from current line when starting a new line.
set autoindent

" disable usage of cursor keys within insert mode, removes delay when pressing
" <Shift><o> immediately after <Esc>.
set noesckeys

" Fix the delete key
:fixdel

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

au FileType sh setl sw=2 sts=2 et

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
"colorscheme solarized
colorscheme hybrid

" Print the line number in front of each line.
set number

" Highlight the screen line of the cursor with CursorLine.
set cursorline
" set cursorcolumn

" View the changes you have made to a buffer since the file was loaded
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

set laststatus=2

" Handled by vim-bufferline
" set statusline=
" set statusline +=%1*\ %n\ %*            "buffer number
" set statusline +=%5*%{&ff}%*            "file format
" set statusline +=%3*%y%*                "file type
" set statusline +=%4*\ %<%F%*            "full path
" set statusline +=%2*%m%*                "modified flag
" set statusline +=%1*%=%5l%*             "current line
" set statusline +=%2*/%L%*               "total lines
" set statusline +=%1*%4v\ %*             "virtual column number
" set statusline +=%2*0x%04B\ %*          "character under cursor

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
