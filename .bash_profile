# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/env.sh ]; then
	. ~/env.sh
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
