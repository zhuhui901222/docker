FROM centos:7.5.1804
LABEL maintainer="1252409767@qq.com"

COPY CentOS-Base.repo /etc/yum.repos.d/
RUN yum install -y epel-release && \
    rpm -Uvh https://mirrors.tuna.tsinghua.edu.cn/remi/enterprise/remi-release-7.rpm && \
    yum makecache
# yum clean all

# swoole
# RUN yum install -y epel-release && \
#     rpm -Uvh https://mirrors.tuna.tsinghua.edu.cn/remi/enterprise/remi-release-7.rpm && \
#     yum makecache
# RUN yum install -y php72 php72-php-pecl-swoole2
# ENV PATH="/opt/remi/php72/root/usr/bin:${PATH}"

# # grpc
# RUN yum install -y make zlib-devel

WORKDIR /var/www/
