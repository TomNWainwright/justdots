LOGCHECK=60           # Time (seconds) between checks for login/logout activity.
REPORTTIME=5          # Display usage statistics for commands running > 5 sec.
#WORDCHARS="\"*?_-.[]~=/&;!#$%^(){}<>\""
#WORDCHARS="\"*?_-[]~&;!#$%^(){}<>\""
WORDCHARS='`~!@#$%^&*()-_=+[{]}\|;:",<.>/?'"'"

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
HYPHEN_INSENSITIVE="true"
setopt autocd                   
setopt append_history          
setopt extended_history       
setopt share_history            
setopt hist_expire_dups_first   
setopt hist_find_no_dups        
setopt hist_ignore_dups         
setopt hist_ignore_all_dups     
setopt hist_reduce_blanks       
setopt hist_save_no_dups        
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_verify              
setopt inc_append_history        
setopt bang_hist                # !keyword


# Changing directories
#setopt auto_pushd
setopt pushd_ignore_dups        
setopt pushd_minus              # Reference stack entries with "-".

setopt extended_glob
setopt pushd_silent             # no dir stack after pushd or popd
setopt pushd_to_home            




##
# Various
##

setopt auto_remove_slash        # self explicit
setopt chase_links              # resolve symlinks
setopt correct                  # try to correct spelling of commands
setopt extended_glob            # activate complex pattern globbing
setopt glob_dots                # include dotfiles in globbing
#setopt print_exit_value         # print return value if non-zero
unsetopt beep                   # no bell on error
unsetopt bg_nice                # no lower prio for background jobs
setopt clobber                  # must use >| to truncate existing files
unsetopt hist_beep              # no bell on error in history
unsetopt hup                    # no hup signal at shell exit
unsetopt ignore_eof             # do not exit on end-of-file
unsetopt list_beep              # no bell on ambiguous completion
unsetopt rm_star_silent         # ask for confirmation for `rm *' or `rm path/*'
setxkbmap -option compose:ralt  # compose-key
print -Pn "\e]0; %n@%M: %~\a"   # terminal title
TERM=xterm-256color             # Colorz!

export GCC_COLORS=1				# Colorz in gcc!

export LANG="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8"
HIST_STAMPS="dd/mm/yyyy"
# =============================================================================
#                                   Prompt
# =============================================================================

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_COLOR_SCHEME='light'

