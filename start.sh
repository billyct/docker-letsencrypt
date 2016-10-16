#!/bin/bash

certbot certonly -c /var/cli.ini
# 用来启动cron，有一点很奇怪就是service cron start就是不能启动，真奇怪
cron
# 用来阻止exit，因为在cron 里面 还运行着一个shell
while true; do sleep 1000; done