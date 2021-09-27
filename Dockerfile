FROM tomcat:9
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install default-jdk maven git -y
RUN mkdir /tomcat && chmod /tomcat -777 && cd /tomcat && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && cd /tomcat/boxfuse-sample-java-war-hello/ && pwd && mvn package && cp /tomcat/boxfuse-sample-java-war-hello/target/*.war /usr/local/tomcat
EXPOSE 8080
CMD ["catalina.sh", "run"]