FROM debian:bullseye

RUN apt update; \
    apt install -y nginx openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/lmorel.crt -keyout /etc/nginx/ssl/lmorel.key -subj "/C=FR/ST=Lyon/L=Lyon/0=42School/OU=42School/CN=lmorel/"

COPY ./conf/default etc/nginx/sites-enabled/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]