---
title: "如何在linux系统启动时执行脚本/命令?"
date: 2018-04-01T19:19:23+08:00
subtitle: ""
tags: [centos, ubuntu, linux]
---

## 登录终端时运行
如果需要在终端登录时自动运行脚本, 可以在`~/.bash_login`文件中添加命令.

## Ubuntu 14.04或后续版本

将以下命令保存到`xxx.conf`文件中.
```bash
start on startup
task
exec /path/to/command 
```

### 系统启动时以root身份执行
将`xxx.conf`保存到`/etc/init/`目录下.

### 以当前用户在登录时执行
将`xxx.conf`保存到`~/.config/upstart/`目录下.

## Centos / Ubuntu

直接编辑`/etc/rc.local`并添加命令/脚本.

例:
```
echo "/etc/init.d/activate.sh" >> /etc/rc.local
```
