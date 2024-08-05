##Install the neccessary package
chmod +x neccessary-package.sh
chmod +x wordpress-install.sh

##Install
./neccessary-package.sh
--
    #Install the mysql
    Enter current password for root (enter for none) : blank
    Switch to unix_socket authentication [Y/n] : n
    Change the root password? [Y/n] : n
    Remove anonymous users? [Y/n] : Y
    Disallow root login remotely? [Y/n] : n
    Remove test database and access to it? [Y/n] : Y
    Reload privilege tables now? [Y/n] : Y

    #Login to mysql
    mysql -u root -p
      (Login with your root password)

    #Install wordpress
./wordpress-install.sh


##Create Table
    -> mysql -u root -p
    -> CREATE DATABASE `wordpress-db`;
    -> GRANT ALL PRIVILEGES ON `wordpress-db`.* TO "wordpress-user"@"localhost";
    -> FLUSH PRIVILEGES;

##Config the wordpress
    -> cp wordpress/wp-config-sample.php wordpress/wp-config.php
    -> nano wordpress/wp-config.php

        $Find and $Update at *wp-config.php
        define('DB_NAME', 'wordpress-db');
        define(‘DB_USER’, ‘wordpress-user’);
        define(‘DB_PASSWORD’, 'your_strong_password');
##Deploy WordPress
     -> sudo cp wordpress/* /var/www/html
     -> sudo mkdir /var/www/blog
     -> sudo cp -r wordpress/* /var/www/html/blog/

##Configure Apache
     -> sudo nano /etc/httpd/conf/httpd.conf
       **  Find the section that starts with <Directory “/var/www/html”>.
       Change the AllowOverride None line in the above section to read AllowOverride All.
---
     -> sudo systemctl restart httpd
