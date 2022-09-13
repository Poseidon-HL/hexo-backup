---
title: 剑指 Offer II 085. 生成匹配的括号
date: 2022-09-13 15:04:58
tags:
 - 字符串
 - 动态规划
 - 回溯
categories: 剑指 Offer II

---

# [剑指 Offer II 085\. 生成匹配的括号](https://leetcode.cn/problems/IDBivT/)

## Description

Difficulty: **中等**  

Related Topics: [字符串](https://leetcode.cn/tag/string/), [动态规划](https://leetcode.cn/tag/dynamic-programming/), [回溯](https://leetcode.cn/tag/backtracking/)


正整数 `n` 代表生成括号的对数，请设计一个函数，用于能够生成所有可能的并且 **有效的** 括号组合。

**示例 1：**

```
输入：n = 3
输出：["((()))","(()())","(())()","()(())","()()()"]
```

**示例 2：**

```
输入：n = 1
输出：["()"]
```

**提示：**

*   `1 <= n <= 8`

注意：本题与主站 22 题相同： [https://leetcode-cn.com/problems/generate-parentheses/](https://leetcode-cn.com/problems/generate-parentheses/)


## Solution

Language: **C++**

```c++
class Solution {
public:
    vector<string> res;
    int N;
    void DFS(int left, int right, string now) {
        if (left < 0) {
            return;
        }
        if (now.length() == N) {
            res.push_back(now);
            return;
        }
        if (left < right) {
            DFS(left,right - 1, now + ")");
        }
        DFS(left - 1, right, now + "(");
    }
    vector<string> generateParenthesis(int n) {
        N = n * 2;
        DFS(n,n,"");
        return res;
    }
};
```