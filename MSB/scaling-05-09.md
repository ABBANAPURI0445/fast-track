1. scaling
   1. vertical scaling 
      1. increase hardsize (change instance type)
      2. we cant change instance type  running machine
      3. here we need to stop ec2 machine and change type
      4. it require downtime 
   2. horizontal scaling(autoscaling)
      1. increase/decrease machine based on user trafic 
      2. when cpu utilization > 75 add one machine
      3. when cpu utilization < 40  remove one machine
    ## Setup:
       1. create image
       2. Launch configuration: it define all attribute white require to launch machines
       3. ASG: scaling policies and min and max 
    ## apply stress on cpu (artifially)
       1. install stress tool in ec2
          ```
          sudo apt-get install stress -y
          ```
       2. apply stress ```stress```
       3. copy example ```stress --cpu 8 --io 4 --vm 2 --vm-bytes 128M --timeout 10m```
      