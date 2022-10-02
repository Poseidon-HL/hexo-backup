---
title: LeetCode 777. 在LR字符串中交换相邻字符
date: 2022-10-02 14:44:42
tags:
 - 双指针
 - 字符串
categories: LeetCode
---

# [777\. 在LR字符串中交换相邻字符](https://leetcode.cn/problems/swap-adjacent-in-lr-string/)

## Description

Difficulty: **中等**  

Related Topics: [双指针](https://leetcode.cn/tag/two-pointers/), [字符串](https://leetcode.cn/tag/string/)


在一个由 `'L'` , `'R'` 和 `'X'` 三个字符组成的字符串（例如`"RXXLRXRXL"`）中进行移动操作。一次移动操作指用一个`"LX"`替换一个`"XL"`，或者用一个`"XR"`替换一个`"RX"`。现给定起始字符串`start`和结束字符串`end`，请编写代码，当且仅当存在一系列移动操作使得`start`可以转换成`end`时， 返回`True`。

**示例 :**

```
输入: start = "RXXLRXRXL", end = "XRLXXRRLX"
输出: True
解释:
我们可以通过以下几步将start转换成end:
RXXLRXRXL ->
XRXLRXRXL ->
XRLXRXRXL ->
XRLXXRRXL ->
XRLXXRRLX
```

**提示：**

*   `1 <= len(start) = len(end) <= 10000`。
*   `start`和`end`中的字符串仅限于`'L'`, `'R'`和`'X'`。


## Solution

Language: **C++**

```c++
class Solution {
public:
    bool canTransform(string start, string end) {
        // L只能向左移动
        // R只能向右移动 且两者的相对顺序无法改变
        string tmp1;
        string tmp2;
        vector<int> idx1;
        vector<int> idx2;
        for (int i = 0;i < start.length(); i++) {
            if (start[i] != 'X') {
                tmp1 += start[i];
                idx1.push_back(i);
            }
            if (end[i] != 'X') {
                tmp2 += end[i];
                idx2.push_back(i);
            }
        }
        if (tmp1 != tmp2) {
            return false;
        }
        for (int i = 0;i < tmp1.size(); i++) {
            if (tmp1[i] == 'L') {
                if (idx1[i] < idx2[i]) {
                    return false;
                }
            } else {
                if (idx1[i] > idx2[i]) {
                    return false;
                }
            }
        }
        return true;
    }
};
```