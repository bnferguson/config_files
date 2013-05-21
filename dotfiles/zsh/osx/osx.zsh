# OS X specific settings

export EDITOR='mvim -f'
#export EDITOR='subl -n -w'

export OF_ROOT="/Users/bnferguson/dev/OpenFrameworks"
export GYP_DEFINES='mac_sdk=10.8'
export JAVA_HOME="$(/usr/libexec/java_home)"
export GOROOT='/usr/local/Cellar/go/HEAD'
export GOARCH='amd64'
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:~/usr/local/bin:/opt/local/bin:/opt/local/sbin:$GOROOT/bin:$JAVA_HOME/bin:/usr/local/riak-cs/bin:/usr/local/stanchion/bin:$PATH
# Use OS X version of SSH with agent forwarding
alias ssh='/usr/bin/ssh -A'
alias scp='/usr/bin/scp'
alias sftp='/usr/bin/sftp'

alias ls='ls -ahGl'
alias emacs="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs -nw"

source "/usr/local/share/zsh/site-functions"

fpath=(~/.dotfiles/zsh/osx/functions $fpath)
autoload -U ~/.dotfiles/zsh/osx/functions/*(:t)

localhost() {
  sudo dscl localhost -create /Local/Default/Hosts/$1 IPAddress 127.0.0.1
  echo "Added $1 at address 127.0.0.1"
}
export SCALA_HOME=/usr/local/Cellar/scala/2.10.1/libexec

# Faster sbt and the like
# export JAVACMD=drip
# export DRIP_SHUTDOWN=30
export SBT_OPTS="-XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:PermSize=128M -XX:MaxPermSize=512M -Djava.library.path=/usr/local/share/OpenCV/java"


ulimit -n 4096


