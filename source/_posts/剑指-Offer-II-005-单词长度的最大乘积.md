---
title: 剑指 Offer II 005. 单词长度的最大乘积
date: 2022-09-20 19:46:41
tags:
 - 位运算
 - 数组
 - 字符串
categories: 剑指 Offer II
---

# [剑指 Offer II 005\. 单词长度的最大乘积](https://leetcode.cn/problems/aseY1I/)

## Description

Difficulty: **中等**  

Related Topics: [位运算](https://leetcode.cn/tag/bit-manipulation/), [数组](https://leetcode.cn/tag/array/), [字符串](https://leetcode.cn/tag/string/)


给定一个字符串数组 `words`，请计算当两个字符串 `words[i]` 和 `words[j]` 不包含相同字符时，它们长度的乘积的最大值。假设字符串中只包含英语的小写字母。如果没有不包含相同字符的一对字符串，返回 0。

**示例 1:**

```
输入: words = ["abcw","baz","foo","bar","fxyz","abcdef"]
输出: 16 
解释: 这两个单词为 "abcw", "fxyz"。它们不包含相同字符，且长度的乘积最大。
```

**示例 2:**

```
输入: words = ["a","ab","abc","d","cd","bcd","abcd"]
输出: 4 
解释: 这两个单词为 "ab", "cd"。
```

**示例 3:**

```
输入: words = ["a","aa","aaa","aaaa"]
输出: 0 
解释: 不存在这样的两个单词。
```

**提示：**

*   `2 <= words.length <= 1000`
*   `1 <= words[i].length <= 1000`
*   `words[i]` 仅包含小写字母

注意：本题与主站 318 题相同：[https://leetcode-cn.com/problems/maximum-product-of-word-lengths/](https://leetcode-cn.com/problems/maximum-product-of-word-lengths/)


## Solution

Language: **C++**

```c++
class Solution {
public:
    int getBit(string word) {
        int bitMap = 0;
        for (char c : word) {
            bitMap = bitMap | (1 << (c - 'a'));
        }
        return bitMap;
    }

    int maxProduct(vector<string>& words) {
        vector<int> wordsbit;
        for (string word : words) {
            wordsbit.push_back(getBit(word));
        }
        int maxNum = 0;
        for (int i = 0;i < wordsbit.size(); i++) {
            for (int j = i + 1;j < wordsbit.size(); j++) {
                if (((wordsbit[i] ^ wordsbit[j]) == (wordsbit[i] | wordsbit[j]))) {
                    maxNum = max(maxNum, int(words[i].length() * words[j].length()));
                }
            }
        }
        return maxNum;
    } 
};
```
