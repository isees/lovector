---
title: "Linux进程与端口相互查询"
date: 2019-11-05T04:11:50+08:00
subtitle: ""
tags: ['linux','进程', '端口', 'mac']
---

## 通过进程查询端口

#### 查询获取进程PID

```bash
$ ps aux|grep aria2c
isees      2704  1.4  0.1 100772 12912 ?        Rs   03:36   0:39 aria2c -D
isees      3132  0.0  0.0  15964   972 pts/0    S+   04:20   0:00 grep --color=auto aria2c
```

#### 通过进程PID查询获取占用端口

```bash
$ sudo netstat -nap|grep 2704
tcp        0      0 0.0.0.0:6881            0.0.0.0:*               LISTEN      2704/aria2c     
tcp        0      0 0.0.0.0:6800            0.0.0.0:*               LISTEN      2704/aria2c     
tcp        0      0 192.168.100.9:58710     221.196.63.64:16881     ESTABLISHED 2704/aria2c     
tcp        0      1 192.168.100.9:35126     192.168.1.13:14596      SYN_SENT    2704/aria2c     
tcp        1      0 192.168.100.9:52874     51.15.3.74:6969         CLOSE_WAIT  2704/aria2c     
tcp        0      0 192.168.100.9:49006     36.224.209.80:51413     ESTABLISHED 2704/aria2c     
tcp        0     68 192.168.100.9:54336     197.27.109.133:14595    ESTABLISHED 2704/aria2c     
tcp6       0      0 :::6881                 :::*                    LISTEN      2704/aria2c     
tcp6       0      0 :::6800                 :::*                    LISTEN      2704/aria2c     
udp        0      0 0.0.0.0:6881            0.0.0.0:*
```

## 通过端口查询进程 

0. You can normally do

```bash
$ sudo netstat -nap|grep 58710
tcp        0      0 192.168.100.9:58710     221.196.63.64:16881     ESTABLISHED 2704/aria2c
```

1. You can try netstat

```bash
netstat -vanp tcp | grep 3000
```

2. For macOS El Capitan and newer (or if your netstat doesn't support -p), use lsof

```bash
sudo lsof -i tcp:3000
```

3. For Centos 7 use

```bash
netstat -vanp --tcp | grep 3000
```

