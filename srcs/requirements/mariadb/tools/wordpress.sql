CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER 'lmorel'@'localhost' IDENTIFIED BY '4242';
GRANT ALL PRIVILEGES ON wordpress.* TO 'lmorel'@'localhost';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '4242';
