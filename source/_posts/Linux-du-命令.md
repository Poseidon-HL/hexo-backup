---
title: Linux du 命令
date: 2022-09-09 11:34:35
tags: 
 - Linux
categories:
 - Linux 命令
---

Linux du 命令用于查看目录或文件的大小

```
 - 展示目录或子目录的大小 B/Kib/MiB:
   du -{{b|k|m}} {{path/to/directory}}

 - 展示目录或文件的大小 -h便于阅读:
   du -h {{path/to/directory}}

 - Show the size of a single directory, in human-readable units:
   du -sh {{path/to/directory}}

 - List the human-readable sizes of a directory and of all the files and directories within it:
   du -ah {{path/to/directory}}

 - List the human-readable sizes of a directory and any subdirectories, up to N levels deep:
   du -h --max-depth=N {{path/to/directory}}

 - List the human-readable size of all .jpg files in subdirectories of the current directory, and show a cumulative total at the end:
   du -ch {{*/*.jpg}}

```