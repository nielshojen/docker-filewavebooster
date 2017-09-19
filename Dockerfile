FROM centos:centos7

MAINTAINER Niels Højen <niels@hojen.net>

ENV FWBOOSTER_VERSION 12.3.0

RUN yum -y install wget unzip
RUN wget https://fwdl.filewave.com/$FWBOOSTER_VERSION/FileWave_Linux_$FWBOOSTER_VERSION.zip
RUN unzip FileWave_Linux_$FWBOOSTER_VERSION.zip
RUN rm -f fwxserver-$FWBOOSTER_VERSION-1.0.x86_64.rpm
RUN yum install -y --nogpgcheck fwbooster-$FWBOOSTER_VERSION-1.0.x86_64.rpm

CMD /usr/local/sbin/fwbooster

VOLUME /var/FWBooster
VOLUME /usr/local/etc

EXPOSE 20003
EXPOSE 20004
EXPOSE 20013
EXPOSE 20014
