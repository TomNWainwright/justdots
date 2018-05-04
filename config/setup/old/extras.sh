sudo apt-get install software-properties-common
sudo add-apt-repository ppa:webupd8team/terminix
sudo apt-get update



sudo apt-get install  apt-transport-https afuse aptitude autoconf autogen automake autotools-dev axel bijiben bluez build-essential bzip2 bzr colortest curl deja-dup diffutils dos2unix emelfm2 fdupes fontconfig fonts-indic ftp-ssl gawk gcc git gnome-logs gnome-pie gnome-terminal gpick grep gvfs gzip htop httping iftop imagemagick inxi iotop less lftp libavcodec-extra libgl1-mesa-dev libgtk-3-dev m4 make mediainfo mime-support nfs-common nmap openssl p7zip p7zip-full perl pkg-config powertop pv pwgen rake rar rsync ruby scdaemon shotwell smbclient software-properties-common symlinks tar tig tlp trash-cli tree unrar unzip wget x11-apps xca xdg-utils xterm zip synaptic bleachbit libnotify-bin inotify-tools meld cifs-utils wmctrl xdotool language-pack-gnome-en # tilix




mkdir -p /home/tom/tempdebs/
cd /home/tom/tempdebs/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget https://download1.operacdn.com/pub/opera/desktop/52.0.2871.64/linux/opera-stable_52.0.2871.64_amd64.deb
sudo dpkg -i /home/tom/tempdebs/*.deb
cd ~
rm -r /home/tom/tempdebs/
sudo apt-get install -fy





cd ~
git clone https://github.com/TomNWainwright/justdots dotfiles
cd dotfiles/
./install


wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && sh Miniconda3-latest-Linux-x86_64.sh -b && export PATH="/home/tom/miniconda3/bin:$PATH" && pip install --upgrade pip && rm Miniconda3-latest-Linux-x86_64.sh
curl https://nixos.org/nix/install | sh
. ~/.bashrc
nix-env -i fd fzy rofi micro tilda
sudo chown -R tom:tom .cache
sudo apt-get purge mousepad activity-log-manager aisleriot checkbox-converged deja-dup gnome-mahjongg gnome-mines gnome-sudoku hplip landscape-client-ui-install overlay-scrollbar overlay-scrollbar-gtk2 overlay-scrollbar-gtk3 remmina rhythmbox shotwell shotwell-common thunderbird  unity-scope-manpages unity-scope-openclipart  usb-creator-gtk webbrowser-app xdiagnose darktable dillo empathy evolution gdebi polari putty putty-tools samba firefox netsurf



mkdir -p bins/clibin bins/scriptbin

pip install jedi jupyter jupyterlab xonda xonsh[ptk,linux,pygments] xonsh-apt-tabcomplete xonsh-click-tabcomplete xonsh-kernel xontrib-fzf-widgets xontrib-powerline xontrib-schedule spyder