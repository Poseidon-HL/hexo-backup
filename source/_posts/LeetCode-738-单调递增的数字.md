---
title: LeetCode 738. 单调递增的数字
date: 2022-10-10 19:05:18
tags:
 - 贪心
 - 数学
categories: LeetCode
---

# [738\. 单调递增的数字](https://leetcode.cn/problems/monotone-increasing-digits/)

## Description

Difficulty: **中等**  

Related Topics: [贪心](https://leetcode.cn/tag/greedy/), [数学](https://leetcode.cn/tag/math/)


当且仅当每个相邻位数上的数字 `x` 和 `y` 满足 `x <= y` 时，我们称这个整数是**单调递增**的。

给定一个整数 `n` ，返回 _小于或等于 `n` 的最大数字，且数字呈 **单调递增**_ 。

**示例 1:**

```
输入: n = 10
输出: 9
```

**示例 2:**

```
输入: n = 1234
输出: 1234
```

**示例 3:**

```
输入: n = 332
输出: 299
```

**提示:**

*   0 <= n <= 10<sup>9</sup>


## Solution

Language: **C++**

```c++
class Solution {
public:
    int monotoneIncreasingDigits(int n) {
        // 找到第一个比右边最小的数大的数即可，如果有相同的数字，则取最左侧的位置
        // 找到之后，还需要找到已经有序的位置
        int ans = n;
        vector<int> tmp;
        if (!n) {
            return n;
        }
        while (n) {
            tmp.push_back(n % 10);
            n /= 10;
        }
        reverse(tmp.begin(), tmp.end());
        int minNum = tmp[tmp.size() - 1], index = -1;
        for (int i = tmp.size() - 1; i >= 0; i--) {
            if (tmp[i] < minNum) {
                minNum = tmp[i];
            }
            if (tmp[i] > minNum) {
                index = i;
            }
        }
        int beforeIndex = index;
        if (index != -1) {
            while (index < tmp.size() - 1 && (tmp[index + 1] >= tmp[index])) {
                index++;
            }
            while (index > 0 && tmp[index - 1] == tmp[index]) {
                index--;
            }
            ans = 0;
            for (int i = 0;i < index; i++) {
                ans = ans * 10 + tmp[i];
            }
            ans = ans * 10 + tmp[index] - 1;
            for (int i = index + 1;i < tmp.size(); i++) {
                ans = ans * 10 + 9;
            }
        }
        return ans; 
    }
};
```