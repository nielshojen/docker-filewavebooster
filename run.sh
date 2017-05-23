#!/bin/bash

VERSION=$1

yum -y install wget unzip
wget https://fwdl.filewave.com/$VERSION/FileWave_Linux_$VERSION.zip
unzip FileWave_Linux_$VERSION.zip
rm -f fwxserver-$VERSION-1.0.x86_64.rpm
yum install -y --nogpgcheck fwbooster-$VERSION-1.0.x86_64.rpm
