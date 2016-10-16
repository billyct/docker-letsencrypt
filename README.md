# docker-letsencrypt

a simple docker container for letsencrypt

## usage
```
$ git clone https://github.com/billyct/docker-letsencrypt.git
$ cd docker-letsencrypt
$ docker-compose up -d
```

## something

这个docker的思路是只提供关于https的文件，还有就是使用cron来每个月更新pem文件，使用的是webroot模式，而为什么不使用standalone模式，是因为个人理解nginx可能会做很多虚拟机的事情，而renew一次pem都应该停掉原来的占用着80端口运行的nginx这样成本还是比较高的，因为已经把cron放到了container里面，而如果不把cron放到container里，其实还是可以去使用standalone的，因为这样的话，其实就直接按照[certbot官网](https://certbot.eff.org/docs/using.html#running-with-docker)的思路就好了，类似把container当做是一个certbot程序就好。

当然现在这样的情况，就要自己去配置nginx来做域名的认证