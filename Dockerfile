FROM tomcat:8.5.55-jdk8-openjdk
COPY ./target/CustomEbooks.war /usr/local/tomcat/webapps/
