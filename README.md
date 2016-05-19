# Environment independent phpdocumentor script

The source repo contains a `phpdoc` script that wraps executing a docker container to execute [phpdoc](https://www.phpdoc.org/). The current directory is mounted into /src in the container and a wrapper script executes composer as a user who's `uid` and `gid` matches those properties on that directory. This way the documentation is written as the directory owner/group instead of root or a random user.

Because this runs out of a Docker container, all source code input and the output location must be available within the current directory. Specifying files or directories from other locations on the system will not work. For example, `-f /some/file.php` would attempt to find the file inside the container instead of on the host.

# SOURCE REPOSITORY

* [mkenney/docker-phpdoc](https://github.com/mkenney/docker-phpdoc)

# Docker image

* [mkenney/phpdoc](https://hub.docker.com/r/mkenney/phpdoc/)

Based on [mkenney/php-base](https://hub.docker.com/r/mkenney/php-base/) (debian:jessie) which is simply a php CLI binary built with various tools, most notably Oracle OCI libraries, because they're a pain to install.

# Tagged Dockerfiles

* [latest](https://github.com/mkenney/docker-phpdoc/blob/master/Dockerfile), [php7](https://github.com/mkenney/docker-phpdoc/blob/master/Dockerfile)
* [php5](https://github.com/mkenney/docker-phpdoc/blob/php5/Dockerfile)
