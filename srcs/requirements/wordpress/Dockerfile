FROM debian:buster

COPY ../../.env /app/.env

RUN apt-get-get update;
	apt-get install -y wget bash curl;
	apt-get -y install php-cli php-mysql php-curl php-gd php-intl;
	apt-get install -y php-fpm;

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php

COPY ./tools/wp-setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp-setup.sh
ENTRYPOINT ["./usr/local/bin/wp-setup.sh"]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]