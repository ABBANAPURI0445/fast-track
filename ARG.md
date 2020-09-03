FROM openjdk:8
LABEL author = Naresh
ARG src
ARG port
ADD $src .
EXPOSE $port 
CMD ["java" ,"-jar","spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar"]


1. build docker image 
   ```
   docker image build --build-arg src=https://war-jar-vn.s3.amazonaws.com/spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar --build-arg port=8080 -t spring:1.0 .
   ```