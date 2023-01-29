FROM alpine:latest

# install python and nginx
RUN apk add --update nginx php php-cli 
RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && echo "Asia/Jakarta" > /etc/timezone
# install all extension php
# install php extension
RUN apk add php-curl php-fpm php-gd curl php-cgi
RUN apk add openrc --no-cache


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