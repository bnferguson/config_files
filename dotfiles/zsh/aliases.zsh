# cd
alias ..="cd .."
alias cdd="cd -"
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# Finder
alias o="open . &"
alias ff="open -a Firefox"

# Gems
alias gi="sudo gem install"
alias giv="sudo gem install -v"

# Git
alias g="git status"
alias gst="git status"
alias gb="git branch"
alias gp="git push"
alias gl="git pull"
alias gadd="git add -u && git add . && git status"
alias gci="git pull --rebase && rake && git push"
alias gc="git commit"
alias gca="git commit -a"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gal="git log --decorate --stat --graph --pretty=format:'%C(yellow)%h%Creset (%ar - %Cred%an%Creset), %s%n'"

#alias gm="git merge"
alias gconf="$EDITOR .git/config"

# ls
alias l="ls -laGh"

# Rails
alias migrate="rake db:migrate db:test:prepare"
alias remigrate="rake db:migrate && rake db:migrate:redo && rake db:schema:dump db:test:prepare"
alias r="rake"
alias rr="touch tmp/restart.txt"
alias ss='rails server'
alias sc='rails console'
alias a='autospec -rails'

alias b='bundle exec'
alias be="bundle exec"
alias s="bundle exec rspec"
alias cuc="bundle exec cucumber --guess"

alias reload="source ~/.dotfiles/zsh/aliases.zsh"
alias ea="$EDITOR ~/.dotfiles/zsh/aliases.zsh && reload"
alias e="$EDITOR ."
