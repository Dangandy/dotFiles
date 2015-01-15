#Created by newuser for 5.0.7
alias ls='ls --color'

#change the prompt to coloured
autoload -U colors && colors
PS1="%{$fg_bold[green]%}%! %{$fg_bold[red]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m %{$fg_bold[yellow]%}%~ %{$reset_color%}%% "
