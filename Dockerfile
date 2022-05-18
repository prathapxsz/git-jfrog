FROM tomcat:9.0.48

MAINTAINER info@ovaledge.com(optional)

ENV DEFAULT_OVALEDGE_BIGQUERY_MAX_CONNECTIONS=10

WORKDIR /root/temp/ovaledge.war

RUN wget https://ovaledge.s3.us-west-1.amazonaws.com/Release+Builds/Release5.1.7/ovaledge.war

COPY catalina.properties /root/temp/catalina.properties

RUN mkdir -p /usr/local/tomcat/conf/saml

COPY keystore.jks /usr/local/tomcat/conf/keystore.jks

EXPOSE 8080

COPY run.sh /run.sh

RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
