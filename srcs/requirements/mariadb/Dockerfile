FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN	apt-get install -y mariadb-server

COPY conf/server.cnf /etc/mysql/mariadb.conf.d/server.cnf

COPY tools/db-setup.sh /
RUN chmod +x db-setup.sh

CMD service mariadb start && ./db-setup.sh && mysqld_safe

EXPOSE 3306