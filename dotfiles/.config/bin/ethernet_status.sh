#!/bin/sh

#echo "%{F#2495e7} %{Fe2ee6a} $(/usr/sbin/ifconfig wlxec086b177e4e | grep broadcast | awk '{print $2}')%{u-}"
#echo "%{F#83a598} %{F#ebdbb2} $(ip a | grep wlo1 | grep inet | awk '{print $2}' | awk -F/ '{print $1}')%{u-}"
echo "%{F#94caf9}  %{F#ffffff}$(ip a | grep wlo1 | grep inet | awk '{print $2}' | awk -F/ '{print $1}')%{u-}"
