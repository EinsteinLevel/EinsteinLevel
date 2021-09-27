FROM ubuntu:20.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update 
RUN apt-get install tomcat9 default-jdk maven git -y
RUN mkdir /tomcat
RUN cd /tomcat
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn package /tomcat/boxfuse-sample-java-war-hello/
RUN cp /tomcat/boxfuse-sample-java-war-hello/target/*.war  /var/lib/tomcat9/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]