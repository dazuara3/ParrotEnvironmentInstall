#!/bin/sh

#***User password is needed to sudo commands+++
#! /bin/bash
IFS= read -rs PASSWD
sudo -k
if sudo -lS &> /dev/null << EOF
$PASSWD
EOF
then

	#Update OS

	echo $PASSWD | sudo -S apt update -y
	echo $PASSWD | sudo -S apt upgrade -y

	#Install bspwn

	echo $PASSWD | sudo -S apt-get install bspwn -y
	echo $PASSWD | sudo -S apt-get install libxcb-xinerama0-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-util0-dev libxcb-ewmh-dev libxcb-keysyms1-dev libxcb-shape0-dev -y

	git clone https://github.com/baskerville/bspwm.git
	git clone https://github.com/baskerville/sxhkd.git
	cd bspwm && make && sudo make install
	cd ../sxhkd && make && sudo make install

	mkdir -p ~/.config/{bspwm,sxhkd}
	cp /usr/local/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
	cp /usr/local/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/
	chmod u+x ~/.config/bspwm/bspwmrc

	git clone https://github.com/dazuara3/ParrotEnvironmentInstall.git
	mv ParrotEnvironmentInstall/xinitrc ParrotEnvironmentInstall/.xinitrc

	echo $PASSWD | sudo -S apt-get install compton -y











	echo

else 
    echo 'Wrong password.'
fi
