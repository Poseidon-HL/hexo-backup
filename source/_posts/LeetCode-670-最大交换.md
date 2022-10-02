---
title: LeetCode 670. 最大交换
date: 2022-10-02 22:13:44
tags:
 - 贪心
 - 数学
categories: LeetCode
---

# [670\. 最大交换](https://leetcode.cn/problems/maximum-swap/)

## Description

Difficulty: **中等**  

Related Topics: [贪心](https://leetcode.cn/tag/greedy/), [数学](https://leetcode.cn/tag/math/)


给定一个非负整数，你**至多**可以交换一次数字中的任意两位。返回你能得到的最大值。

**示例 1 :**

```
输入: 2736
输出: 7236
解释: 交换数字2和数字7。
```

**示例 2 :**

```
输入: 9973
输出: 9973
解释: 不需要交换。
```

**注意:**

1.  给定数字的范围是 [0, 10<sup>8</sup>]


## Solution

Language: **C++**

```c++
class Solution {
public:
    int maximumSwap(int num) {
        // 如果右边有比自己大的数，则换为该数，且换成最右边的index
        int result = 0;
        vector<int> tmp;
        while (num) {
            tmp.push_back(num % 10);
            num /= 10;
        }
        for (int i = tmp.size() - 1;i >= 0; i--) {
            int idx = -1;
            int maxNum = tmp[i];
            for (int j = i - 1;j >= 0; j--) {
                if (tmp[j] >= maxNum && tmp[j] > tmp[i]) {
                    maxNum = tmp[j];
                    idx = j;
                }
            }
            if (idx != -1) {
                int target = tmp[idx];
                tmp[idx] = tmp[i];
                tmp[i] = target;
                break;
            }
        }
        for (int i = tmp.size() - 1; i >= 0; i--) {
            result = result * 10 + tmp[i];
        }
        return result;
    }
};
```