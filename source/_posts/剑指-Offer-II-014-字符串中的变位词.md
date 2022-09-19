---
title: 剑指 Offer II 014. 字符串中的变位词
date: 2022-09-11 16:32:01
tags:
 - 哈希表
 - 双指针
 - 字符串
 - 滑动窗口
categories: 剑指 Offer II
sticky: 14
---

# [剑指 Offer II 014\. 字符串中的变位词](https://leetcode.cn/problems/MPnaiL/)

## Description

Difficulty: **中等**  

Related Topics: [哈希表](https://leetcode.cn/tag/hash-table/), [双指针](https://leetcode.cn/tag/two-pointers/), [字符串](https://leetcode.cn/tag/string/), [滑动窗口](https://leetcode.cn/tag/sliding-window/)


给定两个字符串 `s1` 和 `s2`，写一个函数来判断 `s2` 是否包含 `s1`的某个变位词。

换句话说，第一个字符串的排列之一是第二个字符串的 **子串** 。

**示例 1：**

```
输入: s1 = "ab" s2 = "eidbaooo"
输出: True
解释: s2 包含 s1 的排列之一 ("ba").
```

**示例 2：**

```
输入: s1= "ab" s2 = "eidboaoo"
输出: False
```

**提示：**

*   1 <= s1.length, s2.length <= 10<sup>4</sup>
*   `s1` 和 `s2` 仅包含小写字母

注意：本题与主站 567 题相同： [https://leetcode-cn.com/problems/permutation-in-string/](https://leetcode-cn.com/problems/permutation-in-string/)


## Solution

Language: **C++**

```c++
class Solution {
public:
    int tar[26];
    int src[26];
    bool isEqual() {
        for (int i = 0;i < 26;i++) {
            if(tar[i] != src[i]) {
                return false;
            }
        }
        return true;
    }

    bool checkInclusion(string s1, string s2) {
        if (s1.length() > s2.length()) {
            return false;
        }
        for (int i = 0;i < s1.length();i++) {
            src[s1[i] - 'a']++;
            tar[s2[i] - 'a']++;
        }
        int start = 0;
        int end = s1.length();
        while (end < s2.length()) {
            if (isEqual()) {
                return true;
            }
            tar[s2[start++] - 'a']--;
            tar[s2[end++] - 'a']++;
        }
        if (isEqual()) {
            return true;
        }
        return false;
```