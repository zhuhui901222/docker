FROM ubuntu:18.04
LABEL maintainer="1252409767@qq.com"

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends tzdata
    # rm -rf /var/lib/apt/lists/*

# FROM debian:jessie

# RUN buildDeps='gcc libc6-dev make' \
#     && apt-get update \
#     && apt-get install -y $buildDeps \
#     && wget -O redis.tar.gz "http://download.redis.io/releases/redis-3.2.5.tar.gz" \
#     && mkdir -p /usr/src/redis \
#     && tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1 \
#     && make -C /usr/src/redis \
#     && make -C /usr/src/redis install \
#     && rm -rf /var/lib/apt/lists/* \
#     && rm redis.tar.gz \
#     && rm -r /usr/src/redis \
#     && apt-get purge -y --auto-remove $buildDeps