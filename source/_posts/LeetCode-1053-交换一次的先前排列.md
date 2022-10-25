---
title: LeetCode 1053. 交换一次的先前排列
date: 2022-10-25 16:35:43
tags:
 - 贪心
 - 数组
categories: LeetCode
---

# [1053\. 交换一次的先前排列](https://leetcode.cn/problems/previous-permutation-with-one-swap/)

## Description

Difficulty: **中等**  

Related Topics: [贪心](https://leetcode.cn/tag/greedy/), [数组](https://leetcode.cn/tag/array/)


给你一个正整数的数组 `A`（其中的元素不一定完全不同），请你返回可在 **一次交换**（交换两数字 `A[i]` 和 `A[j]` 的位置）后得到的、按字典序排列小于 `A` 的最大可能排列。

如果无法这么操作，就请返回原数组。

**示例 1：**

```
输入：arr = [3,2,1]
输出：[3,1,2]
解释：交换 2 和 1
```

**示例 2：**

```
输入：arr = [1,1,5]
输出：[1,1,5]
解释：已经是最小排列
```

**示例 3：**

```
输入：arr = [1,9,4,6,7]
输出：[1,7,4,6,9]
解释：交换 9 和 7
```

**示例 4：**

```
输入：arr = [3,1,1,3]
输出：[1,3,1,3]
解释：交换 1 和 3
```

**提示：**

*   1 <= arr.length <= 10<sup>4</sup>
*   1 <= arr[i] <= 10<sup>4</sup>


## Solution

Language: **C++**

```c++
class Solution {
public:
    vector<int> prevPermOpt1(vector<int>& arr) {
        // 最大的比其小的数 如果相等则取最近的
        stack<pair<int, int>> save;
        vector<int> markIdx;
        for (int i = arr.size() - 1; i >= 0; i--) {
            int idx = -1; 
            while (save.size() && arr[i] >= save.top().first) {
                if (arr[i] > save.top().first) {
                    idx = save.top().second;
                }
                save.pop();
            }
            save.push(make_pair(arr[i], i));
            markIdx.push_back(idx); 
        }
        for (int i = 0;i < markIdx.size(); i++) {
            if (markIdx[i] != -1) {
                swap(arr[markIdx.size() - 1 - i], arr[markIdx[i]]);
                return arr;
            }
        }
        return arr;
    }
};
```