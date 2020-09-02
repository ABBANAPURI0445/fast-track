## install docker engine
   1. launch ec2 ubuntu 18.04 ec2 machine
   2. login into ec2 machine 
   3. install docker engine   
        * CE free
        ```
        curl -fsSL https://get.docker.com -o get-docker.sh
        sh get-docker.sh 
        sudo usermod -aG docker ubuntu 
        exit from machine 
        again login 
        ```

        EE paid version 
## manual process
   1. run caontainer with base image 
      ```
      docker container run -d -p 8080:8080 tomcat:8
      ```
   2. login into container 
      ```
      docker exec -it 27ab4b8e0990 /bin/bash
      ``` 
   3. find webapps path
      ```
      /usr/local/tomcat/webapps
      ```

## deploy java application in container 
   1. write Dockerfile 
      ```
      vi Dockerfile 
      ---
      FROM tomcat:8
      LABEL author = Naresh
      ADD https://war-jar-vn.s3.amazonaws.com/gameoflife.war /usr/local/tomcat/webapps
      EXPOSE 8080
      CMD ["catalina.sh", "run"]
      ---
      ```  
   2. build docker image 
      ```
      docker image build -t gameoflife:1.0 .
      ```
   3. test docker container 
      ```
      docker container run -d -p 81:8080 gameoflife:1.0
      docker container stop containerid
      docker container rm containerid
      ``` 
   4. Push Docker Image to ECR (Elastic Conatiner Registry)
      1. create IAM user and configure awscli 
         ```
         sudo apt-get update
         sudo apt-get install awscli -y
         aws configure  
         ``` 
      2. create ECR repository
         1. goto service search for Elastic container registry
         2. create registry 
         3. follow view commands

## Deploy spring boot application 
   1. it requires java only
   2. no need application server 
   3. Dockerfile 
      ```
      FROM openjdk:8
      LABEL author = Naresh
      ADD https://war-jar-vn.s3.amazonaws.com/spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar .
      EXPOSE 8080 
      CMD ["java" ,"-jar","spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar"]
      ```
   4. build docker image 
      ```
      docker image build -t spring:1.0 .
      ```
   5. run docker container
      ```
      docker container run -d -P spring:1.0 
      docker container stop CID
      docker container rm CID
      ```
   6. docker image push to ECR 
      

   