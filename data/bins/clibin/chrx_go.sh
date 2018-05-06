D="xubuntu"
E="desktop"
R="18.04"
TARGETDISK=""

HOST="hal"
USER="tom"
LOCALE="en_GB.UTF-8"
TIME="Europe/London"

 
export CHRX_WEB_ROOT="http://myserver/chrx"


cd ; sudo curl -Os https://chrx.org/go && sudo sh go -d $D  -e $E  -r $R  -H $HOST -U $USER -L $LOCALE -Z $TIME  -p 'git curl synaptic'