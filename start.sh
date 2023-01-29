#!/bin/sh

echo "Starting the server..."
# run php -S 
php-fpm -D
nginx -g "daemon off;"