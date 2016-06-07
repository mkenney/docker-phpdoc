#FROM mkenney/composer:php5
#FROM alpine:latest
FROM php:5-alpine

MAINTAINER Michael Kenney <mkenney@webbedlam.com>

RUN set -x \
    && apk update \

    # Install additional required packages
    && apk add --no-cache --virtual .persistent-deps \
        ca-certificates \
#        openssh \
        sudo \
    && update-ca-certificates \

    # Create a dev user to use as the directory owner
    && addgroup dev \
    && adduser -D -s /bin/sh -G dev -G root dev \
    && echo "dev:password" | chpasswd \

    # Setup wrapper scripts
    && curl -o /run-as-user https://raw.githubusercontent.com/mkenney/docker-scripts/master/container/run-as-user \
    && chmod 0755 /run-as-user \

##############################################################################
# phpdoc
##############################################################################

    # Install phpdoc
    && pear channel-discover pear.phpdoc.org \
    && pear install --alldeps phpdoc/phpDocumentor

VOLUME /src
WORKDIR /src

ENTRYPOINT ["/run-as-user", "/usr/local/bin/phpdoc"]



#    # Install additional required packages
#    && apk add --no-cache --repository "http://dl-cdn.alpinelinux.org/alpine/edge/testing" \
#        ca-certificates \
#        graphviz \
#        openssh \
#        php5-ctype \
#        php5-json \
#        php5-openssl \
#        php5-pear \
#        php5-phar \
#        php5-xsl \
#        shadow \
#        sudo \
#        wget \

