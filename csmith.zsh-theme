########## COLOR ###########
for COLOR in CYAN WHITE YELLOW MAGENTA BLACK BLUE RED DEFAULT GREEN GREY; do
    eval PR_$COLOR='%{$fg[${(L)COLOR}]%}'
    eval PR_BRIGHT_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done
PR_RESET="%{$reset_color%}"
RED_START="${PR_RESET}${PR_GREY}<${PR_RESET}${PR_MAGENTA}<${PR_BRIGHT_MAGENTA}<${PR_RESET} "
RED_END="${PR_RESET}${PR_BRIGHT_RED}>${PR_RESET}${PR_RED}>${PR_GREY}>${PR_RESET} "
GREEN_END="${PR_RESET}${PR_BRIGHT_GREEN}>${PR_RESET}${PR_GREEN}>${PR_GREY}>${PR_RESET} "
GREEN_BASE_START="${PR_RESET}${PR_GREY}>${PR_RESET}${PR_GREEN}>${PR_BRIGHT_GREEN}>${PR_RESET}"
GREEN_START_P1="${PR_RESET}${GREEN_BASE_START}${PR_RESET} "
DIVISION="${PR_RESET}${PR_RED} < ${PR_RESET}"
VCS_DIRTY_COLOR="${PR_RESET}${PR_YELLOW}"
VCS_CLEAN_COLOR="${PR_RESET}${PR_GREEN}"
VCS_SUFIX_COLOR="${PR_RESET}${PR_RED}› ${PR_RESET}"
# ########## COLOR ###########
# ########## SVN ###########
ZSH_THEME_SVN_PROMPT_PREFIX="${PR_RESET}${PR_RED}‹svn:"
ZSH_THEME_SVN_PROMPT_SUFFIX=""
ZSH_THEME_SVN_PROMPT_DIRTY="${VCS_DIRTY_COLOR} ✘${VCS_SUFIX_COLOR}"
ZSH_THEME_SVN_PROMPT_CLEAN="${VCS_CLEAN_COLOR} ✔${VCS_SUFIX_COLOR}"
# ########## SVN ###########
# ########## GIT ###########
ZSH_THEME_GIT_PROMPT_PREFIX="${PR_RESET}${PR_RED}‹git:"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="${VCS_DIRTY_COLOR} ✘${VCS_SUFIX_COLOR}"
ZSH_THEME_GIT_PROMPT_CLEAN="${VCS_CLEAN_COLOR} ✔${VCS_SUFIX_COLOR}"
ZSH_THEME_GIT_PROMPT_ADDED="${PR_RESET}${PR_YELLOW} ✚${PR_RESET}"
ZSH_THEME_GIT_PROMPT_MODIFIED="${PR_RESET}${PR_YELLOW} ✹${PR_RESET}"
ZSH_THEME_GIT_PROMPT_DELETED="${PR_RESET}${PR_YELLOW} ✖${PR_RESET}"
ZSH_THEME_GIT_PROMPT_RENAMED="${PR_RESET}${PR_YELLOW} ➜${PR_RESET}"
ZSH_THEME_GIT_PROMPT_UNMERGED="${PR_RESET}${PR_YELLOW} ═${PR_RESET}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${PR_RESET}${PR_YELLOW} ✭${PR_RESET}"
# ########## GIT ###########
# Context: user@directory or just directory
prompt_context () {
    if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
        echo -n "${PR_RESET}${PR_BRIGHT_BLUE}$USER@%m${PR_RESET}${PR_RESET}$(git_prompt_info)$(svn_prompt_info)%{${fg_bold[red]}%} ♥ ${PR_CYAN}%D{%R.%S %a %b %d %Y}${PR_BRIGHT_CYAN}%~%<<${PR_RESET}"
    else
        echo -n "${PR_RESET}${PR_BRIGHT_YELLOW}%~%<<${PR_RESET}"
    fi
}

set_prompt () {
    # required for the prompt
    setopt prompt_subst
    autoload zsh/terminfo

    # ######### PROMPT #########
    PROMPT='${PROMPT_HEAD}
${RED_START}$(prompt_context)
${GREEN_START_P1}'
    RPROMPT='%(?,%F{green}:%),%F{yellow}%? %F{red}:()%f ${PR_RESET}$(git_prompt_info)$(svn_prompt_info) $(battery_level_gauge) ${GREEN_END}${PR_RESET}'
    # Matching continuation prompt
    PROMPT2='${GREEN_BASE_START}${PR_RESET} %_ ${GREEN_BASE_START}${PR_RESET} '
    # ######### PROMPT #########
    # ######## PROMPT REFRESH ##############
}

set_prompt
TMOUT=60

TRAPALRM() {
    zle reset-prompt
}
    # ######## PROMPT REFRESH ##############
