#
# ~/.zshrc.d/90-aliases.zsh
# 
#

if [[ $EUID -ne 0 ]]; then
    alias sudo='sudo ' # needed for using aliases with sudo
    alias please='sudo '
fi
alias ..='cd ..'
alias amiinscreen='echo $STY'
alias bpython='clear && bpython'
alias cal='cal -m'
alias cp='cp -i'
alias dotdrop='eval $(cat ~/dotfiles/env.defaults ~/dotfiles/.env | grep -v "^#") /usr/bin/dotdrop --cfg=~/dotfiles/config.yaml'
alias fuck='sudo $(fc -ln -1)'
alias gst='git status -u'
alias home='cd ~/'
alias ll='ls -la'
alias ls='ls -h --color=auto --group-directories-first'
alias mv='mv -i'
alias mynload='nload -t 1000 -i 500 -o 100 -u K'
alias nano='nano -cw'
alias pa='pacaur'
alias pprint='python -m json.tool'
alias radio='~/scripts/radio/radio.sh'
alias rm='rm -i'
alias seconds='while true; do; date +"%H:%m:%S"; sleep 1; done'
alias syncit='~/scripts/syncit/syncit.sh'
alias whereami='pwd'
alias worms='worms -d 40 -l 16 -n 6'
if which docker > /dev/null 2>&1; then
    alias docker-cleanup='docker rm -v $(docker ps -a -q -f status=exited) && docker rmi $(docker images -f "dangling=true" -q)'
    alias djoin='cont=$(docker ps --format="{{.ID}}" | head -n 1) && docker exec -it "$cont" bash'
fi
if which tremc > /dev/null 2>&1; then
    alias bt='tremc'
fi
