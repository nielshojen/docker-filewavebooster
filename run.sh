#!/bin/bash

/usr/bin/update-ca-trust

HEXPASSWORD=$(/usr/bin/printf $FWBOOSTER_PASSWORD | /usr/bin/hexdump -C | /usr/bin/awk '{for(i=2;i<=NF;++i)print $i}' | /usr/bin/xargs | /usr/bin/sed 's/ //g' | awk -F "|" '{ print $1 }')

cat /fwbooster.conf | \
	sed "s/.*boosterName.*/<boosterName><ASCII><$(/bin/echo ${#FWBOOSTER_NAME})><$FWBOOSTER_NAME>/" |\
	sed "s/.*boosterLocation.*/<boosterLocation><ASCII><$(/bin/echo ${#FWBOOSTER_LOCATION})><$FWBOOSTER_LOCATION>/" |\
	sed "s/.*boosterPort.*/<boosterPort><UINT16><$(/bin/echo ${#FWBOOSTER_PORT})><$FWBOOSTER_PORT>/" |\
	sed "s/.*boosterPubPort.*/<boosterPubPort><UINT16><$(/bin/echo ${#FWBOOSTER_PUBPORT})><$FWBOOSTER_PUBPORT>/" |\
	sed "s/.*FWServerPort.*/<FWServerPort><UINT16><$(/bin/echo ${#FWBOOSTER_FWSERVERPORT})><$FWBOOSTER_FWSERVERPORT>/" |\
	sed "s/.*FWServerAddr.*/<FWServerAddr><ASCII><$(/bin/echo ${#FWBOOSTER_FWSERVERADDR})><$FWBOOSTER_FWSERVERADDR>/" |\
	sed "s/.*server1Port.*/<server1Port><UINT16><$(/bin/echo ${#FWBOOSTER_SERVER1PORT})><$FWBOOSTER_SERVER1PORT>/" |\
	sed "s/.*server1Addr.*/<server1Addr><ASCII><$(/bin/echo ${#FWBOOSTER_SERVER1ADDR})><$FWBOOSTER_SERVER1ADDR>/" |\
	sed "s/.*server1SubsPort.*/<server1SubsPort><UINT16><$(/bin/echo ${#FWBOOSTER_SERVER1SUBSPORT})><$FWBOOSTER_SERVER1SUBSPORT>/" |\
	sed "s/.*server2Port.*/<server2Port><UINT16><$(/bin/echo ${#FWBOOSTER_SERVER2PORT})><$FWBOOSTER_SERVER2PORT>/" |\
	sed "s/.*server2Addr.*/<server2Addr><ASCII><$(/bin/echo ${#FWBOOSTER_SERVER2ADDR})><$FWBOOSTER_SERVER2ADDR>/" |\
	sed "s/.*server2SubsPort.*/<server2SubsPort><UINT16><$(/bin/echo ${#FWBOOSTER_SERVER2SUBSPORT})><$FWBOOSTER_SERVER2SUBSPORT>/" |\
	sed "s/.*server3Port.*/<server3Port><UINT16><$(/bin/echo ${#FWBOOSTER_SERVER3PORT})><$FWBOOSTER_SERVER3PORT>/" |\
	sed "s/.*server3Addr.*/<server3Addr><ASCII><$(/bin/echo ${#FWBOOSTER_SERVER3ADDR})><$FWBOOSTER_SERVER3ADDR>/" |\
	sed "s/.*server3SubsPort.*/<server3SubsPort><UINT16><$(/bin/echo ${#FWBOOSTER_SERVER3SUBSPORT})><$FWBOOSTER_SERVER3SUBSPORT>/" |\
	sed "s/.*server4Port.*/<server4Port><UINT16><$(/bin/echo ${#FWBOOSTER_SERVER4PORT})><$FWBOOSTER_SERVER4PORT>/" |\
	sed "s/.*server4Addr.*/<server4Addr><ASCII><$(/bin/echo ${#FWBOOSTER_SERVER4ADDR})><$FWBOOSTER_SERVER4ADDR>/" |\
	sed "s/.*server4SubsPort.*/<server4SubsPort><UINT16><$(/bin/echo ${#FWBOOSTER_SERVER4SUBSPORT})><$FWBOOSTER_SERVER4SUBSPORT>/" |\
	sed "s/.*server5Port.*/<server5Port><UINT16><$(/bin/echo ${#FWBOOSTER_SERVER5PORT})><$FWBOOSTER_SERVER5PORT>/" |\
	sed "s/.*server5Addr.*/<server5Addr><ASCII><$(/bin/echo ${#FWBOOSTER_SERVER5ADDR})><$FWBOOSTER_SERVER5ADDR>/" |\
	sed "s/.*server5SubsPort.*/<server5SubsPort><UINT16><$(/bin/echo ${#FWBOOSTER_SERVER5SUBSPORT})><$FWBOOSTER_SERVER5SUBSPORT>/" |\
	sed "s/.*deleteUnusedFilesets.*/<deleteUnusedFilesets><UINT16><1><$FWBOOSTER_DELETEUNUSEDFILESETS>/" |\
	sed "s/.*debugLevel.*/<debugLevel><UINT16><$(/bin/echo ${#FWBOOSTER_DEBUGLEVEL})><$FWBOOSTER_DEBUGLEVEL>/" |\
	sed "s/.*filesetCheckInterval.*/<filesetCheckInterval><UINT32><$(/bin/echo ${#FWBOOSTER_FILESETCHECKINTERVAL})><$FWBOOSTER_FILESETCHECKINTERVAL>/" |\
	sed "s/.*bandwidthMaxKBps.*/<bandwidthMaxKBps><UINT32><$(/bin/echo ${#FWBOOSTER_BANDWIDTHMAXKBPS})><$FWBOOSTER_BANDWIDTHMAXKBPS>/" |\
	sed "s/.*password.*/<password><HEX><$(/bin/echo ${#HEXPASSWORD})><$HEXPASSWORD>/" |\
	sed "s/.*maxConnections.*/<maxConnections><UINT16><$(/bin/echo ${#FWBOOSTER_MAXCONNECTIONS})><$FWBOOSTER_MAXCONNECTIONS>/" |\
	sed "s/.*freeDiskSpaceLimitMB>.*/<freeDiskSpaceLimitMB><UINT64><$(/bin/echo ${#FWBOOSTER_FREEDISKSPACELIMIT})><$FWBOOSTER_FREEDISKSPACELIMIT>/" > /usr/local/etc/fwbooster.conf

/etc/init.d/fw-booster start
/usr/bin/tail -F /var/log/fwbooster.log

