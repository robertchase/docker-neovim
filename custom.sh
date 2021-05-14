export SHELL=/bin/bash
export LS_OPTIONS='--color=auto'
eval "`dircolors`"

# dark mode:
# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
# export PS1="\[\033[33m\]neovim\[\033[37m\]:\w# "

alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
export PS1="\[\033[01;34m\]neovim\[\033[0m\]:\w# "

alias viz='nvim $(fzf)'

function pygrep ()
{
    grep -B2 -A2 -rin --colour --include \*.py "$1" ${2:-.}
}

function pyfiles {
    find ${1:-.} -name \*.py -exec grep . {} + | awk -F: '{print $1}' | sort -u
}

# very approximate line count
function pylines {
    find ${1:-.} -name \*.py -exec grep . {} + | grep -v 'py: *#' | wc -l
}
