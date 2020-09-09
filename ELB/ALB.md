## Application Load balancer 
   1. create ASG Payment service 
      1. Launch Ec2 machine and login into ec2 machine 
      2. install apache2 
      3. create file and insert HTML content 
         ```
         sudo -i
         cd /var/www/html/
         mkdir Payment 
         cd Payment
         vi index.html
         ---
         <h1>Hello this is Payment Page</h1> 
         ---
         ```
      4. create image 
      5. create launch configuration
      6. create ASG
   2. create ASG Booking service 
      1. Launch Ec2 machine and login into ec2 machine 
      2. install apache2 
      3. create file and insert HTML content 
         ```
         sudo -i
         cd /var/www/html/
         mkdir Booking
         cd Booking
         vi index.html
         ---
         <h1>Hello this is Booking Page</h1> 
         ---
         ```
      4. create image 
      5. create launch configuration
      6. create ASG  
## create two target groups
   1. Payment 
   2. Booking 
## add target groups in ASG 
## create ALB 
   


   ALB-667678795.us-east-1.elb.amazonaws.com/Payment/index.html 