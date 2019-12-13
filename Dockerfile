#pull down centos image
FROM centos
MAINTAINER Lihui
#copy jdk into image
ADD ./jdk-7u80-linux-x64.tar.gz /root
#set environment variable
ENV JAVA_HOME /root/jdk1.7.0_80
ENV PATH $JAVA_HOME/bin:$PATH
#define entry point which will be run first when the container starts up
USER root

RUN mkdir /jboss && \
 chmod 777 /jboss

COPY ./jboss-as-7.1.1.Final /jboss/jboss-as-7.1.1.Final
ENTRYPOINT  /jboss/jboss-as-7.1.1.Final/bin/standalone.sh && tail -F /jboss/jboss-as-7.1.1.Final/standalone/log/server.log
