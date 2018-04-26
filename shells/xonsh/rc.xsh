
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

def dirs_recursive(start):

    stream = $(fd --type 'd' .  @(start))
    return stream.splitlines()

    
    
$NIX_LINK=$HOME/dotfiles/nix/profile
$nix_defexpr="$HOME"/dotfiles/nix/defexpr

$LD_LIBRARY_PATH=:/etc/ld.so.conf.d/vte.conf$LD_LIBRARY_PATH
$LC_CTYPE = 'en_GB.UTF-8'
$LC_ALL = '"en_GB.utf-8"'



$PATH = [
    '/home/tom/miniconda3/bin',
    '/home/tom/.nix-profile/bin',
    '/usr/local/bin',
    '/usr/bin',
    '/bin',
    '/home/tom/data/apps/rerun',
    '/home/tom/data/apps/liteide/bin',
    '/usr/local/go/bin',
    '/home/tom/go/bin',
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
$PATH = dirs_recursive('/home/tom/bins') +  $PATH  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    



aliases['..'] = '..'
aliases[':q'] = ' exit'
aliases['aar'] = 'sudo apt autoremove'
aliases['afix'] = 'sudo apt-get install -f'
aliases['ai'] = 'sudo apt install -y'
aliases['ap'] = 'sudo apt purge -y'
aliases['ar'] = 'sudo apt remove'
aliases['as'] = 'apt search'
aliases['au'] = 'sudo apt update'
aliases['aup'] = 'sudo apt upgrade'
aliases['unpack'] = 'sudo dpkg -i'
aliases['synaptic'] = 'sudo synaptic'
aliases['cache-policy'] = 'sudo apt-cache policy'
aliases['search-package'] = 'sudo apt-cache search $argv'
aliases['show-package'] = 'sudo apt-cache show $argv'
aliases['untar'] = 'tar -xvf'
aliases['untar'] = 'tar -xvf'
aliases['r'] = 'rofi -show'

aliases['cfb'] = 'mousepad ~/.bashrc'
aliases['chmodx'] = 'chmod +x'
aliases['clone'] = 'git clone'
aliases['commit'] = 'git commit'
aliases['g'] = 'git'
aliases['ga'] = 'git add'
aliases['gc'] = 'git commit -S -m'

aliases['sudo'] = 'sudo '
aliases['cp'] = 'cp -irf'
aliases['h'] = 'history'
aliases['k'] = 'clear'
aliases['mkdir'] = 'mkdir -p -v'
aliases['root'] = 'sudo -s'
aliases['unroot'] = 'sudo chown -R $USER:$USER '
aliases['dl'] = '$HOME/Downloads'

aliases['here'] = 'open .'
aliases['ldirs'] = 'ls -ldh .*/ */'
aliases['list-key'] = 'sudo apt-key list'
aliases['list-upgradable'] = 'sudo apt list --upgradable'
aliases['loopfind'] = 'fv -o'
aliases['loopkate'] = 'fv -oc Kate.AppImage'

aliases['path'] = 'echo -e ${PATH//:/}'

aliases['reload'] = 'exec ${SHELL} -l'
aliases['rm'] = 'rm -ivr'

aliases['d'] = 'date'
aliases['p'] = 'pwd'

aliases['sudoe'] = 'sudo -E'

~
