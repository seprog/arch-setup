# ls => eza
alias ls  'eza      --color=always --icons --group-directories-first'               # default
alias la  'eza -a   --color=always --icons --group-directories-first'               # hidden
alias ll  'eza -l   --color=always --icons --group-directories-first --total-size'  # long
alias ll  'eza -la  --color=always --icons --group-directories-first --total-size'  # long, hidden
alias lt  'eza -laT --color=always --icons --group-directories-first --total-size'  # long, hidden, tree

# colorize commands
alias grep 'grep --color=auto'
alias ip   'ip --color'
