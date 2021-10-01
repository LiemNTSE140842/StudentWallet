FROM tomcat:8.5.68-jdk8-adoptopenjdk-openj9

LABEL maintainer="client@vinhnhan.com"

ADD /FWallet.Web/dist/FWallet.Web.war /usr/local/tomcat/webapps/


EXPOSE 8080
CMD ["catalina.sh", "run"]