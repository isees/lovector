+++
title = "Connecting to server via ssh"
date = "2019-07-10T21:20:45+08:00"
draft = false
tags = ['ssh','linux','mac']
topics = []
description = ""
+++

## 1. Generate a Key Pair

```bash
$ ssh-keygen -t rsa -b 4096
```

## 2. Upload your Public Key

```bash
$ ssh-copy-id -i KEYNAME USERNAME@IP -p PORT
```

## 3. Connecting to server via ssh

```bash
$ ssh -i KEYNAME -p 'PORT' 'USERNAME@IP'
```

## References

-   <https://www.linode.com/docs/security/authentication/use-public-key-authentication-with-ssh/>
