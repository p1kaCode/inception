FROM debian:buster

RUN apt-get update && apt-get install -y wget bash curl php-cli php-mysql php-curl php-gd php-intl php-fpm;

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php

COPY ./tools/wp-setup.sh /

RUN chmod +x wp-setup.sh

ENTRYPOINT ["./wp-setup.sh"]

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]