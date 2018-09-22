test "${BASH_RC}" && return
BASH_RC=1

source ~/.bash_colors
function printf_n() {
	str=$1
	num=$2
	v=$(printf "%0.s${str}" $(seq 1 $num))
	echo $v
}

export PATH=/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2017/Professional/Common7/IDE/:~/scripts/:~/links:$PATH

DEVENV=devenv.exe
DIFFPROG=winmerge
HISTSIZE=100000
HISTFILESIZE=200000
HISTCONTROL=ignoreboth:ignoredups:ignorespace:erasedups
shopt -s histappend
shopt -s checkwinsize
PROMPT_COMMAND='history -a ; history -n'

alias ls='ls --color'
alias regsvr='/cygdrive/c/Windows/System32/regsvr32.exe'

function e {
    P=$(pwd)
    if [[ $# > 0 ]] ; then
        P=$1
    fi
    if [[ $(uname -a) =~ .*Linux.* ]] ; then
        xdg-open $P
    else
        path2win "$P" | xargs explorer ; echo
    fi
}

alias reload='exec bash'

function joke {
	#echo $(shuf -n 1 ~/1liners.txt)
	JOKE=$[ $RANDOM % 15 ]
	if [[ "$JOKE" == "1" ]] ; then
		JOKE="$(shuf -n 1 ~/1liners2.txt)"
	else
		JOKE=""
	fi
	printf "$JOKE\n"

}
function err
{
    ERR=$?
    if [[ "$ERR" != "0" ]] ; then
        echo -e ${BG_RED}Task FAILED. Error code: $ERR$BG_NC
        exit $ERR
    fi
}
function errorcode {
    EXIT_CODE=$?
    if [[ "$EXIT_CODE" != "0" ]] ; then
        printf "${BG_RED}Error: $EXIT_CODE "
    fi
    return $EXIT_CODE
}
GREEN='\e[1;32m'
NC='\e[0m'              # No Color
PROMPT_SYMBOL='#'
PS1='`errorcode`'"${FG_GREEN}[\[\t] \w${FG_NC} ${FG_CYAN}"'$(__git_ps1 "<%s> ")''`joke`'"${FG_NC}${BG_NC}\n$PROMPT_SYMBOL "
source $HOME/.git-completion.bash

alias npp='cyg-wrapper.sh npp --fork=1'
alias gvim='cyg-wrapper.sh gvim --fork=1'
alias g="cyg-wrapper.sh gvim --fork=1"
alias winmerge="cyg-wrapper.sh winmerge --fork=1"
alias dw="cyg-wrapper.sh /cygdrive/e/Stuff/dw/depends.exe --fork=1"
alias handle="/cygdrive/e/Stuff/Handle/handle64.exe"
