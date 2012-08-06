RUBYLIB="$RUBYLIB:$RIPDIR/active/lib"
PATH="/usr/local/share/npm/bin:/usr/local/chromium/depot_tools:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/sbin:/opt/local/share/jruby/bin:/usr/local/mysql/bin:/usr/local/share/npm/bin:$PATH"
export FCEDIT='vim'

# customize my prompt
#PS1="\W $ "
#PS1='\[\e[0;33m\]\n\w$(__git_ps1 "(%s)")\n\! \$\[\e[0m\]'
PS1='\w$(__git_ps1 "(\[\e[0;36m\]%s\[\e[0m\])") $ '
# Make textmate my default svn commit editor
export EDITOR='mvim -f'
export MANPATH=/opt/local/share/man:$MANPATH
export RUBYOPTS="-rubygems"
# Setup Amazon EC2 Command-Line Tools
export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin
#export EC2_PRIVATE_KEY=`ls $EC2_HOME/bnferguson/pk-*.pem`
#export EC2_CERT=`ls $EC2_HOME/bnferguson/cert-*.pem`

export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Home/'

export GOROOT=`brew --cellar`/go/HEAD
export GOBIN=/usr/local/bin
export GOARCH=amd64
export GOOS=darwin

export NODE_PATH='/usr/local/lib/node'

export RUBYLIB PATH

export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000
export TITANIUM_DIR=~/Library/Application\ Support/Titanium/mobilesdk/osx/1.8.2
export GYP_DEFINES='mac_sdk=10.6'

export CPLUS_INCLUDE_PATH="/usr/local/include:$CPLUS_INCLUDE_PATH"
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:/usr/local/lib/python:$PYTHONPATH"
export ROS_OS_OVERRIDE=osxbrew:lion
