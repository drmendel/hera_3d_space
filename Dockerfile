FROM nginx:alpine

RUN apk add --no-cache bash

COPY nginx.conf /etc/nginx/nginx.conf.tmp
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80 443

ENV DOMAIN_NAME localhost

ENTRYPOINT ["/entrypoint.sh"]
