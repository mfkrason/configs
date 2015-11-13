# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [[ $- == *i* ]]
then
	. $HOME/.configs/bashrc
fi

