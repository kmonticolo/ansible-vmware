#!/bin/bash

NETWORK=10.48.77
IFACE=$(ifconfig -a|grep ^ens | cut -f1 -d: | head -1)

MAC=$(ifconfig $IFACE |grep ether | awk '{print $2}')

[[ $(grep -q $MAC /etc/sysconfig/network-scripts/ifcfg-$IFACE) ]] || sed -i "s/^HWADDR=.*/HWADDR=$MAC/" /etc/sysconfig/network-scripts/ifcfg-$IFACE

flag=0 ; for i in `seq 13 250`;do arping -w2 -c1 -I $IFACE "$NETWORK".$i >/dev/null || flag=$?; if [ "$flag" -eq "1" ]; then export IP="$NETWORK".$i; echo $IP; break;fi ;done

[[ "$1" == "check" ]] && exit 0
[[ $IP ]] && sed -i "s/^IPADDR=.*/IPADDR=\"$IP\"/" /etc/sysconfig/network-scripts/ifcfg-$IFACE
