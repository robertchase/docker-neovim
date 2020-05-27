export SHELL=/bin/bash
export LS_OPTIONS='--color=auto'
# eva "`dircolors`"
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
export PS1="\[\033[33m\]neovim\[\033[37m\]:\w# "

alias viz='nvim $(fzf)'

function pygrep ()
{
    grep -B2 -A2 -rin --colour --exclude-dir .ropeproject --include \*.py "$1" ${2:-.}
}
