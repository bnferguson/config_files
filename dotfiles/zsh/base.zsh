system_name=`uname -a`

source ~/.dotfiles/zsh/env.zsh

fpath=(~/.dotfiles/zsh/functions $fpath)

source ~/.dotfiles/zsh/aliases.zsh
source ~/.dotfiles/zsh/completion.zsh
source ~/.dotfiles/zsh/prompt.zsh
source ~/.dotfiles/zsh/title.zsh
source ~/.dotfiles/zsh/misc.zsh
source ~/.dotfiles/zsh/history.zsh

autoload -U ~/.dotfiles/zsh/functions/*(:t)

setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps

setopt autopushd # Use pushd for all directory changing

# Load vendor specific scripts
case $system_name in
  Darwin*)
    source ~/.dotfiles/zsh/osx/osx.zsh
    ;;
  *)
    source ~/.dotfiles/zsh/linux/linux.zsh
    ;;;
esac

export PATH="/Users/bnferguson/.rbenv/shims:${PATH}"
source "/usr/local/Cellar/rbenv/0.2.1/libexec/../completions/rbenv.zsh"

rbenv rehash 2>/dev/null

function rbenv() {
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  shell)
    eval `rbenv "sh-$command" "$@"`;;
  *)
    command rbenv "$command" "$@";;
  esac
}

