---
title: 剑指 Offer II 038. 每日温度
date: 2022-09-11 17:48:12
tags:
- 栈
- 数组
- 单调栈
categories: 剑指 Offer II
---

# [剑指 Offer II 038\. 每日温度](https://leetcode.cn/problems/iIQa4I/)

## Description

Difficulty: **中等**  

Related Topics: [栈](https://leetcode.cn/tag/stack/), [数组](https://leetcode.cn/tag/array/), [单调栈](https://leetcode.cn/tag/monotonic-stack/)


请根据每日 `气温` 列表 `temperatures` ，重新生成一个列表，要求其对应位置的输出为：要想观测到更高的气温，至少需要等待的天数。如果气温在这之后都不会升高，请在该位置用 `0` 来代替。

**示例 1:**

```
输入: temperatures = [73,74,75,71,69,72,76,73]
输出: [1,1,4,2,1,1,0,0]
```

**示例 2:**

```
输入: temperatures = [30,40,50,60]
输出: [1,1,1,0]
```

**示例 3:**

```
输入: temperatures = [30,60,90]
输出: [1,1,0]
```

**提示：**

*   1 <= temperatures.length <= 10<sup>5</sup>
*   `30 <= temperatures[i] <= 100`

注意：本题与主站 739 题相同： [https://leetcode-cn.com/problems/daily-temperatures/](https://leetcode-cn.com/problems/daily-temperatures/)


## Solution

Language: **C++**

```c++
class Solution {
public:
    vector<int> dailyTemperatures(vector<int>& temperatures) {
        stack<pair<int,int>> tmp;
        vector<int> res;
        for (int i = temperatures.size() - 1;i >= 0;i--) {
            while (tmp.size() != 0 && temperatures[i] >= tmp.top().first) {
                tmp.pop();
            }
            if (tmp.size() == 0) {
                res.push_back(0);
            } else {
                res.push_back(tmp.top().second - i);
            }
            tmp.push(make_pair(temperatures[i],i));
        }
        vector<int> reverse;
        for (int i = res.size() - 1;i >= 0;i--) {
            reverse.push_back(res[i]);
        }
        return reverse;
    }
};
```