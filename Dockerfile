FROM alpine:latest

# install python and nginx
RUN apk add --update nginx php php-cli 

# copy nginx.conf to /etc/nginx/nginx.conf
# run php -s localhost:81

RUN php -S 0.0.0.0:81


COPY nginx.conf /etc/nginx/nginx.conf


# run nginx 
CMD ["nginx", "-g", "daemon off;"]