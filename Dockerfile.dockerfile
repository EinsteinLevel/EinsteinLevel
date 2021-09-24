FROM ubuntu:20.04
RUN apt-get update 
RUN apt-get install tomcat9 default-jdk maven git
RUN cd
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
