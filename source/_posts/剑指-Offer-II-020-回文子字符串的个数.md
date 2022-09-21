---
title: 剑指 Offer II 020. 回文子字符串的个数
date: 2022-09-21 15:02:15
tags:
 - 字符串
 - 动态规划
categories: 剑指 Offer II
---

# [剑指 Offer II 020\. 回文子字符串的个数](https://leetcode.cn/problems/a7VOhD/)

## Description

Difficulty: **中等**  

Related Topics: [字符串](https://leetcode.cn/tag/string/), [动态规划](https://leetcode.cn/tag/dynamic-programming/)


给定一个字符串 `s` ，请计算这个字符串中有多少个回文子字符串。

具有不同开始位置或结束位置的子串，即使是由相同的字符组成，也会被视作不同的子串。

**示例 1：**

```
输入：s = "abc"
输出：3
解释：三个回文子串: "a", "b", "c"
```

**示例 2：**

```
输入：s = "aaa"
输出：6
解释：6个回文子串: "a", "a", "a", "aa", "aa", "aaa"
```

**提示：**

*   `1 <= s.length <= 1000`
*   `s` 由小写英文字母组成

注意：本题与主站 647 题相同：[https://leetcode-cn.com/problems/palindromic-substrings/](https://leetcode-cn.com/problems/palindromic-substrings/) 


## Solution

Language: **C++**

```c++
class Solution {
public:
    string S;
    vector<vector<int>> isTrue;
    // judge(i,j)表示下表[i-j]的子串是否为回文字符串

    bool judge(int i, int j) {
        if (i > j) {
            return true;
        }
        if (isTrue[i][j] == -1) {
            if ((S[i] == S[j]) && judge(i + 1,j - 1)) {
                isTrue[i][j] = 1;
            } else {
                isTrue[i][j] = -1;
            }
            
        }
        return (isTrue[i][j] == 1);
    }

    int countSubstrings(string s) {
        S = s;
        for (int i = 0;i < s.length();i++) {
            vector<int> tmp;
            for (int j = 0;j < s.length();j++) {
                if (i == j) {
                    tmp.push_back(1);
                } else {
                    tmp.push_back(-1);
                }
            }
            isTrue.push_back(tmp);
        }

        int result = 0;
        for (int i = 0;i < isTrue.size();i++) {
            for (int j = i + 1;j < isTrue[i].size();j++) {
                if (judge(i,j)) {
                    result++;
                }
            }
        }

        return result + S.length();
    }
};
```