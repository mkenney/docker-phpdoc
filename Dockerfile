FROM mkenney/composer

MAINTAINER Michael Kenney <mkenney@webbedlam.com>

##############################################################################
# phpdoc
##############################################################################

RUN set -x \

    # Install additional required packages
    && apk add --no-cache --repository "http://dl-cdn.alpinelinux.org/alpine/edge/testing" \
        graphviz \
        php7-common \
        php7-ctype \
        php7-dom \
        php7-xml \

    # Install phpdoc
    && sudo -u dev /usr/local/bin/composer global require "phpdocumentor/phpdocumentor:2.*"

ENTRYPOINT ["/as-user","/home/dev/.composer/vendor/bin/phpdoc"]
