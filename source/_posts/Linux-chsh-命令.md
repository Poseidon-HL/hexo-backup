---
title: Linux chsh 命令
date: 2022-09-11 14:31:19
tags:
categories:
 - Linux 命令
---

Linux chsh命令用于更换用户shell

在```/etc/shells```文件中存储了可使用的shell信息，可以在查看后再进行选择修改

```
 - 修改当前用户的shell:
   chsh

 - Change the login shell of the current user:
   chsh -s {{path/to/shell}}

 - Change the login shell for a given user:
   chsh -s {{path/to/shell}} {{username}}

 - List available shells:
   chsh --list-shells
```