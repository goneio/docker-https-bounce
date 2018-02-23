FROM nginx:alpine
MAINTAINER hypnoce@donarproject.org

RUN rm -f /etc/nginx/conf.d/*.conf && apk add --no-cache curl && chmod g+w /var/run
ADD ./bounce.conf /etc/nginx/conf.d/
ADD ./docker-healthcheck.sh /usr/local/bin

VOLUME /var/run

EXPOSE 80
