FROM centos
MAINTAINER Niels Højen <niels@hojen.net>

ENV FWBOOSTER_VERSION 12.0.3

ADD run.sh /run.sh
RUN chmod 755 /run.sh
CMD ["/run.sh"]

VOLUME ["/var/FWBooster"]

EXPOSE 20003
EXPOSE 20013
