#!/bin/bash

HEXPASSWORD=$(/usr/bin/printf $PASSWORD | /usr/bin/hexdump -v | /usr/bin/awk '{for(i=2;i<=NF;++i)print $i}' | /usr/bin/xargs | /usr/bin/sed 's/ //g')
cat fwbooster.conf | \
	sed "s/.*boosterName.*/<boosterName><ASCII><$(/bin/echo ${#BOOSTERNAME})><$BOOSTERNAME>/" |\
	sed "s/.*boosterLocation.*/<boosterLocation><ASCII><$(/bin/echo ${#BOOSTERLOCATION})><$BOOSTERLOCATION>/" |\
	sed "s/.*boosterPort.*/<boosterPort><UINT16><5><$BOOSTERPORT>/" |\
	sed "s/.*boosterPubPort.*/<boosterPubPort><UINT16><5><$BOOSTERPUBPORT>/" |\
	sed "s/.*server1Port.*/<server1Port><UINT16><5><$SERVER1PORT>/" |\
	sed "s/.*server1Addr.*/<server1Addr><ASCII><$(/bin/echo ${#SERVER1ADDR})><$SERVER1ADDR>/" |\
	sed "s/.*useSslOnLoader.*/<useSslOnLoader><UINT16><1><$SSLLOADER>/" |\
	sed "s/.*server1SubsPort.*/<server1SubsPort><UINT16><5><$SERVER1SUBSPORT>/" |\
	sed "s/.*password.*/<password><HEX><$(/bin/echo ${#HEXPASSWORD})><$HEXPASSWORD>/" |\
	sed "s/.*freeDiskSpaceLimitMB>.*/<freeDiskSpaceLimitMB><UINT64><$(/bin/echo ${#FREEDISKSPACELIMIT})><$FREEDISKSPACELIMIT>/" > /usr/local/etc/fwbooster.conf

/etc/init.d/fw-booster start
#/usr/bin/tail -F /var/log/fwbooster.log
