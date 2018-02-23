FROM nginx:alpine
MAINTAINER hypnoce@donarproject.org

RUN rm -f /etc/nginx/conf.d/*.conf && apk add --no-cache curl && chmod g+w /var/run

COPY ./bounce.conf /etc/nginx/conf.d/
COPY ./docker-healthcheck.sh /usr/local/bin

VOLUME /var/run

EXPOSE 80
