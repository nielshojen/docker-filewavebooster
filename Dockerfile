FROM centos
MAINTAINER Niels Højen <niels@hojen.net>

ADD run.sh /run.sh
RUN chmod 755 /run.sh
CMD ["/run.sh"]

EXPOSE 20003,20013
