---
title: LeetCode 481. 神奇字符串
date: 2022-10-31 19:49:26
tags:
 - 双指针
 - 字符串
categories: LeetCode
---

# [481\. 神奇字符串](https://leetcode.cn/problems/magical-string/)

## Description

Difficulty: **中等**  

Related Topics: [双指针](https://leetcode.cn/tag/two-pointers/), [字符串](https://leetcode.cn/tag/string/)


神奇字符串 `s` 仅由 `'1'` 和 `'2'` 组成，并需要遵守下面的规则：

*   神奇字符串 s 的神奇之处在于，串联字符串中 `'1'` 和 `'2'` 的连续出现次数可以生成该字符串。

`s` 的前几个元素是 `s = "1221121221221121122……"` 。如果将 `s` 中连续的若干 `1` 和 `2` 进行分组，可以得到 `"1 22 11 2 1 22 1 22 11 2 11 22 ......"` 。每组中 `1` 或者 `2` 的出现次数分别是 `"1 2 2 1 1 2 1 2 2 1 2 2 ......"` 。上面的出现次数正是 `s` 自身。

给你一个整数 `n` ，返回在神奇字符串 `s` 的前 `n` 个数字中 `1` 的数目。

**示例 1：**

```
输入：n = 6
输出：3
解释：神奇字符串 s 的前 6 个元素是 “122112”，它包含三个 1，因此返回 3 。 
```

**示例 2：**

```
输入：n = 1
输出：1
```

**提示：**

*   1 <= n <= 10<sup>5</sup>


## Solution

Language: **C++**

```c++
class Solution {
public:
    int generate(int n) {
        int count = 1;
        char firstStr[100100] = {'0'};
        char secondStr[100100] = {'0'};
        firstStr[0] = '1';
        firstStr[1] = '2';
        firstStr[2] = '2';
        secondStr[0] = '1';
        secondStr[1] = '2';
        int idx = 2;
        int idxFirst = 3;
        int idxSecond = 2;
        while (idxFirst < 100010)
        {
            secondStr[idxSecond] = firstStr[idx];
            char addC = firstStr[idxFirst - 1] == '1' ? '2' : '1';
            if (firstStr[idx] == '2') {
                firstStr[idxFirst++] = addC;
                firstStr[idxFirst++] = addC;
            } else {
                firstStr[idxFirst++] = addC;
            }
            idx++;
            idxSecond++;
        }
        count = 0;
        for (int i = 0;i < n;i++) {
            if (firstStr[i] == '1') {
                count++;
            }
        }
        return count;
    }

    int magicalString(int n) {
        return generate(n); 
    }
};
```