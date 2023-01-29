FROM alpine:latest

# install python and nginx
RUN apk add --update nginx php php-cli 

# copy nginx.conf to /etc/nginx/nginx.conf
# run php -s localhost:81

# run php -s localhost:81 di background
RUN php -S 0.0.0.0:81 &


COPY c.conf /etc/nginx/nginx.conf

# CMD [ "php","-S","0.0.0.0:81" ]
# run nginx 
CMD ["nginx", "-g", "daemon off;"]