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
    grep -B2 -A2 -rin --colour --exclude-dir .ropeproject --include \*.py "$1" ${2:-.}
}
