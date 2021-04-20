#!/bin/sh

echo "%{F#2495e7}%{F#2495e7}$(/usr/sbin/ifconfig eth0 | grep "inet " | awk '{print $2}')%{u-}"
