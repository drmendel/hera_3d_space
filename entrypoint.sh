#!/bin/sh
envsubst '${DOMAIN_NAME}' < /etc/nginx/nginx.conf.tmp > /etc/nginx/nginx.conf
exec nginx -g 'daemon off;'