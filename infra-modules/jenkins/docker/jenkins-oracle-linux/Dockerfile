FROM jenkinsci/blueocean:latest
 
MAINTAINER Joe Rice
 
USER root

# https://wiki.alpinelinux.org/wiki/Docker
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" > /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && apk add --update docker

RUN apk add --update shadow \
    && groupmod -g 152 docker \
    && usermod -a -G docker jenkins

USER jenkins