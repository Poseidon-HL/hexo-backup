---
title: LeetCode 921. 使括号有效的最少添加
date: 2022-10-04 19:18:39
tags:
 - 栈
 - 贪心
 - 字符串
categories: LeetCode
---

# [921\. 使括号有效的最少添加](https://leetcode.cn/problems/minimum-add-to-make-parentheses-valid/)

## Description

Difficulty: **中等**  

Related Topics: [栈](https://leetcode.cn/tag/stack/), [贪心](https://leetcode.cn/tag/greedy/), [字符串](https://leetcode.cn/tag/string/)


只有满足下面几点之一，括号字符串才是有效的：

*   它是一个空字符串，或者
*   它可以被写成 `AB` （`A` 与 `B` 连接）, 其中 `A` 和 `B` 都是有效字符串，或者
*   它可以被写作 `(A)`，其中 `A` 是有效字符串。

给定一个括号字符串 `s` ，移动N次，你就可以在字符串的任何位置插入一个括号。

*   例如，如果 `s = "()))"` ，你可以插入一个开始括号为 `"(()))"` 或结束括号为 `"())))"` 。

返回 _为使结果字符串 `s` 有效而必须添加的最少括号数_。

**示例 1：**

```
输入：s = "())"
输出：1
```

**示例 2：**

```
输入：s = "((("
输出：3
```

**提示：**

*   `1 <= s.length <= 1000`
*   `s` 只包含 `'('` 和 `')'` 字符。


## Solution

Language: **C++**

```c++
class Solution {
public:
    int minAddToMakeValid(string s) {
        stack<char> tmp;
        for (char c : s) {
            if (!tmp.size()) {
                tmp.push(c);
            } else {
                if (c == ')' && tmp.top() == '(') {
                    tmp.pop();
                } else {
                    tmp.push(c);
                }
            }
        }
        return tmp.size();
    }
};
```