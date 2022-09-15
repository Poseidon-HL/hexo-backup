---
title: Linux passwd 命令
date: 2022-09-15 21:47:29
tags:
---

passwd用于改变用户密码

```
 - Change the password of the current user interactively:
   passwd

 - Change the password of a specific user:
   passwd {{username}}

 - Get the current status of the user:
   passwd -S

 - Make the password of the account blank (it will set the named account passwordless):
   passwd -d
```