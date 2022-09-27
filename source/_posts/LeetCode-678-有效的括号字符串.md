---
title: LeetCode 678. 有效的括号字符串
date: 2022-09-27 14:45:19
tags:
 - 栈
 - 贪心
 - 字符串
 - 动态规划
categories: LeetCode
---

# [678\. 有效的括号字符串](https://leetcode.cn/problems/valid-parenthesis-string/)

## Description

Difficulty: **中等**  

Related Topics: [栈](https://leetcode.cn/tag/stack/), [贪心](https://leetcode.cn/tag/greedy/), [字符串](https://leetcode.cn/tag/string/), [动态规划](https://leetcode.cn/tag/dynamic-programming/)


给定一个只包含三种字符的字符串：`（ `，`）` 和 `*`，写一个函数来检验这个字符串是否为有效字符串。有效字符串具有如下规则：

1.  任何左括号 `(` 必须有相应的右括号 `)`。
2.  任何右括号 `)` 必须有相应的左括号 `(` 。
3.  左括号 `(` 必须在对应的右括号之前 `)`。
4.  `*` 可以被视为单个右括号 `)` ，或单个左括号 `(` ，或一个空字符串。
5.  一个空字符串也被视为有效字符串。

**示例 1:**

```
输入: "()"
输出: True
```

**示例 2:**

```
输入: "(*)"
输出: True
```

**示例 3:**

```
输入: "(*))"
输出: True
```

**注意:**

1.  字符串大小将在 [1，100] 范围内。


## Solution

Language: **C++**

```c++
class Solution {
public:
    bool checkValidString(string s) {
        int countLeft = 0, countRight = 0, countStar = 0, count = 0;
        int countLeft_ = 0, countRight_ = 0, countStar_ = 0;
        for (int i = 0;i < s.length(); i++) {
            if (s[i] == '(') {
                countLeft++;
            } else if (s[i] == ')') {
                countRight++;
            } else {
                countStar++;
            }
            if (s[s.length() - 1 - i] == '(') {
                countLeft_++;
            } else if (s[s.length() - 1 - i] == ')') {
                countRight_++;
            } else {
                countStar_++;
            }
            if (countRight > countLeft + countStar) {
                return false;
            }
            if (countLeft_ > countRight_ + countStar_) {
                return false;
            }
        }
        return true;
    }
};
```