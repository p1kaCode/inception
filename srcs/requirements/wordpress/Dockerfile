FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install curl php php-fpm php-mysql mariadb-client -y

EXPOSE 9000

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp

RUN chmod +x /usr/local/bin/wp

RUN mkdir -p /var/www/html/wordpress

COPY tools/wp-setup.sh /
RUN chmod +x wp-setup.sh

RUN mkdir -p /var/run/php

CMD ["./wp-setup.sh"]