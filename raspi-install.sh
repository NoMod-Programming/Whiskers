#!/bin/bash
wget -O Whiskers.image https://raw.githubusercontent.com/NoMod-Programming/Whiskers/master/Build/Whiskers.image
mv Whiskers.image /usr/share/scratch/Whiskers.image
cp /usr/bin/scratch /usr/bin/whiskers
sed -i 's#IMAGE=.*#IMAGE="/usr/share/scratch/Whiskers.image"#' /usr/bin/whiskers
cat > /home/$(logname)/Desktop/whiskers.desktop << EOL
line 1, [Desktop Entry]
line 2, Encoding=UTF-8
line 3, Version=1.0
line 4, Type=Application
line 5, Exec=nuwhiskers
line 6, Icon=scratch
line 7, Terminal=false
line 8, Name=Whiskers
line 9, Comment=Programming system and content development tool
line 10, Categories=APplication;Education;Development;
line 11, MimeType=application/x-scratch-project
EOL
chmod a+x /home/$(logname)/Desktop/whiskers.desktop
