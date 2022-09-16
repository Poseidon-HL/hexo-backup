---
title: Linux chgrp 命令
date: 2022-09-16 14:18:22
tags: 
 - Linux
categories:
 - Linux 命令
---

Linux chgrp 命令用于修改文件或目录的用户组

```
 - Change the owner group of a file/directory:
   chgrp {{group}} {{path/to/file_or_directory}}

 - Recursively change the owner group of a directory and its contents:
   chgrp -R {{group}} {{path/to/directory}}

 - Change the owner group of a symbolic link:
   chgrp -h {{group}} {{path/to/symlink}}

 - Change the owner group of a file/directory to match a reference file:
   chgrp --reference={{path/to/reference_file}} {{path/to/file_or_directory}}

```