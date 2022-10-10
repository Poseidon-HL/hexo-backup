---
title: LeetCode 2131. 连接两字母单词得到的最长回文串
date: 2022-10-07 16:02:16
tags:
 - 贪心
 - 数组
 - 哈希表
 - 字符串
 - 计数
categories: LeetCode
---

# [2131\. 连接两字母单词得到的最长回文串](https://leetcode.cn/problems/longest-palindrome-by-concatenating-two-letter-words/)

## Description

Difficulty: **中等**  

Related Topics: [贪心](https://leetcode.cn/tag/greedy/), [数组](https://leetcode.cn/tag/array/), [哈希表](https://leetcode.cn/tag/hash-table/), [字符串](https://leetcode.cn/tag/string/), [计数](https://leetcode.cn/tag/counting/)


给你一个字符串数组 `words` 。`words` 中每个元素都是一个包含 **两个** 小写英文字母的单词。

请你从 `words` 中选择一些元素并按 **任意顺序** 连接它们，并得到一个 **尽可能长的回文串** 。每个元素 **至多** 只能使用一次。

请你返回你能得到的最长回文串的 **长度** 。如果没办法得到任何一个回文串，请你返回 `0` 。

**回文串** 指的是从前往后和从后往前读一样的字符串。

**示例 1：**

```
输入：words = ["lc","cl","gg"]
输出：6
解释：一个最长的回文串为 "lc" + "gg" + "cl" = "lcggcl" ，长度为 6 。
"clgglc" 是另一个可以得到的最长回文串。
```

**示例 2：**

```
输入：words = ["ab","ty","yt","lc","cl","ab"]
输出：8
解释：最长回文串是 "ty" + "lc" + "cl" + "yt" = "tylcclyt" ，长度为 8 。
"lcyttycl" 是另一个可以得到的最长回文串。
```

**示例 3：**

```
输入：words = ["cc","ll","xx"]
输出：2
解释：最长回文串是 "cc" ，长度为 2 。
"ll" 是另一个可以得到的最长回文串。"xx" 也是。
```

**提示：**

*   1 <= words.length <= 10<sup>5</sup>
*   `words[i].length == 2`
*   `words[i]` 仅包含小写英文字母。


## Solution

Language: **C++**

```c++
class Solution {
public:
    map<string, int> findSet;
    int res = 0, isSame = 0;
    int longestPalindrome(vector<string>& words) {
        for (string s : words) {
            string reverseS = s;
            reverse(reverseS.begin(), reverseS.end());
            if (findSet.find(reverseS) != findSet.end()) {
                if (findSet[reverseS] > 0) {
                    findSet[reverseS]--;
                    res += 4;
                    isSame -= reverseS == s ? 1 : 0;
                } else {
                    isSame += reverseS == s ? 1 : 0;
                    findSet[s] += 1;    
                }
            } else {
                isSame += reverseS == s ? 1 : 0;
                findSet[s] += 1;
            }
        }
        res += isSame > 0 ? 2 : 0;
        return res;
    }
};
```