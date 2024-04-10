#!/bin/sh
sleep 5
wp core download --path=/var/www/html/wordpress --allow-root

cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sed -i "s/database_name_here/${MYSQL_DATABASE}/" var/www/html/wordpress/wp-config.php
sed -i "s/username_here/${MYSQL_USER}/" var/www/html/wordpress/wp-config.php
sed -i "s/password_here/${MYSQL_PASSWORD}/" var/www/html/wordpress/wp-config.php
sed -i "s/localhost/mariadb:3306/" var/www/html/wordpress/wp-config.php

wp core install	--path="/var/www/html/wordpress" --allow-root --url=$DOMAIN_NAME --title=inception --admin_user=$MYSQL_ROOT --admin_password=$MYSQL_ROOT_PASSWORD --admin_email=$MYSQL_ROOT_MAIL

wp user create --path="/var/www/html/wordpress" --allow-root $MYSQL_USER $MYSQL_USER_MAIL --user_pass=$MYSQL_PASSWORD

mkdir -p /run/php
printf "php-fpm7.4\n"
php-fpm7.4 -F
