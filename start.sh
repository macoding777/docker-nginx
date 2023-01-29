#!/bin/sh

echo "Starting the server..."
# run php -S 
php -S localhost:500 > /dev/null &
nginx -g "daemon off;"
