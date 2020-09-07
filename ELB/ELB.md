## create autoscaling group 
   1. create image 
       1. launch EC2  machine 
       2. install LAMP stack
       3. create image
   2. launch configuration
   3. autoscaling group
## ELB 
   1. create network loadbalancer 
## Add ELB in ASG 
   1. goto ASG
   2. goto actiction and click on Edit
   3. add target group  
## Application LB 
   1. launch Ec2 machine 
     1. login into one ec2 machine (Payment)
        ```
        sudo yum install httpd -y
        sudo systemctl start httpd
        sudo -i
        cd /var/www/html
        mkdir Payment
        cd Payment
        vi index.html
        Path: /var/www/html/Payment/index.html
    
        <h1>Hello this is Payment Page</h1>
        ``` 
    2. login into 2 machine (Booking)
       ```
        sudo yum install httpd -y
        sudo systemctl start httpd
        sudo -i
        cd /var/www/html
        mkdir Booking
        cd Booking
        vi index.html
        <h1>Hello this is Booking Page</h1>
       ``` 
    3. create Target groups 
       1. target group name: Payment 
           1. leave default values except path /Payment/index.html 
           2. Edit add target group
       2. 1. leave default values except path /Booking/index.html
          2. Edit add target group 
   4. create application LB
      1. goto listeners and add rules
