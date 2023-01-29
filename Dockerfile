FROM alpine:latest

# install python and nginx
RUN apk update && apk upgrade
RUN apk add --update nginx
RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && echo "Asia/Jakarta" > /etc/timezone
# install all extension php
# install php extension
RUN apk add openrc --no-cache

# INSTALL PHP
RUN apk add php7 php7-fpm php7-opcache 
# install module 
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl

# copy file
COPY ./config /etc/nginx
COPY ./port /app
# chmod
RUN chmod -R 777 /app
RUN chmod -R 777 /etc/nginx

COPY start.sh ./start.sh
RUN chmod +x ./start.sh


RUN php -v
# run php fpm
# RUN php-fpm

# check nginx
RUN nginx -t

CMD ["./start.sh"]