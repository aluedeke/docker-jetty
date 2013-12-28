# jetty 8
#
# VERSION               0.0.1

FROM      ubuntu
MAINTAINER Andreas Lüdeke <andreas@ludeke.net>

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

#dependencies
RUN apt-get install -y openjdk-7-jre-headless tar

#Jetty
RUN adduser --system jetty
RUN mkdir /opt/jetty

ADD http://eclipse.org/downloads/download.php?file=/jetty/stable-8/dist/jetty-distribution-8.1.14.v20131031.tar.gz&r=1 /opt/jetty.tar.gz

RUN cat /opt/jetty.tar.gz | tar -C /opt/jetty --strip-components=1 -xz
RUN chown -R jetty /opt/jetty

USER jetty
EXPOSE 8080

CMD ["/opt/jetty/bin/jetty.sh", "-d", "run"]
