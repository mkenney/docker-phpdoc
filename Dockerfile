FROM mkenney/php-cli:latest

MAINTAINER Michael Kenney <mkenney@webbedlam.com>

# System update
RUN apt-get -q -y update

RUN apt-get -q -y install graphviz
RUN pear channel-discover pear.phpdoc.org && pear install phpdoc/phpDocumentor

RUN apt-get clean && rm -r /var/lib/apt/lists/*

VOLUME ["/app"]
WORKDIR /app
ENV TERM xterm

ENTRYPOINT ["phpdoc"]
