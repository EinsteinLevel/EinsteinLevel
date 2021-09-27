FROM ubuntu:20.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install tomcat9 default-jdk maven git -y
RUN mkdir /tomcat && chmod /tomcat -777 && cd /tomcat && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && cd /tomcat/boxfuse-sample-java-war-hello/ && pwd && mvn package && cp /tomcat/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/hello-1.0.war
EXPOSE 8080
CMD ["catalina.sh", "run"]