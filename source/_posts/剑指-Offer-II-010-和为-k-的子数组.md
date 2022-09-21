---
title: 剑指 Offer II 010. 和为 k 的子数组
date: 2022-09-21 12:51:59
tags:
 - 数组
 - 哈希表
 - 前缀和
categories: 剑指 Offer II
---

# [剑指 Offer II 010\. 和为 k 的子数组](https://leetcode.cn/problems/QTMn0o/)

## Description

Difficulty: **中等**  

Related Topics: [数组](https://leetcode.cn/tag/array/), [哈希表](https://leetcode.cn/tag/hash-table/), [前缀和](https://leetcode.cn/tag/prefix-sum/)


给定一个整数数组和一个整数 `k` **，**请找到该数组中和为 `k`的连续子数组的个数。

**示例 1：**

```
输入:nums = [1,1,1], k = 2
输出: 2
解释: 此题 [1,1] 与 [1,1] 为两种不同的情况
```

**示例 2：**

```
输入:nums = [1,2,3], k = 3
输出: 2
```

**提示:**

*   1 <= nums.length <= 2 * 10<sup>4</sup>
*   `-1000 <= nums[i] <= 1000`
*   -10<sup>7</sup> <= k <= 10<sup>7</sup>

注意：本题与主站 560 题相同： [https://leetcode-cn.com/problems/subarray-sum-equals-k/](https://leetcode-cn.com/problems/subarray-sum-equals-k/)


## Solution

Language: **C++**

```c++
class Solution {
public:
    int subarraySum(vector<int>& nums, int k) {
        map<int,int> tmp;
        int sum = 0;
        int result = 0;
        tmp[0] = 1;
        for (int i = 0;i < nums.size();i++) {
            sum += nums[i];
            if (tmp.find(sum - k) != (tmp.end())) {
                result += tmp[sum - k];
            }
            tmp[sum]++;
        }
        return result;
    }
};
```