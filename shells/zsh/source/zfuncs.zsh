
pathAppend() {
  # Only adds to the path if it's not already there
  if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
    PATH=$PATH:$1
  fi
}

# Remove duplicate entries from PATH:
PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')


alias mv='mv -i'
for c in cp rm chmod chown rename; do
  alias $c="$c -v"
done


# Make a new command in ~/bin
makecommand() {
  if [ -z "$1" ]; then
    echo "Gotta specify a command name, champ" >&2
    return 1
  fi

  mkdir -p ~/bin
  local cmd=~/bin/$1
  if [ -e $cmd ]; then
    echo "Command $1 already exists" >&2
  else
    echo "#!${2:-/bin/sh}" >$cmd
  fi

  vix $cmd
}



# Directories to be prepended to $PATH
declare -a dirs_to_prepend
dirs_to_prepend=(
  "/usr/bin"


)



for dir in ${(k)dirs_to_prepend[@]}
do
  if [ -d ${dir} ]; then
    # If these directories exist, then prepend them to existing PATH
    PATH="${dir}:$PATH"
  fi
done

unset dirs_to_prepend

export PATH



lowercaseCurrentDir(){
  for i in *; do mv $i ${(L)i}; done
}

# Show my $PATH
path(){
  echo -e ${PATH//:/\\n}
}


# mdg <dir-name> - Create dir and .go file of <dir-name> name.
mdg() {
    md $1
    touch $1.go
}



# ram <process-name> - Find how much RAM a process is taking.
ram() {
  local sum
  local items
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
      sum=$(($i + $sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
}



