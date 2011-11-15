git_diff_color() {
  changes=$(git status)
  case $changes in
    *Untracked*)
      echo "%{$fg[red]%}"
      return
    ;;;

    *updated*)
      echo "%{$fg[red]%}"
      return
    ;;;

    *committed*)
      echo "%{$fg[green]%}"
      return
    ;;;
  esac
}

git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    echo "[%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}]"
  fi
}

autoload -U colors
colors

setopt prompt_subst

# If we're running in an ssh session, use a different colour
# than if we're on a local machine

host_prompt_color() {
  case ${SSH_CLIENT} in
    [0-9]*)
      echo "%{$fg[yellow]%}"
    ;;;

    *)
      echo "%{$fg[blue]%}"
    ;;;
  esac
}

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='$(git_prompt_info)[${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%~%{$reset_color%}] '
