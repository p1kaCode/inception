FROM debian:buster

#COPY ../../.env /app/.env

RUN apt update; \
    apt install -y mariadb-server \
	mariadb-client \
	&& rm -rf /var/lib/lists/*

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

EXPOSE 3306

ENV MYSQL_ROOT_PASSWORD MYSQL_DATABASE MYSQL_USER MYSQL_PASSWORD

COPY ./tools/mariadb.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/

RUN chmod +x /usr/local/bin/mariadb.sh
RUN chmod +x /usr/local/bin/wordpress.sql

ENTRYPOINT ["./usr/local/bin/mariadb.sh"]

VOLUME /var/lib/mysql

CMD ["mysqld", "--bind-address=0.0.0.0"]