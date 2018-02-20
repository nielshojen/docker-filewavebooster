FROM centos:centos7

MAINTAINER Niels Højen <niels@hojen.net>

ENV FWBOOSTER_VERSION 12.7.0
ENV FWBOOSTER_NAME BOOSTER
ENV FWBOOSTER_LOCATION DATACENTER
ENV FWBOOSTER_SERVER no.server.set
ENV FWBOOSTER_SERVER_PORT 0

RUN yum -y install wget unzip initscripts
RUN wget https://fwdl.filewave.com/$FWBOOSTER_VERSION/FileWave_Linux_$FWBOOSTER_VERSION.zip
RUN unzip FileWave_Linux_$FWBOOSTER_VERSION.zip
RUN rm -f fwxserver-$FWBOOSTER_VERSION-1.0.x86_64.rpm
RUN yum install -y --nogpgcheck fwbooster-$FWBOOSTER_VERSION-1.0.x86_64.rpm

CMD /etc/init.d/fw-booster start
CMD /usr/bin/tail -F /var/log/fwbooster.log

VOLUME /var/FWBooster
VOLUME /usr/local/etc

EXPOSE 20003
EXPOSE 20004
EXPOSE 20013
EXPOSE 20014