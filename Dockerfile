FROM nginx:alpine

EXPOSE 80 443

ENV DOMAIN_NAME localhost

ENTRYPOINT ["/entrypoint.sh"]
