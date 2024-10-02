+++
title = "如何贡献项目"
date = 2018-02-28T15:50:07+08:00
tags = ["github", 'fork']
categories = ["doc"]
draft = false
+++

在[GitHub](https://github.com/)上`fork`到自己的仓库, 如 [isees/scrapy](https://github.com/isees/scrapy) , 然后`clone`到本地, 
并设置用户信息. 
```bash
$ git clone git@github.com:isees/scrapy.git
$ cd scrapy
```

领取或创建新的[Issue](https://github.com/scrapy/scrapy/issues), 如[issue 3146](https://github.com/scrapy/scrapy/issues/3146), 添加自己为 `Assignee`. 
修改代码后提交, 并推送到自己的仓库, 注意修改提交消息为对应`Issue`号和描述. 
```bash
# Update the content
$ git commit -a -s
# In commit msg dialog, add content like "Fix issue #3146: updated content"
$ git push
```

在[GitHub](https://github.com/)上提交`Pull Request`, 添加标签, 并邀请维护者进行`Review`. 
定期使用项目仓库内容更新自己仓库内容. 
```bash
$ git remote add upstream https://github.com/isees/scrapy
$ git fetch upstream
$ git rebase upstream/master
$ git push -f origin master
```
