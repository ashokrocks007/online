FROM tomcat:9
LABEL AUTHOR="kiran023"
COPY target/*.war /usr/local/tomcat/webapps/obstore-0.1.war