VER=4.5.1-040501
PREFIX=http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.5.1-wily/
REL=201604121331
wget ${PREFIX}/linux-headers-${VER}-generic_${VER}.${REL}_amd64.deb
wget ${PREFIX}/linux-headers-${VER}_${VER}.${REL}_all.deb
wget ${PREFIX}/linux-image-${VER}-generic_${VER}.${REL}_amd64.deb
sudo dpkg -i linux-*${VER}.${REL}*.deb
# reboot
