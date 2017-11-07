#!/bin/bash
wget -O Whiskers.image https://raw.githubusercontent.com/NoMod-Programming/Whiskers/master/Build/Whiskers.image
mv Whiskers.image /usr/share/scratch/Whiskers.image
cp /usr/bin/scratch /usr/bin/whiskers
sed -i 's#IMAGE=.*#IMAGE="/usr/share/scratch/Whiskers.image"#' /usr/bin/whiskers
[ $SUDO_USER ] && user=$SUDO_USER || user=`whoami`
echo "[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Exec=whiskers
Icon=scratch
Terminal=false
Name=Whiskers
Comment=Programming system and content development tool
Categories=Application;Education;Development;
MimeType=application/x-scratch-project" > /home/${user}/Desktop/whiskers.desktop
chmod a+x /home/${user}/Desktop/whiskers.desktop
