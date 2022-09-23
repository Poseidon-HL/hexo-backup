---
title: 剑指 Offer II 072. 求平方根
date: 2022-09-23 16:15:41
tags:
 - 数学
 - 二分查找
categories: 剑指 Offer II
---

# [剑指 Offer II 072\. 求平方根](https://leetcode.cn/problems/jJ0w9p/)

## Description

Difficulty: **简单**  

Related Topics: [数学](https://leetcode.cn/tag/math/), [二分查找](https://leetcode.cn/tag/binary-search/)


给定一个非负整数 `x` ，计算并返回 `x` 的平方根，即实现 `int sqrt(int x)` 函数。

正数的平方根有两个，只输出其中的正数平方根。

如果平方根不是整数，输出只保留整数的部分，小数部分将被舍去。

**示例 1:**

```
输入: x = 4
输出: 2
```

**示例 2:**

```
输入: x = 8
输出: 2
解释: 8 的平方根是 2.82842...，由于小数部分将被舍去，所以返回 2
```

**提示:**

*   0 <= x <= 2<sup>31</sup> - 1

注意：本题与主站 69 题相同： [https://leetcode-cn.com/problems/sqrtx/](https://leetcode-cn.com/problems/sqrtx/)


## Solution

Language: **C++**

```c++
class Solution {
public:
    int mySqrt(int x) {
        long long begin = 0, end = x, mid = 0;
        while (begin <= end) {
            mid = begin + (end - begin) / 2;
            if (mid * mid <= x) {
                ans = mid;
                begin = mid + 1;
            } else {
                end = mid - 1;
            }
        }
        return ans;
    }

};
```
