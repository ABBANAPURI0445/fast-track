## bridge networking:
   1. default
   2. customised 
## run container
   ```
   docker container run -d -P tomcat:8  -- this container deploy in default network 
   docker network ls
   ```
## deploy container in my custom network 
   1. create docker network
      ```
      docker --help
      docker network --help
      docker network create --ip-range 192.168.0.0/16 --subnet 192.168.0.0/24 MyNetwork
      docker ps --filter "network=MyNetwork" 
      ```
   2. deploy container in my network 
      ```
      docker container run -d -P --network MyNetwork tomcat:8 
      ```
## Test
   1. create 2 containers in same network
   2. login into container1 and ping container2
      ```
      docker container exec -it CIDorCname /bin/bash
      and ping C2

      docker container exec -it cef1e95ca2c0 ping gol_network
      ```
## Connect/disconnect 
   1. disconnect conatiner from MyNetwork
      ```
      docker network disconnect Networkname_or_ID CID_or_Cname
      ```
   2. connect container to default bridge netwrok
      ```
      docker network connect Networkname_or_ID CID_or_Cname
      ``` 
## remove multiple container/images/network 
   ```
   docker container rm -f $(docker ps -aq)
   docker image rmi -f $(docker image ls)
   ```
   
