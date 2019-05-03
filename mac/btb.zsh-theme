local ret_status="%(?:%{$fg_bold[magenta]%}λ :%{$fg_bold[red]%}λ )"
PROMPT='${ret_status} %{$fg[magenta]%}%c%{$reset_color%} $(git_prompt_info)> '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[megent]%}|%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[megent]%}| %{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[megent]%}|"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}|"
