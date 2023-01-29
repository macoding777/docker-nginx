FROM alpine:latest

# install python and nginx
RUN apk add --update nginx php php-cli 
RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && echo "Asia/Jakarta" > /etc/timezone
# install all extension php
# install php extension
RUN apk add php-fpm php-json php-mbstring php-mysqli php-openssl php-pdo php-pdo_mysql php-phar php-session php-tokenizer php-xml php-zip php-curl php-gd php-xml php-xmlwriter php-xmlreader php-simplexml php-dom php-fileinfo php-ctype php-iconv php-bcmath php-zlib php-xmlrpc php-soap php-posix php-pcntl php-redis php-memcached php-mongodb php-pgsql php-pdo_pgsql php-pdo_sqlite php-sqlite3 php-pdo_dblib php-ldap php-intl php-imagick php-gmp php-bz2 php-ldap php-pear php-dev php-pear php-dev php-curl


# copy file
COPY ./config /etc/nginx
COPY ./port /app
# chmod
RUN chmod -R 777 /app
RUN chmod -R 777 /etc/nginx

COPY start.sh ./start.sh
RUN chmod +x ./start.sh

CMD ["./start.sh"]