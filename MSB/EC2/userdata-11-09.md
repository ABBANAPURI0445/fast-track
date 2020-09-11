## userdata  
   run any commands while launching EC2 instance 
   ```
   sudo apt update
   sudo apt install apache2 -y
   sudo apt install php libapache2-mod-php php-mysql -y 
   sudo systemctl restart apache2
   sudo echo "<?php phpinfo(); ?>" > /var/www/html/info.php
   ```
  1. Launch ec2 machine and add user data 
     1. goto 3rd step and advance details 

