#! /bin/bash

# you need root execute
yum -y update

# get backup
cd /home/kusanagi/[アップデートしたいプロファイル]/DocumentRoot
zip -R backup.zip ./*
wp core update
wp plugin update --all
wp theme update --all
wp core language update
kusanagi update plugin
kusanagi update
kusanagi update cert
kusanagi ssl --autl on

yum install yum-cron.noarch
vim /etc/yum/yum-cron.conf
#apply_updates = yes
#update_cmd = security

systemctl start yum-cron
systemctl enable yum-cron
