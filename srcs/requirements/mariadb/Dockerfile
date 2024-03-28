FROM debian:bullseye

RUN apt update
RUN apt install -y mariadb-server

EXPOSE 3306

COPY ./conf/50-server.conf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

RUN service mysql start && mysql < /var/www/wordpress.sql

CMD ["mysqld", "--bind-adress=0.0.0.0"]