---
title: "~/.bashrc没有自动生效"
date: 2018-03-22T14:52:16+08:00
subtitle: ""
tags: ['.bashrc', 'x os']
---

大多数系统的`~/.bashrc`只是作用于未激活`非登录`状态的shell.
然而打开一个新的shell时, 它通常是一个未激活`已登录`的状态,
由于`已登录`的原因, `.bashrc`的作用将被忽略. 

为了让系统环境持续在`已登录`和`非登录`的shell之间生效,
需要把`.bashrc`添加到`.profile`或者`.bash_profile`中.

```bash
# 以x os系统为例, 把以下命令添加到~/.bash_profile
. ~/.bashrc
```

这样, 重新打开新的shell时, 就不需要每次通过输入`source ~/.bashrc`激活配置了.

