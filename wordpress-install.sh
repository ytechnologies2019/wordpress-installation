#!/bin/bash
sudo dnf update -y
sudo dnf install -y httpd wget php-fpm php-mysqli php-json php php-devel
sudo dnf install -y mariadb105-server
sudo dnf install httpd -y
sudo systemctl start httpd && sudo systemctl enable httpd
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
sudo systemctl start mariadb
sudo mysql_secure_installation
[ec2-user@ip-172-31-28-38 ~]$ cat wordpress
cat: wordpress: Is a directory
[ec2-user@ip-172-31-28-38 ~]$ cat wordpress-install.sh
#!/bin/bash
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
sudo systemctl start mariadb httpd
