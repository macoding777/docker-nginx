FROM alpine:latest

# install python and nginx
RUN apk add --update nginx php php-cli 
RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && echo "Asia/Jakarta" > /etc/timezone

COPY ./config /etc/nginx




COPY ./port /app
WORKDIR /app




RUN chmod -R 777 /app
COPY start.sh /
RUN chmod +x /start.sh
RUN pwd && ls -la
CMD ["./start.sh"]