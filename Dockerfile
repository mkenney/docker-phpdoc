FROM mkenney/php-base:php5

MAINTAINER Michael Kenney <mkenney@webbedlam.com>

##############################################################################
# phpdoc
##############################################################################

RUN apt-get -q -y update \
    && apt-get -q -y install graphviz \
    && pear channel-discover pear.phpdoc.org \
    && pear install phpdoc/phpDocumentor \
    && apt-get clean && rm -r /var/lib/apt/lists/*

ENTRYPOINT ["/as-user","/usr/local/bin/phpdoc"]
