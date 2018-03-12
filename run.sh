#!/bin/bash

HEXPASSWORD=$(/usr/bin/printf $FWBOOSTER_PASSWORD | /usr/bin/hexdump -C | /usr/bin/awk '{for(i=2;i<=NF;++i)print $i}' | /usr/bin/xargs | /usr/bin/sed 's/ //g' | awk -F "|" '{ print $1 }')

cat fwbooster.conf | \
	sed "s/.*boosterName.*/<boosterName><ASCII><$(/bin/echo ${#FWBOOSTER_NAME})><$FWBOOSTER_NAME>/" |\
	sed "s/.*boosterLocation.*/<boosterLocation><ASCII><$(/bin/echo ${#FWBOOSTER_LOCATION})><$FWBOOSTER_LOCATION>/" |\
	sed "s/.*boosterPort.*/<boosterPort><UINT16><5><$FWBOOSTER_PORT>/" |\
	sed "s/.*boosterPubPort.*/<boosterPubPort><UINT16><5><$FWBOOSTER_PUBPORT>/" |\
	sed "s/.*server1Port.*/<server1Port><UINT16><5><$FWSERVER1_PORT>/" |\
	sed "s/.*server1Addr.*/<server1Addr><ASCII><$(/bin/echo ${#FWSERVER1_ADDR})><$FWSERVER1_ADDR>/" |\
	sed "s/.*useSslOnLoader.*/<useSslOnLoader><UINT16><1><$FWBOOSTER_SSLLOADER>/" |\
	sed "s/.*server1SubsPort.*/<server1SubsPort><UINT16><5><$FWSERVER1_SUBSPORT>/" |\
	sed "s/.*password.*/<password><HEX><$(/bin/echo ${#HEXPASSWORD})><$HEXPASSWORD>/" |\
	sed "s/.*freeDiskSpaceLimitMB>.*/<freeDiskSpaceLimitMB><UINT64><$(/bin/echo ${#FWBOOSTER_FREEDISKSPACELIMIT})><$FWBOOSTER_FREEDISKSPACELIMIT>/" > /usr/local/etc/fwbooster.conf

/etc/init.d/fw-booster start
/usr/bin/tail -F /var/log/fwbooster.log
