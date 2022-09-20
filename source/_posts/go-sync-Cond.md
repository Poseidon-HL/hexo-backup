---
title: go sync.Cond
date: 2022-09-18 17:06:01
tags: 
 - go
categories: go sync
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

#### NewCond 创建新的Cond实例
```go
func NewCond(l Locker) *Cond {
	return &Cond{L: l}
}
```
- 创建Cond实例，传入需要关联的锁

#### checker.check 检查是否发生拷贝
```go
type copyChecker uintptr

func (c *copyChecker) check() {
	if uintptr(*c) != uintptr(unsafe.Pointer(c)) &&
		!atomic.CompareAndSwapUintptr((*uintptr)(c), 0, uintptr(unsafe.Pointer(c))) &&
		uintptr(*c) != uintptr(unsafe.Pointer(c)) {
		panic("sync.Cond is copied")
	}
}
```
- copyChecker.check 在Wait Signal Broadcast方法中均会被调用，用于检查是否发生了值拷贝
- 第一次执行检查会完成该变量的赋值
- 此后若发生了拷贝，则panic

#### Wait 等待
```go
func (c *Cond) Wait() {
	c.checker.check()
	t := runtime_notifyListAdd(&c.notify)
	c.L.Unlock()
	runtime_notifyListWait(&c.notify, t)
	c.L.Lock()
}
```
- Wait会自动释放锁，并挂起调用Wait的协程

#### Signal 唤醒单个协程

#### Broadcast 唤醒所有等待协程

### 举例
```go

```