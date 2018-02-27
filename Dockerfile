FROM centos:centos7

MAINTAINER Niels Højen <niels@hojen.net>

ENV FWBOOSTER_VERSION 12.3.0

VOLUME /var/FWBooster

RUN yum -y install wget unzip initscripts
RUN wget https://fwdl.filewave.com/$FWBOOSTER_VERSION/FileWave_Linux_$FWBOOSTER_VERSION.zip
RUN unzip FileWave_Linux_$FWBOOSTER_VERSION.zip
RUN rm -f fwxserver-$FWBOOSTER_VERSION-1.0.x86_64.rpm
RUN yum install -y --nogpgcheck fwbooster-$FWBOOSTER_VERSION-1.0.x86_64.rpm

ADD run.sh /run.sh

EXPOSE 20003
EXPOSE 20004
EXPOSE 20013
EXPOSE 20014

CMD /bin/bash /run.sh
