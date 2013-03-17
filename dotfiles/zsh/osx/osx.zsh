# OS X specific settings

export PATH=~/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH
# export EDITOR='mvim -f'
export EDITOR='subl -n -w'

# Use OS X version of SSH with agent forwarding
alias ssh='/usr/bin/ssh -A'
alias scp='/usr/bin/scp'
alias sftp='/usr/bin/sftp'

alias ls='ls -ahGl'
alias e="mvim ."
alias emacs="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs -nw"

source "/usr/local/share/zsh/site-functions"

fpath=(~/.dotfiles/zsh/osx/functions $fpath)
autoload -U ~/.dotfiles/zsh/osx/functions/*(:t)

localhost() {
  sudo dscl localhost -create /Local/Default/Hosts/$1 IPAddress 127.0.0.1
  echo "Added $1 at address 127.0.0.1"
}

mac2unix() {
  cat $1 | tr '\r' '\n'
}

unix2mac() {
  cat $1 | tr '\r' '\n'
}

dos2unix() {
  cat $1 | tr -d '\r'
}
ulimit -n 4096

source "/usr/local/Cellar/rbenv/0.2.1/libexec/../completions/rbenv.zsh"

export GOROOT=`brew --cellar`/go/HEAD
export GOBIN=/usr/local/bin
export GOARCH=amd64
export GOOS=darwin
export GYP_DEFINES='mac_sdk=10.8'
export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Home/'
