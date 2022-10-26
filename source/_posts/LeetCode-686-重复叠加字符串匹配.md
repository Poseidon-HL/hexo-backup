---
title: LeetCode 686. 重复叠加字符串匹配
date: 2022-10-26 19:48:45
tags:
 - 字符串
 - 字符串匹配
categories: LeetCode
---

# [686\. 重复叠加字符串匹配](https://leetcode.cn/problems/repeated-string-match/)

## Description

Difficulty: **中等**  

Related Topics: [字符串](https://leetcode.cn/tag/string/), [字符串匹配](https://leetcode.cn/tag/string-matching/)


给定两个字符串 `a` 和 `b`，寻找重复叠加字符串 `a` 的最小次数，使得字符串 `b` 成为叠加后的字符串 `a` 的子串，如果不存在则返回 `-1`。

**注意：**字符串 `"abc"` 重复叠加 0 次是 `""`，重复叠加 1 次是 `"abc"`，重复叠加 2 次是 `"abcabc"`。

**示例 1：**

```
输入：a = "abcd", b = "cdabcdab"
输出：3
解释：a 重复叠加三遍后为 "abcdabcdabcd", 此时 b 是其子串。
```

**示例 2：**

```
输入：a = "a", b = "aa"
输出：2
```

**示例 3：**

```
输入：a = "a", b = "a"
输出：1
```

**示例 4：**

```
输入：a = "abc", b = "wxyz"
输出：-1
```

**提示：**

*   1 <= a.length <= 10<sup>4</sup>
*   1 <= b.length <= 10<sup>4</sup>
*   `a` 和 `b` 由小写英文字母组成


## Solution

Language: **C++**

```c++
class Solution {
public:
    int repeatedStringMatch(string a, string b) {
        int num = 0;
        string::size_type idx;
        idx = b.find(a);
        string left, right;
        bool flag = false;
        if (idx == string::npos) {
            if (a.find(b) != string::npos) {
                return 1;
            } 
            a = a + a;
            if (a.find(b) != string::npos) {
                return 2;
            } 
            return -1;
        } else {
            int idxA = 0, idxB = idx;
            for ( ; idxB < b.length(); idxB++) {
                if (a[idxA] != b[idxB]) {
                    return -1;
                }
                idxA++;
                if (idxA == a.length()) {
                    idxA = 0;
                    num++;
                }
            }
            if (idxA) {
                num++;
            }
            idxB = idx - 1;
            num += idxB >= 0 ? 1 : 0;
            idxA = a.length() - 1;
            for ( ; idxB >= 0; idxB--) {
                if (a[idxA] != b[idxB]) {
                    return -1;
                }
                idxA--;
                if (idxA == -1) {
                    idxA = a.length() - 1;
                    num++;
                }
            }
        }
        return num;
    }
};
```