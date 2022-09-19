---
title: Linux find 命令
date: 2022-09-11 13:42:16
tags: 
 - Linux
categories:
 - Linux 命令
---

Linux find 命令用于查找文件或目录

```
 - 通过表达式查找文件:
   find {{root_path}} -name '{{*.ext}}'

 - 通过路径或文件名查找文件:
   find {{root_path}} -path '{{**/path/**/*.ext}}' -or -name '{{*pattern*}}'

 - Find directories matching a given name, in case-insensitive mode:
   find {{root_path}} -type d -iname '{{*lib*}}'

 - Find files matching a given pattern, excluding specific paths:
   find {{root_path}} -name '{{*.py}}' -not -path '{{*/site-packages/*}}'

 - Find files matching a given size range:
   find {{root_path}} -size {{+500k}} -size {{-10M}}

 - Run a command for each file (use {} within the command to access the filename):
   find {{root_path}} -name '{{*.ext}}' -exec {{wc -l {} }}\;

 - Find files modified in the last 7 days and delete them:
   find {{root_path}} -daystart -mtime -{{7}} -delete

 - Find empty (0 byte) files and delete them:
   find {{root_path}} -type {{f}} -empty -delete
```