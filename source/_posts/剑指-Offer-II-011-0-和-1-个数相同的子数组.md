---
title: 剑指 Offer II 011. 0 和 1 个数相同的子数组
date: 2022-09-21 10:27:40
tags: 
 - 数组
 - 哈希表
 - 前缀和
categories: 剑指 Offer II
---

# [剑指 Offer II 011\. 0 和 1 个数相同的子数组](https://leetcode.cn/problems/A1NYOS/)

## Description

Difficulty: **中等**  

Related Topics: [数组](https://leetcode.cn/tag/array/), [哈希表](https://leetcode.cn/tag/hash-table/), [前缀和](https://leetcode.cn/tag/prefix-sum/)


给定一个二进制数组 `nums` , 找到含有相同数量的 `0` 和 `1` 的最长连续子数组，并返回该子数组的长度。

**示例 1：**

```
输入: nums = [0,1]
输出: 2
说明: [0, 1] 是具有相同数量 0 和 1 的最长连续子数组。
```

**示例 2：**

```
输入: nums = [0,1,0]
输出: 2
说明: [0, 1] (或 [1, 0]) 是具有相同数量 0 和 1 的最长连续子数组。
```

**提示：**

*   1 <= nums.length <= 10<sup>5</sup>
*   `nums[i]` 不是 `0` 就是 `1`

注意：本题与主站 525 题相同： [https://leetcode-cn.com/problems/contiguous-array/](https://leetcode-cn.com/problems/contiguous-array/)


## Solution

Language: **C++**

```c++
class Solution {
public:
    int findMaxLength(vector<int>& nums) {
        int result = 0;
        int count = 0;
        map<int,int> index;
        int i = 0;
        index[0] = -1;
        for (i = 0;i < nums.size();i++) {
            if (nums[i] == 1) {
                count++;
            } else {
                count--;
            }
            if (index.find(count) != index.end()) {
                result = max(result, i - index[count]);
            } else {
                index[count] = i;
            }
        }
        return result;
    }
};
```