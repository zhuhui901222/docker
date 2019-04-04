# docker 配置开发环境

docker, docker, docker

[docker 安装](https://cr.console.aliyun.com/#/accelerator)

## 目录结构

不同目录都是不同服务
`docker-compose.yml`: docker-compose 镜像编排配置文件, 所有镜像都在这里
data: 数据目录, 如 mysql/redis 挂载的数据目录
logs: 日志目录, 如 nginx/fpm

## 镜像 & 服务

- Linux 基础镜像: alpine/centos/debian/ubuntu; 添加国内 mirror; 添加时区配置
- php: fpm + php(包含 swoole); 基于 [阿里云镜像服务](https://cr.console.aliyun.com/cn-shanghai/repositories) 自动构建
- python: py2 + py3; 添加 pip mirror
- go: 多阶段 build
- nginx: 参看 [nginx.conf](./nginx/nginx.conf) [www.conf](./nginx/www.conf)
- mysql: 参看 [my.cnf](./mysql/my.cnf)
- redis: 参看 [redis.conf](./redis/redis.conf)

```
# 通过 flags 进行配置
docker run -it --rm mysql:tag --verbose --help
```

---

使用过的镜像:

- goes: 高性能 git sever, base on go
- [swoft](https://www.swoft.org/): 正在参与的开源项目, 高性能服务器框架, base on swoole
- mongodb
- rabbitmq
- [sebp/elk](https://hub.docker.com/r/sebp/elk): [官方文档](https://elk-docker.readthedocs.io)
- [swoft/swoft](https://github.com/swfot-cloude/swoft-docker): swoft 微服务框架
- [inere/alphp](https://github.com/inhere/alphp) [trafex/alpine-nginx-php7](https://hub.docker.com/r/trafex/alpine-nginx-php7): 直接 `apk add` 镜像大小只有 30-40M(官方80M+)
- ssh: [ubuntu+sshd](https://github.com/rastasheep/ubuntu-sshd) [alpine+sshd](https://github.com/Hermsi1337/docker-sshd)

---

打算尝试的镜像:

- zookeeper consul haproxy gitlab gogs(go写的类似gitlab工具) influxdb+grafana/ELK
- [nginx/unit](https://hub.docker.com/r/nginx/unit/)
- [docs/docker.github.io](https://hub.docker.com/r/docs/docker.github.io): 离线docker文档, 不过还是 dash 更方便
- [maven](https://hub.docker.com/r/library/maven/)# docker
