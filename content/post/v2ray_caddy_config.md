+++
title = "V2ray & Caddy Configuration"
date = 2020-05-07T20:24:00+08:00
draft = true
tags = ["zfs", "raid", "ubuntu"]
topics = []
description = ""
+++

## Install V2ray

```
bash <(curl -L -s https://install.direct/go.sh)
```


## Config V2ray

vim /etc/v2ray/config.json

```
{
    "log": {
        "access": "/var/log/v2ray/access.log",
        "error": "/var/log/v2ray/error.log",
        "loglevel": "warning"
        //"loglevel": "none"
    },
    "inbound": {
        "port": 8280,
        "protocol": "vmess",
        "settings": {
            "clients": [
                {
                    "id": "43d5f8e2-994f-f347-c08f-1284d5896801",
                    "level": 1,
                    "alterId": 64
                }
            ]
        },
        "streamSettings": {
            "network": "ws",
            "wsSettings": {
                "path":"/status"
            }
        },
        "detour": {
            "to": "vmess-detour-471335"
        }
    },
    "outbound": {
        "protocol": "freedom",
        "settings": {}
    }
}
```

To start v2ray:
```
service v2ray restart
```

## Install Caddy

```
curl https://getcaddy.com | bash -s personal        //安装getcaddy
which caddy                                         //查看安装位置
caddy -version                                      //查看版本
```

## Config Caddy 
create a file named "Caddyfile" in /etc/caddy/
```
 us.lovector.me
 {
         root /var/www/
         tls thinkxer@gmail.com
         log /var/log/caddy/caddy.log
         proxy /status localhost:8280 {
                 websocket
                 header_upstream -Origin
         }
 }
```

## Install Caddy service

```
vim /etc/systemd/system/caddy.service
```

```
# caddy.service
#
# For using Caddy with a config file.
#
# Make sure the ExecStart and ExecReload commands are correct
# for your installation.
#
# See https://caddyserver.com/docs/install for instructions.
#
# WARNING: This service does not use the --resume flag, so if you
# use the API to make changes, they will be overwritten by the
# Caddyfile next time the service is restarted. If you intend to
# use Caddy's API to configure it, add the --resume flag to the
# `caddy run` command or use the caddy-api.service file instead.

[Unit]
Description=Caddy
Documentation=https://caddyserver.com/docs/
After=network.target

[Service]
User=www-data
Group=www-data
ExecStart=/usr/local/bin/caddy -log stdout -log-timestamps=false -agree=true -conf=/etc/caddy/Caddyfile -root=/var/tmp
ExecReload=/bin/kill -USR1 $MAINPID
TimeoutStopSec=5s
LimitNOFILE=1048576
LimitNPROC=512
PrivateTmp=true
ProtectSystem=full
AmbientCapabilities=CAP_NET_BIND_SERVICE

[Install]
WantedBy=multi-user.target
```

```
systemctl daemon-reload
```
