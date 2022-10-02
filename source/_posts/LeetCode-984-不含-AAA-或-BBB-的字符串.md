---
title: LeetCode 984. 不含 AAA 或 BBB 的字符串
date: 2022-10-02 23:13:24
tags:
 - 贪心
 - 字符串
categories: LeetCode
---

# [984\. 不含 AAA 或 BBB 的字符串](https://leetcode.cn/problems/string-without-aaa-or-bbb/)

## Description

Difficulty: **中等**  

Related Topics: [贪心](https://leetcode.cn/tag/greedy/), [字符串](https://leetcode.cn/tag/string/)


给定两个整数 `a` 和 `b` ，返回 **任意** 字符串 `s` ，要求满足：

*   `s` 的长度为 `a + b`，且正好包含`<font color="#c7254e"><font face="Menlo, Monaco, Consolas, Courier New, monospace"><span style="font-size:12.600000381469727px"><span style="caret-color:#c7254e"><span style="background-color:#f9f2f4">a</span></span></span></font></font>` 个 `'a'` 字母与 `<font color="#c7254e"><font face="Menlo, Monaco, Consolas, Courier New, monospace"><span style="font-size:12.600000381469727px"><span style="caret-color:#c7254e"><span style="background-color:#f9f2f4">b</span></span></span></font></font>` 个 `'b'` 字母；
*   子串 `'aaa'` 没有出现在 `s` 中；
*   子串 `'bbb'` 没有出现在 `s` 中。

**示例 1：**

```
输入：a = 1, b = 2
输出："abb"
解释："abb", "bab" 和 "bba" 都是正确答案。
```

**示例 2：**

```
输入：a = 4, b = 1
输出："aabaa"
```

**提示：**

*   `0 <= a, b <= 100`
*   对于给定的 `a` 和 `b`，保证存在满足要求的 `s` 

<span style="display:block"><span style="height:0px"><span style="position:absolute">​​​</span></span></span>

## Solution

Language: **C++**

```c++
class Solution {
public:
    string addEqual(string src) {
        if (src.length() == 0) {
            src += 'a';
            src += 'b';
        } else {
            src += (src[src.length() - 1] == 'a' ? "ba" : "ab");
        }

        return src;
    }

    string add(string src, int& large, int& small, char l, char s) {
        if (src.length() == 0) {
            if (small > 0) {
                src += l;
                src += l;
                src += s;
                large-=2;
                small--;
            } else {
                src += l;
                large--;
            }
            return src;
        }
        if (small > 0) {
            if (src[src.length() - 1] == l) {
                src += s;
                src += l;
                src += l;
                small--;
                large-=2;
            } else {
                src += l;
                src += l;
                src += s;
                large-=2;
                small--;
            }
        } else {
            src += l;
            large--;
        }
        return src;
    }

    string strWithout3a3b(int a, int b) {
        string res; 
        while (a > 0 || b > 0) {
            // cout << a << " " << b << " " << res << endl;
            if (a > b) {
                res = add(res, a, b, 'a','b');
            } else if (a < b) {
                res = add(res, b, a, 'b', 'a');
            } else {
                a--;
                b--;
                res = addEqual(res);
            }
        }
        return res;
    }
};
```