# vim:ft=zsh ts=2 sw=2 sts=2

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_AWS_PREFIX="%{$fg_bold[red]%}‹"
ZSH_THEME_AWS_SUFFIX="›%{$reset_color%}"

ZSH_THEME_AWS_PREFIX="%{$fg_bold[green]%}‹aws:"
ZSH_THEME_AWS_SUFFIX="›%{$reset_color%}"

ZSH_THEME_UPLYNK_PREFIX="%{$fg_bold[blue]%} ‹uplynk:"
ZSH_THEME_UPLYNK_SUFFIX="›%{$reset_color%}"

ZSH_THEME_VIRTUALENV_PREFIX="%{$fg_bold[red]%} ["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"

current_time_millis() {
    local time_millis;
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        # Linux
        time_millis="$(date +%s.%3N)";
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        time_millis="$(gdate +%s.%3N)";
    fi
    echo $time_millis;
}

output_command_execute_after() {
	local last_cmd_return_code=$?;
    if [ "$COMMAND_TIME_BEIGIN" = "-20200325" ] || [ "$COMMAND_TIME_BEIGIN" = "" ];
    then
        return 1;
    fi

    # cmd
    local cmd="${$(fc -l | tail -1 | cut -d' ' -f5-)#*  }";
    local color_cmd="";
    if $1;
    then
        color_cmd="$fg_no_bold[green]";
    else
        color_cmd="$fg_bold[red]";
    fi
    local color_reset="$reset_color";
    cmd="${color_cmd}${cmd}${color_reset}"

    # cost
    local time_end="$(current_time_millis)";
    local cost=$(bc -l <<<"${time_end}-${COMMAND_TIME_BEIGIN}");
    COMMAND_TIME_BEIGIN="-20200325"
    local length_cost=${#cost};
    if [ "$length_cost" = "4" ];
    then
        cost="0${cost}"
    fi
    cost="[${cost}s]"
    local color_cost="$fg_no_bold[cyan]";
    cost="${color_cost}${cost}${color_reset}";

	echo -e "";
	echo -e "${cost} ${cmd}";
  	[[ $last_cmd_return_code -ne 0 ]] && echo "$bg[red]$fg[yellow]ERR: $last_cmd_return_code$reset_color "
}

precmd() {
	output_command_execute_after $last_cmd_result;
}

preexec() {
	COMMAND_TIME_BEIGIN="$(current_time_millis)";
}

uname_host() {
    [[ $(hostname) == "DESKTOP-44LKJ9V" && $(whoami) == "gregory" ]] && return
    echo "%n@%m:"
}

RPROMPT="$STY $RPROMPT %{$fg_bold[red]%}%*%{$reset_color%}"
PROMPT='%{$fg_bold[green]%}$(uname_host)%~%{$reset_color%}$(git_prompt_info)
$ '


