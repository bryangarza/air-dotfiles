# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/Users/bryangarza/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd nomatch
unsetopt beep
# End of lines configured by zsh-newuser-install

bindkey -v

bindkey '^r' history-incremental-search-backward

autoload -U colors && colors

autoload predict-on
autoload predict-off
zle -N predict-on
zle -N predict-off

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% %{$reset_color%}NORMAL%{$fg_bold[yellow]%}]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1


export EDITOR=vim
export VISUAL=vim
export ANDROID_HOME=/usr/local/opt/android-sdk
export NODE_PATH=/usr/local/lib/node_modules
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

tputcolors() {
    echo
    echo -e "$(tput bold) reg  bld  und   tput-command-colors$(tput sgr0)"

    for i in $(seq 1 7); do
        echo " $(tput setaf $i)Text$(tput sgr0) $(tput bold)$(tput setaf $i)Text$(tput sgr0) $(tput sgr 0 1)$(tput setaf $i)Text$(tput sgr0)  \$(tput setaf $i)"
    done

    echo ' Bold            $(tput bold)'
    echo ' Underline       $(tput sgr 0 1)'
    echo ' Reset           $(tput sgr0)'
    echo
}

echocolors() {
    #   This file echoes a bunch of color codes to the
    #   terminal to demonstrate what's available.  Each
    #   line is the color code of one forground color,
    #   out of 17 (default + 16 escapes), followed by a
    #   test use of that color on all nine background
    #   colors (default + 8 escapes).

    T='gYw'   # The test text

    echo -e "\n                 40m     41m     42m     43m     44m     45m     46m     47m"

    for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' '  36m' '1;36m' '  37m' '1;37m'
    do FG=${FGs// /}
      echo -en " $FGs \033[$FG  $T  "
      for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
        do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
      done
      echo;
    done
    echo
}

alias v='vim'
alias vd='vimdiff'
alias ls='ls -G'
alias la='ls -AF'
alias ll='ls -l'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias rr='rm -rv'
alias c='clear'
alias fixappicons='rm ~/Library/Application\ Support/Dock/*.db ; killall Dock'
alias gc='git commit -v'
alias tmux="TERM=screen-256color-bce tmux"
alias brewu='brew update && brew upgrade'
alias tree='tree -C'
alias tmux='tmux attach || tmux new'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias bgcc='/usr/local/bin/gcc-4.9'
alias gs='git status'
alias gd='git diff'
alias gp='git push'
alias ga='git add'
alias gca='git commit -a'
alias gcam='gca -m'
alias vv='vim ~/.vimrc'
alias vz='vim ~/.zshrc'
alias emacs='/usr/local/bin/emacs'
alias ec='/usr/local/bin/emacsclient'
alias e='emacs'
alias rustup='curl -s https://static.rust-lang.org/rustup.sh | sudo sh'


PS1="%~ λ "
export PS1

### Added by the Heroku Toolbelt
export PATH="/usr/local/bin:/usr/local/heroku/bin:$PATH:$HOME/bin"

colorlist() {
    for i in {0..255}; do
        printf "\x1b[38;5;${i}mcolour${i}\n"
    done
}

colorliststraight() {
    for i in {0..255}; do
        printf "\x1b[38;5;${i}mcolour${i} "
    done
}
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH=/usr/local/sbin:$PATH
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
source /Users/bryangarza/bin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/bryangarza/Dropbox/bin/sshaliases
# for Rust
eval `/usr/libexec/path_helper -s`
