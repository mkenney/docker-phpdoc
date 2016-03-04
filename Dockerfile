FROM mkenney/php-cli:php5

MAINTAINER Michael Kenney <mkenney@webbedlam.com>

# System update
RUN apt-get -q -y update

RUN apt-get -q -y install graphviz
RUN pear channel-discover pear.phpdoc.org && pear install phpdoc/phpDocumentor

RUN apt-get clean && rm -r /var/lib/apt/lists/*

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["phpdoc"]
