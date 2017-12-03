HISTFILESIZE=2500

export PATH=/usr/local/bin:$PATH

alias gitadd="git add -u :/"
alias gitmerge="git merge --no-ff"
alias gitreset="git reset --hard HEAD"
alias gitamend="git commit --amend --no-edit"
alias gitundo="git reset --hard HEAD~1"
alias gitsubup="git submodule update --init --recursive --remote"
alias gitclean="git clean -fd"

export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

COLOR_YELLOW="\[\033[1;33m\]"
COLOR_RED="\[\e[31;10m\]"
COLOR_GREEN="\[\e[32;10m\]"
COLOR_BLUE="\[\e[34;10m\]"
COLOR_NONE="\[\e[0m\]"
COLOR_NONEP="\[\e[38;0m\]"

parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

prompt_func() {
    prompt="${COLOR_YELLOW}\w${COLOR_GREEN}$(parse_git_branch)${COLOR_NONEP} $"
    if test $? -eq 0
    then
        PS1="${prompt}${COLOR_NONEP}${COLOR_NONE} "
    else
        PS1="${prompt}${COLOR_RED}${COLOR_NONE} "
    fi
}

PROMPT_COMMAND=prompt_func
