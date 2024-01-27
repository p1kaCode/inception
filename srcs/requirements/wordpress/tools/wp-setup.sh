#!/bin/sh

if [ -f ./wp-config.php ]
then
	echo "wordpress already there"
else

	wget https://wordpress.org/lastest.tar.gz
	tar xfz lastest.tar.gz
	mv wordpress/* .
	rm -rf lastest.tar.gz
	rm -rf wordpress

	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php

fi

exec "$@"