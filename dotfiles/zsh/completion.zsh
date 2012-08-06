autoload -U compinit
compinit -d ~/.zshdumpfile


# autocompletion for ruby_test
# works with tu/tf aliases
_ruby_tests() {
  if [[ -n $words[2] ]]; then
    compadd `ruby_test -l ${words[2]}`
  fi
}
compdef _ruby_tests ruby_test

# autocompletion for ruby_tu_rs
# works with su/sf aliases
_ruby_mixed_tests() {
  if [[ -n $words[2] ]]; then
    compadd `ruby_tu_rs -l ${words[2]}`
  fi
}
compdef _ruby_mixed_tests ruby_tu_rs

_git_remote_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    if (( CURRENT == 2 )); then
      # first arg: operation
      compadd create publish rename delete track
    elif (( CURRENT == 3 )); then
      # second arg: remote branch name
      compadd `git branch -r | grep -v HEAD | sed "s/.*\///" | sed "s/ //g"`
    elif (( CURRENT == 4 )); then
      # third arg: remote name
      compadd `git remote`
    fi
  else;
    _files
  fi
}
compdef _git_remote_branch grb

# autocompletion for schema
_rails_tables() {
  if [[ -n $words[2] ]]; then
    compadd `schema -l ${words[2]}`
  fi
}
compdef _rails_tables schema


# Parses the ssh known_hosts file for previously visited hosts, then offers
# them for completions in ssh, scp and sftp commands.

local knownhosts
knownhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
zstyle ':completion:*:(ssh|scp|sftp):*' hosts $knownhosts
