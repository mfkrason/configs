
gen_ctags()
{
	ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q  --exclude=install --exclude=build --exclude=obj --exclude=.hg --exclude=.waf*
}

export BASE_PATH=/usr/local/bin:/bin:/usr/bin

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
	PRE_EMBER=$PATH
	source /opt/ember-toolchain-0.1.13/environment.sh
	PE_LIST=$(echo $PRE_EMBER | sed "s/:/ /g")
	PO_LIST=$(echo $PATH | sed "s/:/ /g")
	#comm -23 <(echo $PE_LIST | sort) <(echo $PO_LIST | sort )
}

export PROMPT_COMMAND=__prompt_command

export CC=clang
export CXX=clang++


alias grep='grep --color=always'
alias ls='ls --color=always'

source /opt/linuxbrew/environment.sh
setup_ember

if [[ -d $(brew --prefix)/etc/bash_completion.d ]]; then
	echo 'brew'
	source $(brew --prefix)/etc/bash_completion.d/*
fi

if [[ -f /etc/bash_completion ]]; then
	. /etc/bash_completion
fi

