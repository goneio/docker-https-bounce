FROM nginx:alpine
MAINTAINER hypnoce@donarproject.org

RUN rm -f /etc/nginx/conf.d/*.conf
ADD ./bounce.conf /etc/nginx/conf.d/
ADD ./docker-healthcheck.sh /usr/local/bin

EXPOSE 80
