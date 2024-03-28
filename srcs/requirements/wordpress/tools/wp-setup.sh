#!/bin/sh

sleep 5

if [ -f ./wp-config.php ]
then
	echo "wordpress already there"
else
	cd /var/www/html
	wget https://wordpress.org/latest.tar.gz
	tar -xzvf latest.tar.gz
	cp -R wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
fi

cd

chown -R www-data:www-data /var/www/html

/usr/sbin/php-fpm7.4 -F