---
title: LeetCode 2177. 找到和为给定整数的三个连续整数
date: 2022-11-05 19:47:41
tags:
 - 数学
 - 模拟
categories: LeetCode
---

# [2177\. 找到和为给定整数的三个连续整数](https://leetcode.cn/problems/find-three-consecutive-integers-that-sum-to-a-given-number/)

## Description

Difficulty: **中等**  

Related Topics: [数学](https://leetcode.cn/tag/math/), [模拟](https://leetcode.cn/tag/simulation/)


给你一个整数 `num` ，请你返回三个连续的整数，它们的 **和** 为`num` 。如果 `num` 无法被表示成三个连续整数的和，请你返回一个 **空** 数组。

**示例 1：**

```
输入：num = 33
输出：[10,11,12]
解释：33 可以表示为 10 + 11 + 12 = 33 。
10, 11, 12 是 3 个连续整数，所以返回 [10, 11, 12] 。
```

**示例 2：**

```
输入：num = 4
输出：[]
解释：没有办法将 4 表示成 3 个连续整数的和。
```

**提示：**

*   0 <= num <= 10<sup>15</sup>


## Solution

Language: **C++**

```c++
class Solution {
public:
    vector<long long> sumOfThree(long long num) {
        vector<long long> res;
        if (num % 3 == 0) {
            long long mid = num / 3;
            res.push_back(mid - 1);
            res.push_back(mid);
            res.push_back(mid + 1);
        } 
        return res;
    }
};
```