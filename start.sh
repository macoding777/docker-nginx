#!/bin/sh

echo "Starting the server..."
# run php -S 
nginx -g "daemon off;" &
php-fpm 
php -S localhost:500 > /dev/null &



