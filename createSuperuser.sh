#!/bin/sh

sudo useradd -u 0 -o -g 0 dazuara
sudo passwd dazuara

sudo mkdir /home/dazuara
sudo usermod --shell /bin/bash --home /home/dazuara dazuara
sudo chown -R dazuara:root /home/dazuara
cp /etc/skel/.* /home/dazuara/
