FROM ubuntu
LABEL maintainer="SandeepReddy"
RUN apt update -y
RUN apt install zip unzip -y
RUN apt install wget -y
RUN apt install curl -y
RUN apt install git -y
RUN apt install maven -y
RUN apt install default-jre -y
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.64/bin/apache-tomcat-9.0.64.zip
RUN unzip apache-tomcat-9.0.64.zip
WORKDIR apache-tomcat-9.0.64/bin
RUN chmod u+x *.sh
#RUN ln -s /opt/apache-tomcat-9.0.64/bin/startup.sh /usr/bin/startTomcat
#RUN ln -s /opt/apache-tomcat-9.0.64/bin/shutdown.sh /usr/bin/stopTomcat

RUN git clone https://github.com/rajarathna123/maven-web-application.git
WORKDIR maven-web-application
RUN mvn clean install 
#ENV "keys=aatmaani"
EXPOSE 8080
RUN cp -r /apache-tomcat-9.0.64/bin/maven-web-application/target/*.war /apache-tomcat-9.0.64/webapps
CMD ["/apache-tomcat-9.0.64/bin/catalina.sh", "run"]
