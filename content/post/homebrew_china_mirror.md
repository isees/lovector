+++
title = "Homebrew 国内镜像切换"
date = "2019-12-16T11:13:10+08:00"
draft = false
tags = ["mac"]
topics = []
description = ""
+++

注:该镜像是 Homebrew 的 formula 索引的镜像（即 brew update 时所更新内容）。本镜像站同时提供 Homebrew 二进制预编译包的镜像，请参考 Homebrew bottles 镜像使用帮助。

## 替换现有上游

```
git -C "$(brew --repo)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git

git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git

git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git

brew update
```

## 复原

```
git -C "$(brew --repo)" remote set-url origin https://github.com/Homebrew/brew.git

git -C "$(brew --repo homebrew/core)" remote set-url origin https://github.com/Homebrew/homebrew-core.git

git -C "$(brew --repo homebrew/cask)" remote set-url origin https://github.com/Homebrew/homebrew-cask.git

brew update
```

## References
* [Homebrew 镜像使用帮助](https://mirror.tuna.tsinghua.edu.cn/help/homebrew/)
