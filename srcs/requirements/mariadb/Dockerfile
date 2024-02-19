FROM debian:buster

RUN apt update
RUN apt install -y mariadb-server

EXPOSE 3306

COPY ./conf/50-server.conf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

RUN service mysql start && mysql < /var/www/wordpress.sql

CMD ["mysqld"]





# RUN apt update; \
#     apt install -y mariadb-server \
# 	mariadb-client \
# 	&& rm -rf /var/lib/lists/*

# RUN mkdir -p /var/run/mysqld \
# && chown -R mysql:mysql /var/run/mysqld \
# && chmod 777 /var/run/mysqld

# EXPOSE 3306

# ENV MYSQL_ROOT_PASSWORD MYSQL_DATABASE MYSQL_USER MYSQL_PASSWORD

# COPY ./tools/mariadb.sh /usr/local/bin/
# COPY ./conf/wordpress.sql /usr/local/bin/

# RUN chmod +x /usr/local/bin/mariadb.sh
# RUN chmod +x /usr/local/bin/wordpress.sql

# ENTRYPOINT ["bash", "./usr/local/bin/mariadb.sh"]

# VOLUME /var/lib/mysql

# CMD ["mysqld", "--bind-address=0.0.0.0"]