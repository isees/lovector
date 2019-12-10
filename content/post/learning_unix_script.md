+++
title = "UNIX脚本入门"
date = "2018-05-06T20:28:00+08:00"
draft = false
tags = ['unix', 'bash', 'script']
topics = []
description = "Learning UNIX Script"
+++

学习一门新的语言可以先从基本逻辑语法下手, 如 `if`, `else`, `for`, `while`, `switch`.

可以从以下示例代码中了解基本语法结构:

```bash
#!/bin/bash
echo 'Hi there :)'

for file in *
do 
  if [ -f "$file" ]
  then
    echo "FILE $file" 
  else
    echo "DIR $file"
  fi
done

while [ "loop" ]
do
  printf "#> "
  read num
  case $num in 
    q) break ;;
    1) echo 'Beautiful day huh:)' ;;
    2) echo 'Good luck my friend' ;;
    3) echo 'Nice try my friend' ;;
    *) echo 'The choice is not offering' ;;
  esac
done

```

可以看出类似于于 `if` 和 `while` 的循环结构, 内部逻辑都用 `do ... done` 包裹, 而 `if` 的第一层逻辑, 则需要增加 `then`
来执行. 
