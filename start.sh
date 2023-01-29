#!/bin/sh

echo "Starting the server..."
# run php -S 
rc-service php-fpm8 start
php -S localhost:500 > /dev/null &



nginx -g "daemon off;"
