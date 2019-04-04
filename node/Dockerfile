FROM node:10.10.0-alpine
LABEL maintainer="1252409767@qq.com"

RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/" /etc/apk/repositories && \
    apk update && rm -rf /var/cache/apk/* && \
    apk add --no-cache tzdata

RUN npm config -g set registry https://registry.npm.taobao.org && \
    apk add --no-cache yarn && \
    yarn config set registry https://registry.npm.taobao.org

WORKDIR /var/www/
