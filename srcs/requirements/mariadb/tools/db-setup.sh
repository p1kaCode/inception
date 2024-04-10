#!/bin/sh

until mysqladmin ping &>/dev/null; do
  echo "Attente du démarrage du service MySQL..."
  sleep 1
done

echo "---------------SETUP START !---------------"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
echo "database created = $?"

mysql -u root -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
echo "user created = $?"

mysql -u root -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
echo "granted = $?"

mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
echo "root pass = $?"

mysql -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES"
echo "flushed = $?"

echo "---------------SETUP DONE !---------------"

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

