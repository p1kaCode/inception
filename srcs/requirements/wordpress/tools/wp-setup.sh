#!/bin/sh

if [ -f ./wp-config.php ]
then
	echo "wordpress already there"
else

	wget https://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	cd /var/www/html
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$DOMAIN_NAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php

	# cd /var/www/html
	# wp core download --allow-root
	# cd
	# mv wp-config.php /var/www/html/
	# wp core install --allow-root --url=${DOMAIN_NAME} --title=${MYSQL_DATABASE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	# wp user create --allow-root ${MYSQL_USER} ${WP_USER_EMAIL} --user_pass=${MYSQL_PASSWORD}
fi

exec "$@"