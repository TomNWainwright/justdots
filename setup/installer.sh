

cd /home/tom/dotfiles && ./install 
cd ~




sudo apt-get install -y    apt-transport-https aptitude autoconf autogen automake autotools-dev axel   build-essential bzip2 bzr   deja-dup diffutils  emelfm2 fdupes fontconfig fonts-indic ftp-ssl gawk  libxtst-dev gcc git gnome-logs gnome-pie xfce4-terminal  grep gvfs gzip    less libgl1-mesa-dev m4 make  mime-support nfs-common nmap p7zip p7zip-full perl pkg-config pv rake rar rsync ruby  symlinks tar tlp  unrar unzip wget x11-apps xca xdg-utils  zip synaptic bleachbit libnotify-bin inotify-tools  cifs-utils wmctrl xdotool language-pack-gnome-en keepass2 git curl

#curl https://raw.githubusercontent.com/PursuanceProject/install-go/master/install-go.sh | bash



mkdir -p /home/tom/tempdebs/
cd /home/tom/tempdebs/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget https://download1.operacdn.com/pub/opera/desktop/52.0.2871.64/linux/opera-stable_52.0.2871.64_amd64.deb
wget https://github.com/sharkdp/fd/releases/download/v7.0.0/fd-musl_7.0.0_amd64.deb
sudo dpkg -i /home/tom/tempdebs/*.deb
cd ~
rm -r /home/tom/tempdebs/
sudo apt-get install -fy
curl https://getmic.ro | bash


/home/tom/dotfiles/setup/scripts/dmenu-extended.installer
/home/tom/dotfiles/setup/scripts/fish.installer
/home/tom/dotfiles/setup/scripts/jumpapp.installer
/home/tom/dotfiles/setup/scripts/termite.installer
/home/tom/dotfiles/setup/scripts/xcape.installer





wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh -b
set PATH="/home/tom/miniconda3/bin:$PATH"
pip install --upgrade pip
rm Miniconda3-latest-Linux-x86_64.sh

sudo chown -R tom:tom .cache
sudo apt-get purge  activity-log-manager aisleriot   gnome-mahjongg gnome-mines gnome-sudoku hplip landscape-client-ui-install overlay-scrollbar overlay-scrollbar-gtk2 overlay-scrollbar-gtk3 remmina rhythmbox shotwell shotwell-common thunderbird  unity-scope-manpages unity-scope-openclipart  usb-creator-gtk webbrowser-app xdiagnose darktable dillo empathy evolution gdebi polari putty putty-tools samba firefox  libxtst-dev libxi-dev




