FROM ubuntu:20.04
RUN sudo su
RUN apt-get update 
RUN apt-get install tomcat9 default-jdk maven git -y
RUN cd
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd ./boxfuse-sample-java-war-hello
RUN mvn package
RUN cp ./boxfuse-sample-java-war-hello/target/*.war /var/lib/lib/tomcat9/webapps/
