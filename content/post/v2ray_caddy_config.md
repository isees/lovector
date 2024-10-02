+++
title = "V2ray & Caddy Configuration"
date = 2020-05-07T20:24:00+08:00
draft = false
tags = ["v2ray", "caddy", "ubuntu"]
topics = []
description = ""
+++

## #01 V2ray
---

### Install V2ray

```
bash <(curl -L -s https://install.direct/go.sh)
```


### Config V2ray

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
                    "id": "43d486e2-9xxf-f347-c08f-1284d3676844",
                    "level": 1,
                    "alterId": 64
                }
            ]
        },
        "streamSettings": {
            "network": "ws",
            "wsSettings": {
                "path":"/path"
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

### Start v2ray
```bash
$ systemctl start v2ray
$ systemctl status v2ray
```


## #02 Caddy
---

### Install Caddy

```
curl https://getcaddy.com | bash -s personal        //安装getcaddy
which caddy                                         //查看安装位置
caddy -version                                      //查看版本
```

### Config Caddy 
create a file named "Caddyfile" in /etc/caddy/
```
xxx.xxx.com
 {
         root /var/www/
         tls name@xxx.com
         log /var/log/caddy/caddy.log
         proxy /path localhost:8280 {
                 websocket
                 header_upstream -Origin
         }
 }
```

### Install Caddy service

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

### Reload & Run
```bash
$ systemctl daemon-reload
$ systemctl start caddy
$ systemctl status caddy
```

## #03 Enable BBR

Input *uname -r* to see whether the core version is not less than 4.9

Run *lsmod | grep bbr*, if there's no *tcp_bbr* then run:
```
sudo modprobe tcp_bbr
echo "tcp_bbr" | sudo tee --append /etc/modules-load.d/modules.conf
```

Run
```
echo "net.core.default_qdisc=fq" | sudo tee --append /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" | sudo tee --append /etc/sysctl.conf
```

Save config
```
sudo sysctl -p
```

Run
```
sysctl net.ipv4.tcp_available_congestion_control
sysctl net.ipv4.tcp_congestion_control
```

Run *lsmod | grep bbr*, if you see *tcp_bbr* then it means BBR is startup. 

## #04 References

* [开启 TCP BBR 拥塞控制算法](https://github.com/iMeiji/shadowsocks_install/wiki/%E5%BC%80%E5%90%AF-TCP-BBR-%E6%8B%A5%E5%A1%9E%E6%8E%A7%E5%88%B6%E7%AE%97%E6%B3%95)
