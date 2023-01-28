FROM alpine:latest



RUN apk update && apk add curl wget vim unzip zip php php-fpm nginx

RUN php -v


RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && echo "Asia/Jakarta" > /etc/timezone

COPY ./port /var/www/html

RUN chmod -R 777 /var/www/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'