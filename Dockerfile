FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf.tmp

EXPOSE 80 443

ENV DOMAIN_NAME localhost

ENTRYPOINT ["/entrypoint.sh"]
