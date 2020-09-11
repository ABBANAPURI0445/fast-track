## pricing model 
   1. on-demand 
      1. billing is enable when machine in running state 
      2. 2pm start - 10pm stop 
      3. aws cli 
          ```
          aws ec2 start-instances --instance-ids i-0320b4c5c0b66691a 
          ```
   2. reserved 
       1. doesnt matter whether the running state or stoped state billing always enable 
   3. spot instance(bidding) save upto 90% on demand 
   4. dedicate hardware (costly) 
## Free tier 
   1. 750 hrs free per month , unit 1 hour
   2. 30GB EBS Volumes free at a time 