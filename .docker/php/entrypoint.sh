#!/usr/bin/env bash
php -v
supervisord -n -c /etc/supervisord.conf

FILE=/var/www/html/.env
if ! test -f "$FILE"; then
    cp /var/www/html/.env.example /var/www/html/.env
    composer install
    npm i
fi
