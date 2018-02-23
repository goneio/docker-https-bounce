FROM nginx:alpine
MAINTAINER hypnoce@donarproject.org

RUN rm -f /etc/nginx/conf.d/*.conf
ADD ./bounce.conf /etc/nginx/conf.d/

EXPOSE 80
