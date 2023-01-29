FROM alpine:latest

# install python and nginx
RUN apk add --update nginx php php-cli 
COPY config /etc/nginx
COPY port /var/www/html
WORKDIR /var/www/html



RUN chmod -R 777 /var/www/html
COPY start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT [ "./start.sh" ]