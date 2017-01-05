#!/bin/bash

# $ sudo sh ssbeclipseneon.sh

cd /opt/
# original http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/neon/2/eclipse-jee-neon-2-linux-gtk-x86_64.tar.gz
# add \&r=1
# result http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/neon/2/eclipse-jee-neon-2-linux-gtk-x86_64.tar.gz\&r=1
sudo wget --output-document=eclipse-jee-neon-2-linux-gtk-x86_64.tar.gz http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/neon/2/eclipse-jee-neon-2-linux-gtk-x86_64.tar.gz\&r=1
sudo tar -xf eclipse-jee-neon-2-linux-gtk-x86_64.tar.gz
sudo rm -f eclipse-jee-neon-2-linux-gtk-x86_64.tar.gz
sudo nano /usr/share/applications/eclipse.desktop

- copy and paste

[Desktop Entry]
Name=Eclipse Neon 2
Type=Application
Exec=/opt/eclipse/eclipse
Terminal=false
Icon=/opt/eclipse/icon.xpm
Comment=Integrated Development Environment
NoDisplay=false
Categories=Development;IDE;
Name[en]=Eclipse