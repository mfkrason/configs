
gen_ctags()
{
	ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q  --exclude=install --exclude=build --exclude=obj --exclude=.hg --exclude=.waf*
}

# User specific aliases and functions
#source /opt/ember-toolchain-0.1.11/environment.sh

if [[ $- == *i* ]]
then
	bind '\e[A: history-search-backward'
	bind '\e[B: history-search-forward'
fi

function __prompt_command()
{
	local EXIT="$?"
	PS1=''

	PS1="[$EXIT \w]\n$ "
}

function generate_waf_project()
{
	if [ -z "$1" ]
	then
		return
	fi

	mkdir -p $1
	cp $HOME/.configs/scripts/waf/wscript $1/
	cp $HOME/.configs/scripts/waf/waf $1/
	touch $1/main.cpp
}

function setup_ember()
{
	source /opt/ember-toolchain-0.1.11/environment.sh
}

function brew_environment()
{
	export PATH=/opt/linuxbrew/bin:$PATH
	export PATH=/opt/linuxbrew/sbin:$PATH
	export MANPATH=/opt/linuxbrew/man:$MANPATH
	export INFOPATH=/opt/linuxbrew/info:$INFOPATH
}

export PROMPT_COMMAND=__prompt_command

export CC=clang
export CXX=clang++


alias grep='grep --color=always'
alias ls='ls --color=always'

