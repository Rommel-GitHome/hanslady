#!/bin/bash
#Installs Chromium Browser in Ubuntu
#Script by Jeff Rader, raderjeff@gmail.com
#Source from http://www.ubuntugeek.com

echo "Getting ready to install chromium-browser:"

echo "
To run this script, you must be an administrator. 
If you are not and you try to run this anyway, 
your system administrator will be notified.


"
sudoer=null
echo -n "Continue [y or n]? "
while [ $sudoer == "null" ]; do
        read sudoer
        if [ $sudoer == "y" ]; then
                echo "Continuing..."
        elif [ $sudoer == "n" ]; then
                echo "Press ENTER to quit."
                read
                exit
        else
                echo -n "[y] or [n]: "
                sudoer=null
        fi
done

disto=`awk '{print $1}' /etc/issue`
if [ $disto == "Ubuntu" ]; then
        vers=`awk '{print $2}' /etc/issue`
                if [ "$vers" == "9.10" ]; then
                        echo "You are using $disto $vers"
                        echo "Adding Launchpad to /etc/apt/sources.list"
                        sudo cat >> /etc/apt/sources.list << EOF

deb http://ppa.launchpad.net/chromium-daily/ppa/ubuntu karmic main
deb-src http://ppa.launchpad.net/chromium-daily/ppa/ubuntu karmic main

EOF
                elif [ "$vers" == "9.04" ]; then
                        echo "You are using $disto $vers"
                        echo "Adding Launchpad to /etc/apt/sources.list"
                        sudo cat >> /etc/apt/sources.list << EOF

deb http://ppa.launchpad.net/chromium-daily/ppa/ubuntu jaunty main
deb-src http://ppa.launchpad.net/chromium-daily/ppa/ubuntu jaunty main

EOF
                elif [ "$vers" == "8.10" ]; then
                        echo "You are using $disto $vers"
                        echo "Adding Launchpad to /etc/apt/sources.list"
                        sudo cat >> /etc/apt/sources.list << EOF

deb http://ppa.launchpad.net/chromium-daily/ppa/ubuntu intrepid main
deb-src http://ppa.launchpad.net/chromium-daily/ppa/ubuntu intrepid main

EOF
                else
                        clear
                        echo "This scipt does not support $distro $ver
                        Press ENTER to exit:"
                        read
                        exit
                fi
else
        vers=`awk '{print $2}' /etc/issue`
        echo "This script only works with Ubuntu 9.10, 9.04. and 8.10.
You are using $distro $vers.
You will have to find another way to install Chromium.
Press ENTER to exit:"
        read
        exit
fi
echo "Adding Key"
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com
0xfbef0d696de1c72ba5a835fe5a9bf3bb4e5e17b5
echo "Updating"
sudo apt-get update
echo "Installing Chromium-Browser"
sudo apt-get install chromium-browser
echo "Killing Firefox"
killall firefox
echo "Starting Chromium
"
chromium-browser
echo "Press Enter to exit:"
read
exit
