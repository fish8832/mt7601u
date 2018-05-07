#!/bin/sh

# unload wifi ap drive
ifconfig ra0 down
rmmod rtnet7601Uap 
rmmod mt7601Uap 
rmmod rtutil7601Uap

# load wifi drive
#modprobe mt7601Usta
modprobe mt7601u
