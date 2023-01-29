FROM alpine:latest

# install python and nginx
RUN apk add --update nginx php php-cli 
RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && echo "Asia/Jakarta" > /etc/timezone

# copy file
COPY ./config /etc/nginx
COPY ./port /app
# chmod
RUN chmod -R 777 /app
RUN chmod -R 777 /etc/nginx

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["./start.sh"]