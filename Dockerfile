FROM quay.io/letsencrypt/letsencrypt:latest

VOLUME ["/etc/letsencrypt", "/var/lib/letsencrypt", "/var/log/letsencrypt", "/var/www/webroot"]

COPY ./cli.ini /var/

COPY ./renew.sh /
RUN chmod +x /renew.sh
# 每个月执行一次renew
RUN crontab -l | { cat; echo "0 0 1 * * /renew.sh"; } | crontab -
RUN service cron restart

COPY ./start.sh /
RUN chmod +x /start.sh
#CMD certbot certonly --webroot -w /var/www/webroot --rsa-key-size 4096 -m billy_allen@126.com -d billyct.tunnel.qydev.com --text --agree-tos -n
ENTRYPOINT ["/bin/bash"]
CMD ["/start.sh"]

