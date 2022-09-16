---
title: Linux chown 命令
date: 2022-09-16 14:17:55
tags: 
 - Linux
categories:
 - Linux 命令
---

Linux chown 命令用于修改文件或目录的用户与用户组

```
 - Change the owner user of a file/directory:
   chown {{user}} {{path/to/file_or_directory}}

 - Change the owner user and group of a file/directory:
   chown {{user}}:{{group}} {{path/to/file_or_directory}}

 - Recursively change the owner of a directory and its contents:
   chown -R {{user}} {{path/to/directory}}

 - Change the owner of a symbolic link:
   chown -h {{user}} {{path/to/symlink}}

 - Change the owner of a file/directory to match a reference file:
   chown --reference={{path/to/reference_file}} {{path/to/file_or_directory}}

```