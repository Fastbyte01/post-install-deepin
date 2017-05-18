#!/bin/bash 
# 
# This file is part of the https://gist.github.com/Fastbyte01
# Copyright (c) 2017 Giuseppe Pignataro. 
# 
# This program is free software: you can redistribute it and/or modify  
# it under the terms of the GNU General Public License as published by  
# the Free Software Foundation, version 3.
#
# This program is distributed in the hope that it will be useful, but 
# WITHOUT ANY WARRANTY; without even the implied warranty of 
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License 
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#

if [[ $EUID -ne 0 ]]; then
 echo "Questo script deve essere eseguito come root" 
 exit 1
else

sudo apt-get install dialog
 cmd=(dialog --separate-output --checklist "Seleziona i programmi che vuoi installare:" 22 76 16)
 options=(1 "Impostazione Mirror GARR" off # qualsiasi impostazione può essere impostata su "on"
 2 "Aggiornamento di sistema" off
 3 "Installazione font Microsoft" off
 4 "Installazione Gdebi" off
 5 "Synaptic" off
 6 "BleachBit" off
 7 "Open JDK 8" off
 8 "Supporto lettura DVD" off
 9 "LibreOffice" off
 10 "VLC Media Player" off
 11 "Flash Player" off
 12 "Google Chrome" off
 13 "Teamiewer" off
 14 "Skype" off
 15 "Brasero" off
 16 "iFuse per supporto device Apple" off
 17 "Kodi" off
 18 "Gimp" off
 19 "Telegram" off 
 20 "Enpass Password manager" off
 21 "Opera Browser" off
 22 "GUFW" off
 23 "Vivaldi Browser" off
 24 "Risparmio energetico TLP" off
 25 "Pulizia del sistema" off)
 choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
 clear
 for choice in $choices
 do
 case $choice in

 1)
 #Setting mirror on italian server GARR
  echo "Impostazione Mirror GARR"
 cd $HOME &
cp /etc/apt/sources.list backup.sources.list
bash -c 'cat << EOF > /etc/apt/sources.list
# Generated by deepin-installer
# deb [by-hash=force] http://packages.deepin.com/deepin unstable main contrib non-free
# deb-src http://packages.deepin.com/deepin unstable main contrib non-free
##########################################################################################
deb [by-hash=force] http://ba.mirror.garr.it/mirrors/deepin/ panda main contrib non-free
EOF'
      sudo apt-get update
 ;;

2)
 #Update of the repo and upgrade the system
clear
  echo "Aggiornamento del sistema"
apt-get update && sudo apt-get upgrade -y
 ;;

 3) 
 #Install Microsoft Fonts
clear
  echo "Installazione Font Microsoft"
apt-get install ttf-mscorefonts-installer -y
 ;;
 
 4)
 #Install Gdebi
clear
  echo "Installazione Gdebi"
apt-get install gdebi -y
 ;;

5)
 #Install Synaptic
clear
  echo "Installazione Synaptic"
apt-get install synaptic -y
 ;;

 6)
 #Install BleachBit
clear
  echo "Installazione Bleachbit"
apt-get install bleachbit -y
 ;;

 7)
 #Install JDK 8
clear
  echo "Installazione Open JDK8"
apt-get install openjdk-8-jre icedtea-8-plugin -y
 ;;

 8)
 #Install support for commercial DVD
clear
  echo "Installazione supporto DVD"
apt-get install libdvd-pkg libdvdread4 python3 -y && dpkg-reconfigure libdvd-pkg 
 ;;

 9)
 #Install the complete suite of LibreOffice and the italian help & translation
clear
  echo "Installazione LibreOffice"
apt-get install libreoffice libreoffice-help-it libreoffice-l10n-it -y
 ;;

 10)
 #Install VLC Media Player
clear
  echo "Installazione VLC Media Player"
apt-get install vlc -y
 ;;

 11)
 #Install Flash Player
clear
  echo "Installazione Flash Player"
apt-get install flashplugin-nonfree -y
 ;;

 12)
#Install Chrome browser
clear
  echo "Installazione Google Chrome"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
apt-get update 
apt-get purge google-chrome-stable -y
apt-get install google-chrome-stable -y
 ;;

 13)
 #Install Teamviewer
clear
  echo "Installazione Teamviewer"
wget http://download.teamviewer.com/download/teamviewer_i386.deb
dpkg -i teamviewer_i386.deb
apt-get install -f -y
rm -rf teamviewer_i386.deb
 ;;

 14)
#Install Skype for Linux
clear
  echo "Installing Skype For Linux"
 apt install apt-transport-https -y
 curl https://repo.skype.com/data/SKYPE-GPG-KEY | apt-key add -
 echo "deb https://repo.skype.com/deb stable main" | tee /etc/apt/sources.list.d/skypeforlinux.list
 apt-get update 
 apt-get install skypeforlinux -y
 ;;

 15)
#Install Brasero
clear
  echo "Installazione Brasero"
apt-get install brasero -y
 ;;

 16)
 #Install iFuse for support iDevice
clear
  echo "Installazione supporto per device Apple"
apt-get install ifuse -y
 ;;

 17)
#Install Kodi
clear
  echo "Installazione Kodi"
apt-get install kodi -y
 ;;
 
 18)
 #Install Gimp
 clear
  echo "Installazione Gimp"
apt-get install gimp gimp-plugin-registry -y
 ;;

19)
 #Install Telegram
clear
 echo "Installazione Telegram"
apt-get install telegram -y
 ;;

20)
 #Install Enpass Password manager
clear
 echo "Installazione Enpass Password manager"
 echo "deb http://repo.sinew.in/ stable main" | tee /etc/apt/sources.list.d/enpass.list
curl https://dl.sinew.in/keys/enpass-linux.key | apt-key add -
apt-get update
apt-get install enpass -y
 ;;

 21)
 #Install Opera Browser
clear
  echo "Installazione Opera Browser"
sudo add-apt-repository 'deb https://deb.opera.com/opera-stable/ stable non-free'
wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -
apt-get update && apt-get install opera-stable -y
 ;;

 22)
 #Install GUFW
clear
  echo "Installazione GUFW"
apt-get install gufw -y
 ;;
23)
#Install Vivaldi Browser
clear
 echo "Installazione Vivaldi Browser"
curl http://repo.vivaldi.com/stable/linux_signing_key.pub | apt-key add -
echo "deb http://repo.vivaldi.com/stable/deb/ stable main" | tee /etc/apt/sources.list.d/vivaldibrowser.list
apt-get update
apt-get install vivaldi-stable -y
;;
24)
#Install TLP
clear
 echo "Installazione Risparmio energetico TLP"
apt-get install tlp tlp-rdw && tlp start
;;
25)
#Clean the system from packages no more useful
clear
 echo "Pulizia del sistema"
apt-get --purge autoremove
apt-get autoclean
apt-get clean
rm -fr /tmp/*
rm -rfv ~/.local/share/Trash/*
apt-get update
;;

  esac
 done
fi