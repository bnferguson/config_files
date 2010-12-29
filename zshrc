# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR="mvim -f"

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# vi mode
bindkey -v

# use incremental search
bindkey '^R' history-incremental-search-backward

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep more history
export HISTSIZE=200

export PATH=~/bin:/usr/local/sbin:/usr/local/git/libexec/git-core/:/usr/local/bin:/opt/local/bin:/usr/local/mysql/bin/:$EC2_HOME/bin:$PATH:~/dev/util/jruby/bin

source ~/.dotfiles/zsh/base.zsh

cdpath=(~ ~/dev/mobi ~/Desktop/Inbox ~/dev/chef)

if [[ -s /Users/bnferguson/.rvm/scripts/rvm ]] ; then source /Users/bnferguson/.rvm/scripts/rvm ; fi

cd ~/dev/mobi
