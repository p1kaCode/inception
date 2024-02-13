FROM debian:buster

RUN apt update; \
    apt install -y nginx openssl

RUN mkdr /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/lmorel.crt -keyout /etc/nginx/ssl/lmorel.key -subj "/C=FR/ST=Paris/L=Paris/0=42 School/OU=lmorel/CN=lmorel/"

COPY ./conf/default etc/nginx/sites-enabled/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]