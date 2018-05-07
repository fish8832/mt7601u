#!/bin/sh

ifname="enp4s0"

#remove the driver before
ifconfig ra0 down
#rmmod mt7601Usta
rmmod mt7601u

#add new ap driver
modprobe rtutil7601Uap
modprobe mt7601Uap
modprobe rtnet7601Uap

#set ip
ifconfig ra0 up
ifconfig ra0 192.168.199.1

#dhcp the network
service isc-dhcp-server restart
dhcpd ra0

#make if forward work from eth0
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward
iptables -t filter -F
iptables -t nat -F
iptables -t nat -A POSTROUTING -o $ifname -j MASQUERADE

