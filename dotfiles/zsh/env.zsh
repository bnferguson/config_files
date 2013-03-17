RUBYLIB="$RUBYLIB:$RIPDIR/active/lib"
PATH="/usr/local/share/npm/bin:/usr/local/chromium/depot_tools:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/sbin:/opt/local/share/jruby/bin:/usr/local/mysql/bin:/usr/local/share/npm/bin:$PATH"

# customize my prompt
PS1='\w$(__git_ps1 "(\[\e[0;36m\]%s\[\e[0m\])") $ '

export MANPATH=/opt/local/share/man:$MANPATH
export RUBYOPTS="-rubygems"

export RUBYLIB PATH

export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000

export CPLUS_INCLUDE_PATH="/usr/local/include:$CPLUS_INCLUDE_PATH"
