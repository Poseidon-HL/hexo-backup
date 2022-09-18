---
title: go sync.Cond
date: 2022-09-18 17:06:01
tags:
---

### sync.Cond 使用场景
  - 多个goroutine等待，单个goroutine通知

### sync.Cond 定义&方法

```go
type Cond struct {
	noCopy noCopy

	L Locker

	notify  notifyList
	checker copyChecker
}
```
- noCopy通常内嵌在结构体中，避免发生结构体拷贝
- L为关联锁，通常为互斥锁或读写锁（*Mutex or *RWMutex）

#### NewCond创建新的Cond实例

#### checker.check() 检查是否发生拷贝