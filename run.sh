#!/bin/bash

yum -y install wget unzip
wget https://fwdl.filewave.com/$FWBOOSTER_VERSION/FileWave_Linux_$FWBOOSTER_VERSION.zip
unzip FileWave_Linux_$FWBOOSTER_VERSION.zip
rm -f fwxserver-$FWBOOSTER_VERSION-1.0.x86_64.rpm
yum install -y --nogpgcheck fwbooster-$FWBOOSTER_VERSION-1.0.x86_64.rpm
