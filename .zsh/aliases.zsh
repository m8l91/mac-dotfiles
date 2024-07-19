##  Aliases
#make zsh autocomplete with up arrow
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# ---
#
# alias docker="nerdctl"
alias k="kubectl"
alias h="helm"
alias tf="terraform"
alias a="ansible"
alias ap="ansible-playbook"
alias dt="datree"
alias vi="lvim"
alias gitdog="git log --all --decorate --oneline --graph"

# mac OS shortcuts
alias code="open -a 'Visual Studio Code'"



# ALIAS COMMANDS
alias g="goto"
alias grep='grep --color'

alias cbp="code /home/xcad/obsidianvault/boilerplates"
alias cpr="code /home/xcad/obsidianvault/projects"

# Scripts
alias repos="op run --env-file="/Users/xcad/.env" -- python3 /Users/xcad/Projects/christianlempa/scripts/repos"

## Autocompletion AWS l
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/opt/homebrew/bin/aws_completer' aws
source <(kubectl completion zsh)

