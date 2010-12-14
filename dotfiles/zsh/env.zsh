RUBYLIB="$RUBYLIB:$RIPDIR/active/lib"
PATH="$PATH:$RIPDIR/active/bin:/opt/local/lib/postgresql83/bin"
PATH="/Users/sotaku/dev/depot_tools:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/opt/local/share/jruby/bin:/usr/local/mysql-5.0.45-osx10.4-i686/bin:/usr/local/mysql/bin:/usr/local/share/npm/bin:$PATH"


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
export EC2_PRIVATE_KEY=`ls $EC2_HOME/bnferguson/pk-*.pem`
export EC2_CERT=`ls $EC2_HOME/bnferguson/cert-*.pem`

export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Home/'

export GOROOT=`brew --cellar`/go/HEAD
export GOBIN=/usr/local/bin
export GOARCH=amd64
export GOOS=darwin

export RUBYLIB PATH
