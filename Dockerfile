FROM centos:centos7

MAINTAINER Niels Højen <niels@hojen.net>

ENV FWBOOSTER_VERSION 13.3.1
ENV FWBOOSTER_NAME "NewBooster"
ENV FWBOOSTER_LOCATION "New Branch Office"
ENV FWBOOSTER_PORT 20013 
ENV FWBOOSTER_PUBPORT 20003
ENV FWBOOSTER_FWSERVERPORT 20015
ENV FWBOOSTER_FWSERVERADDR "no.server.set"
ENV FWBOOSTER_SERVER1PORT 20015
ENV FWBOOSTER_SERVER1ADDR "not.set"
ENV FWBOOSTER_SERVER1SUBSPORT 20005
ENV FWBOOSTER_SERVER2PORT 20013
ENV FWBOOSTER_SERVER2ADDR "not.set"
ENV FWBOOSTER_SERVER2SUBSPORT 20003
ENV FWBOOSTER_SERVER3PORT 20013
ENV FWBOOSTER_SERVER3ADDR "not.set"
ENV FWBOOSTER_SERVER3SUBSPORT 20003
ENV FWBOOSTER_SERVER4PORT 20013
ENV FWBOOSTER_SERVER4ADDR "not.set"
ENV FWBOOSTER_SERVER4SUBSPORT 20003
ENV FWBOOSTER_SERVER5PORT 20013
ENV FWBOOSTER_SERVER5ADDR "not.set"
ENV FWBOOSTER_DELETEUNUSEDFILESETS 1
ENV FWBOOSTER_DEBUGLEVEL 10
ENV FWBOOSTER_FILESETCHECKINTERVAL 86400
ENV FWBOOSTER_BANDWITHMAXKBPS 0
ENV FWBOOSTER_PASSWORD "filewave"
ENV FWBOOSTER_MAXCONNECTIONS 500
ENV FWBOOSTER_FREEDISKSPACELIMITMB 500

VOLUME /var/FWBooster

RUN yum -y install wget unzip initscripts
RUN yum install -y --nogpgcheck https://fwdl.filewave.com/$FWBOOSTER_VERSION/fwbooster-$FWBOOSTER_VERSION-1.0.x86_64.rpm

ADD fwbooster.conf /fwbooster.conf
ADD run.sh /run.sh

EXPOSE 20003
EXPOSE 20004
EXPOSE 20013
EXPOSE 20014

CMD /bin/bash /run.sh

