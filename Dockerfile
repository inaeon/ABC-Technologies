FROM tomcat:latest
COPY target/ABCtechnologies-1.0.war /usr/local/tomcat/webapps/ROOT.war
CMD ["catalina.sh", "run"]