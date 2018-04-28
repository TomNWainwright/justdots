from /home/tom/dotfiles/shells/xonsh/helpers.xsh import *

#$XONSH_SHOW_TRACEBACK = True

# XONSH WIZARD START

$AUTO_CD = '1'
$MOUSE_SUPPORT = '0'
$MULTILINE_PROMPT = '\xe2\x86\x92'
$UPDATE_COMPLETIONS_ON_KEYPRESS = '1'
$UPDATE_OS_ENVIRON = '1'
$UPDATE_PROMPT_ON_KEYPRESS = '1'
$XONSH_AUTOPAIR = '1'
$XONSH_DATETIME_FORMAT = "'%Y-%d-%m %H:%M'"


  

xontrib load apt_tabcomplete coreutils   whole_word_jumping  xonda  powerline   fzf-widgets schedule # prompt_ret_code
# XONSH WIZARD END
# jedi


    
    
$NIX_LINK="$HOME/dotfiles/nix/profile"
$nix_defexpr="$HOME/dotfiles/nix/defexpr"

$LD_LIBRARY_PATH="/etc/ld.so.conf.d/vte.conf"
$LC_CTYPE = 'en_GB.UTF-8'
$LC_ALL = '"en_GB.utf-8"'




main_path = [
    '/home/tom/miniconda3/bin',
    '/home/tom/.nix-profile/bin',
    '/usr/local/bin',
    '/usr/bin',
    '/bin',
    '/home/tom/data/apps/rerun',
    '/home/tom/data/apps/liteide/bin',
    '/home/tom/dotfiles/nix/profile/bin',
    '/nix/store/cb3slv3szhp46xkrczqw7mscy5mnk64l-coreutils-8.29/bin ',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ]


    
    
middle_path = flatten_list([main_path,dirs_recursive('/home/tom/bins')])
 

    
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    



~
