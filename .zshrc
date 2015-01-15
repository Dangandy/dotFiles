#Created by newuser for 5.0.7
alias ls='ls --color'

#change the prompt to coloured
autoload -U colors && colors
PS1="%{$fg[green]%}%! %{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
