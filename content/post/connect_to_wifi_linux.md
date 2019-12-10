+++
title = "Connect to WiFi network through terminal"
date = "2018-10-23T11:25:01+08:00"
draft = false
tags = ["linux","wifi"]
topics = []
description = ""
+++

## 0. check network interface card status

```
ip addr
ip link
ip -s link
```

## 1. ip for all network interfaces, including setting up and down:

```
ip link set wlan0 up
ip link set wlan0 down
ip help
ip link help
ip addr help
```

## 2. iw for wireless extensions (needs to be called as root):

```
iw dev
iw phy
iw wlan0 scan
iw wlan0 station dump
iw help
```

## 3. Reload WIFI

The -r flag explicitly releases the current lease, and once the lease has been released, the client exits. Open a terminal and type the command:

```
$ sudo dhclient -r
```

Now obtain fresh IP:

```
$ sudo dhclient 
```

