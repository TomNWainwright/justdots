# In the definitions below, you will see use of function definitions instead of
# aliases for some cases. We use this method to avoid expansion of the alias in
# combination with the globalias plugin.



# Generic command adaptations
alias grep='() { $(whence -p grep) --color=auto $@ }'
alias egrep='() { $(whence -p egrep) --color=auto $@ }'

alias unpack='sudo dpkg -i'
alias afix='sudo apt-get install -f'
alias ai='sudo apt install'
alias au='sudo apt update'
alias aup='sudo apt upgrade'
alias ar='sudo apt remove'
alias ap='sudo apt purge'
alias aar='sudo apt autoremove'

alias as='apt search'




alias synaptic='sudo synaptic'


alias ccat='highlight -O ansi'
alias rm='rm -v'

# Directory management
alias la='ls -A'
alias ll='ls -l'
alias lal='ls -Al'

