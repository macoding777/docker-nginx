FROM alpine:latest

# install python and nginx
RUN apk add --update python py-pip nginx php php-cli 

# copy nginx.conf to /etc/nginx/nginx.conf
# run php -s localhost:81

CMD ["php", "-S", "localhost:81"]


COPY nginx.conf /etc/nginx/nginx.conf


# run nginx 
CMD ["nginx", "-g", "daemon off;"]