#!/bin/bash

# just for testing the cron
#echo test >> /var/log/letsencrypt/corn.log 2>&1
certbot renew >> /var/log/letsencrypt/corn.log 2>&1