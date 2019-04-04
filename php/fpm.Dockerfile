FROM php:7.2.9-fpm-alpine3.8
LABEL maintainer="1252409767@qq.com"

RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/" /etc/apk/repositories && \
    apk update && rm -rf /var/cache/apk/* && \
    apk add --no-cache tzdata

RUN mkdir -p /usr/src/php/ext && \
    cd /usr/src/php/ext && \
    pecl download redis-4.1.1 && tar zxf redis-4.1.1.tgz && mv redis-4.1.1 /usr/src/php/ext/redis && \
    docker-php-ext-install pdo_mysql redis && \
    rm -rf /usr/src

# RUN docker-php-ext-install bcmath mysqli pdo_mysql pcntl
# RUN apk add freetype-dev libjpeg-turbo-dev libpng-dev && \
#     docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
#     docker-php-ext-install gd && \
#     apk add gmp-dev && \
#     docker-php-ext-install gmp

# pecl
# RUN apk add --no-cache $PHPIZE_DEPS && \
#     pecl install -o redis && \
#     echo 'redis.so' > /usr/local/etc/php/conf.d/redis.ini
# http://pecl.php.net/package/mongodb
# RUN pecl install redis && docker-php-ext-enable redis
# RUN pecl install mongodb && docker-php-ext-enable mongodb

# conf
COPY www.ini /usr/local/etc/php/conf.d/
# ADD ./www.pool.conf /usr/local/etc/php-fpm.d/
# WORKDIR /var/www/
