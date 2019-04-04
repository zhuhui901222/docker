FROM php:7.2.9-cli-alpine3.8
LABEL maintainer="1252409767@qq.com"

RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/" /etc/apk/repositories && \
    apk update && rm -rf /var/cache/apk/* && \
    apk add --no-cache tzdata

RUN mkdir -p /usr/src/php/ext && \
    cd /usr/src/php/ext && \
    pecl download redis-4.1.1 && tar zxf redis-4.1.1.tgz && mv redis-4.1.1 /usr/src/php/ext/redis && \
    pecl download swoole-4.1.2 && tar zxf swoole-4.1.2.tgz && mv swoole-4.1.2 /usr/src/php/ext/swoole && \
    docker-php-ext-install bcmath pdo_mysql redis swoole && \
    rm -rf /usr/src

# swoole
# RUN curl -O https://gitee.com/swoole/swoole/repository/archive/v4.1.1.zip && unzip v4.1.1.zip && \
#     apk add openssl-dev nghttp2-dev && \
#     cd swoole && \
#     phpize && \
#     ./configure --enable-openssl --enable-http2 --enable-mysqlnd --enable-sockets && make && make install && \
#     docker-php-ext-enable swoole && \
#     rm -rf v4.1.1.zip swoole

# composer
# RUN php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" && php composer-setup.php && rm composer-setup.php && \
#     apk add git && \
#     chmod +x composer.phar && \
#     mv composer.phar /usr/bin/composer && \
#     export PATH="$PATH:$HOME/.composer/vendor/bin" && \
#     composer config -g repo.packagist composer https://packagist.laravel-china.org
# RUN curl -O http://phar.phpunit.cn/phpunit.phar && \
#     chmod +x phpunit.phar && \
#     mv phpunit.phar /usr/bin/phpunit
# RUN curl -L https://cs.sensiolabs.org/download/php-cs-fixer-v2.phar -o php-cs-fixer && \
#     chmod a+x php-cs-fixer && \
#     mv php-cs-fixer /usr/bin/

RUN apk add fish mdocml-apropos

COPY php.ini /usr/local/etc/php/conf.d/
WORKDIR /var/www/
