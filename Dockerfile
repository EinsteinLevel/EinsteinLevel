FROM tomcat:9
ENV TZ=Europe/Moscow
RUN mkdir /tomcat && chmod /tomcat -777 && cd /tomcat && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && cd /tomcat/boxfuse-sample-java-war-hello/ && pwd && mvn package && cp /tomcat/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/hello-1.0.war
EXPOSE 8080
CMD ["catalina.sh", "run"]