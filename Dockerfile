FROM openjdk:8-jre-alpine

LABEL maintainer="Ivana Pavic <ivana@ivana.net>"

ENV TOMCAT_MAJOR 9
ENV TOMCAT_VERSION 9.0.2
ENV CATALINA_HOME /usr/local/apache-tomcat

RUN apk upgrade --update && \
  apk add --update curl && \
  curl https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -o /tmp/apache-tomcat.tar.gz && \
  tar -xf /tmp/apache-tomcat.tar.gz -C /usr/local && \
  ln -s /usr/local/apache-tomcat-${TOMCAT_VERSION} /usr/local/apache-tomcat && \
  rm /var/cache/apk/* /tmp/apache-tomcat.tar.gz

WORKDIR ${CATALINA_HOME}
EXPOSE 8080
CMD ["./bin/catalina.sh", "run"]
