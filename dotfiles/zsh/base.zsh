system_name=`uname -a`

source ~/.dotfiles/zsh/env.zsh

fpath=(~/.dotfiles/zsh/functions $fpath)

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

[[ -s "/Users/bnferguson/.rvm/scripts/rvm" ]] && source "/Users/bnferguson/.rvm/scripts/rvm"
