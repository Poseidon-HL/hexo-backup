---
title: LeetCode 779. 第K个语法符号
date: 2022-10-20 16:31:41
tags:
 - 位运算
 - 递归
 - 数学
categories: LeetCode
---

# [779\. 第K个语法符号](https://leetcode.cn/problems/k-th-symbol-in-grammar/)

## Description

Difficulty: **中等**  

Related Topics: [位运算](https://leetcode.cn/tag/bit-manipulation/), [递归](https://leetcode.cn/tag/recursion/), [数学](https://leetcode.cn/tag/math/)


我们构建了一个包含 `n` 行( **索引从 1  开始 **)的表。首先在第一行我们写上一个 `0`。接下来的每一行，将前一行中的`0`替换为`01`，`1`替换为`10`。

*   例如，对于 `n = 3` ，第 `1` 行是 `0` ，第 `2` 行是 `01` ，第3行是 `0110` 。

给定行数 `n` 和序数 `k`，返回第 `n` 行中第 `k` 个字符。（ `k` **从索引 1 开始**）

**示例 1:**

```
输入: n = 1, k = 1
输出: 0
解释: 第一行：0
```

**示例 2:**

```
输入: n = 2, k = 1
输出: 0
解释: 
第一行: 0 
第二行: 01
```

**示例 3:**

```
输入: n = 2, k = 2
输出: 1
解释:
第一行: 0
第二行: 01
```

**提示:**

*   `1 <= n <= 30`
*   1 <= k <= 2<sup>n - 1</sup>


## Solution

Language: **C++**

```c++
class Solution {
public:
    void show(int n) {
        string now = "0";
        while (n) {
            string newS = "";
            for (char c : now) {
                if (c == '0') {
                    newS += "01";
                } else {
                    newS += "10";
                }
            }
            now = newS;
            cout << now << endl;
            n--;
        }
    }

    int kthGrammar(int n, int k) {
        k--;
        n--;
        int cnt = 0;
        // show(n);
        while (n) {
            // cout << "n: " << n << endl;
            if (k >= pow(2, n) / 2) {
                k -= pow(2, n) / 2;
                cnt++;
            }
            n--;
        }
        
        return cnt % 2 == 0 ? 0 : 1;
    }
};
```