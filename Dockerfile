# tomcat comes from http://apache.rediris.es/tomcat/tomcat-8/v8.0.50/bin/apache-tomcat-8.0.50.zip
FROM postgres:9.6-alpine

EXPOSE 5432 8080

RUN mkdir -p /opt/tomcat
ADD ./apache-tomcat-8.0.50/ /opt/tomcat/
RUN rm -r /opt/tomcat/webapps/ROOT/*

ADD ./ROOT/ /opt/tomcat/webapps/ROOT/

RUN apk add --no-cache openjdk8-jre unzip && chmod +x /opt/tomcat/bin/*.sh

ADD ./init.sh /docker-entrypoint-initdb.d/
ADD ./start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

CMD ["start.sh"]
