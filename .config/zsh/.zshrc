export ZSH="/home/kuba/.oh-my-zsh"
export EDITOR="/usr/bin/vim"

plugins=(fzf git oc kubectl helm ansible gcloud terraform docker aws asdf) 

source $ZSH/oh-my-zsh.sh

# install exa, teamocil, awsp
alias ll='exa --icons --header --long'
alias lt='exa --icons --tree --level=2'
alias tt="teamocil.ruby2.7 --here sky"
alias awsp="source _awsp"

#alias cat="highlight -O ansi --force"
eval "$(starship init zsh)"

