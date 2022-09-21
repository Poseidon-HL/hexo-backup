---
title: LeetCode 784. 字母大小写全排列
date: 2022-09-22 00:09:20
tags:
 - 位运算
 - 字符串
 - 回溯
categories: LeetCode
---

# [784\. 字母大小写全排列](https://leetcode.cn/problems/letter-case-permutation/)

## Description

Difficulty: **中等**  

Related Topics: [位运算](https://leetcode.cn/tag/bit-manipulation/), [字符串](https://leetcode.cn/tag/string/), [回溯](https://leetcode.cn/tag/backtracking/)


给定一个字符串 `s` ，通过将字符串 `s` 中的每个字母转变大小写，我们可以获得一个新的字符串。

返回 _所有可能得到的字符串集合_ 。以 **任意顺序** 返回输出。

**示例 1：**

```
输入：s = "a1b2"
输出：["a1b2", "a1B2", "A1b2", "A1B2"]
```

**示例 2:**

```
输入: s = "3z4"
输出: ["3z4","3Z4"]
```

**提示:**

*   `1 <= s.length <= 12`
*   `s` 由小写英文字母、大写英文字母和数字组成


## Solution

Language: **C++**

```c++
class Solution {
public:
    char reverse(char c) {
        if (c >= 'a' && c <= 'z') {
            return char(c + 'A' - 'a');
        }
        return char(c + 'a' - 'A');
    }
    vector<string> result;
    string S;
    void DFS(string now, int index) {
        if (index == S.length()) {
            result.push_back(now);
            return ;
        }
        if (S[index] >= '0' && S[index] <= '9') {
            DFS(now + S[index], index + 1);
        } else {
            DFS(now + S[index], index + 1);
            DFS(now + reverse(S[index]), index + 1);
        }
    }
    vector<string> letterCasePermutation(string s) {
        S = s;
        DFS("",0);
        return result;
    }
};
```