FROM alpine:3.8
LABEL maintainer="1252409767@qq.com"

RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/" /etc/apk/repositories && \
    echo "http://mirrors.ustc.edu.cn/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
    # rm -rf /var/cache/apk/* && \
    apk add --no-cache tzdata

# better tool
RUN apk add --no-cache gosu fish mdocml-apropos
# ack htop mtr aria2 iproute2 drill apache2-utils curl

WORKDIR /var/www/