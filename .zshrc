#Created by newuser for 5.0.7
alias ls='ls --color'

#change the prompt to coloured
autoload -U colors && colors
PS1="%{$fg_bold[green]%}%! %{$fg_bold[red]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m %{$fg_bold[yellow]%}%~ %{$reset_color%}%% "

PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets
# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid

# vi editing mode
bindkey -v

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
function zle-line-init() {
echoti smkx
}
function zle-line-finish() {
echoti rmkx
}
zle -N zle-line-init
zle -N zle-line-finish
fi

if [[ "${terminfo[kpp]}" != "" ]]; then
bindkey "${terminfo[kpp]}" up-line-or-history # [PageUp] - Up a line of history
fi
if [[ "${terminfo[knp]}" != "" ]]; then
bindkey "${terminfo[knp]}" down-line-or-history # [PageDown] - Down a line of history
fi

if [[ "${terminfo[khome]}" != "" ]]; then
bindkey "${terminfo[khome]}" beginning-of-line # [Home] - Go to beginning of line
fi
if [[ "${terminfo[kend]}" != "" ]]; then
bindkey "${terminfo[kend]}" end-of-line # [End] - Go to end of line
fi

bindkey '^[[1;5C' forward-word # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word # [Ctrl-LeftArrow] - move backward one word

bindkey '^?' backward-delete-char # [Backspace] - delete backward
if [[ "${terminfo[kdch1]}" != "" ]]; then
bindkey "${terminfo[kdch1]}" delete-char # [Delete] - delete forward
else
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char
fi



# up arrow (history search)
if [[ -n $terminfo[kcuu1] ]]; then
bindkey "$terminfo[kcuu1]" history-beginning-search-backward
bindkey -M vicmd "$terminfo[kcuu1]" history-beginning-search-backward
fi
bindkey '^[[A' history-beginning-search-backward
# down arrow (history search)
if [[ -n $terminfo[kcud1] ]]; then
bindkey "$terminfo[kcud1]" history-beginning-search-forward
bindkey -M vicmd "$terminfo[kcud1]" history-beginning-search-forward
fi
bindkey '^[[B' history-beginning-search-forward
# left arrow (whichwrap)
if [[ -n $terminfo[kcub1] ]]; then
bindkey "$terminfo[kcub1]" backward-char
bindkey -M vicmd "$terminfo[kcub1]" backward-char
fi
# right arrow (whichwrap)
if [[ -n $terminfo[kcuf1] ]]; then
bindkey "$terminfo[kcuf1]" forward-char
bindkey -M vicmd "$terminfo[kcuf1]" forward-char
fi
# shift-left
if [[ -n $terminfo[kLFT] ]]; then
bindkey "$terminfo[kLFT]" vi-backward-word
bindkey -M vicmd "$terminfo[kLFT]" vi-backward-word
fi
# shift-right
if [[ -n $terminfo[kRIT] ]]; then
bindkey "$terminfo[kRIT]" vi-forward-word
bindkey -M vicmd "$terminfo[kRIT]" vi-forward-word
fi
# ctrl-left
bindkey '^[[1;5D' vi-backward-blank-word
bindkey '^[[1;5C' vi-forward-blank-word
bindkey '^i' expand-or-complete-prefix
bindkey '^W' backward-kill-word
bindkey -M vicmd 'h' backward-char
bindkey -M vicmd 'l' forward-char
bindkey -M vicmd '^R' redo
bindkey -M vicmd 'u' undo
bindkey -M vicmd 'ga' what-cursor-position
bindkey -M vicmd 'v' edit-command-line
