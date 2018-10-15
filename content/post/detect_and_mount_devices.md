+++
title = "Detect and mount devices"
date = "2018-10-16T00:12:53+08:00"
draft = false
tags = ['linux','mount']
topics = []
description = ""
+++

#### 1. Check the blockdevices and the file systems that are assigned to those block devices. 

```bash
sudo lshw
```

#### 2. What kind of device?

```bash
sudo lshw|less
```

#### 3. Mounting the USB-stick 

```bash
sudo mkdir /media/usbstick

sudo mount  /dev/sdf2 /media/usbstick 
```

#### 4. Did it work?

```bash
lsblk
```
