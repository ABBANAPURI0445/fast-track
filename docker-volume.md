## docker volumes
   1. container ephemeral 
   2. by using Volumes we can persist data even after kill container
## three types of volumes
   1. volumes : volumes managed by docker engine
   2. bind: 
   3. tmpfs/namedpipe: for store sensitive info 
## how to create volumes
   we can create volumes in two ways
     1. Volume instruction 
     2. create volume and attach container 
## volume instruction 
   1. Dockerfile 
    ```
    FROM tomcat:8
    VOLUME /usr/local/tomcat
    ADD https://war-jar-vn.s3.amazonaws.com/gameoflife.war /usr/local/tomcat/webapps 
    EXPOSE 8080
    CMD ["catalina.sh" ,"run"]
    ```
   2. build docker image ```docker image build -t volume:1.0 .```
   3. run docker container ```docker container run -d -P volume:1.0```
   4. automatically create volume after create container 
## create volume and attach container 
   1. create docker volume 
      ```
      docker --help
      docker volume --help
      docker volume create MyVolume
      docker volume ls
      ```
   2. attach volume to container
      ```
      docker container run -d -P --name volue-c1 --mount src=MyVolume,dst=/var/log  tomcat:8 
      ```
      ``` docker ps --filter "network=bridge" --filter "volume=MyVolume"```   
Note: we cant attach volumes existing containers