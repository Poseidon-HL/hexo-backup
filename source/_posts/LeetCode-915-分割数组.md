---
title: LeetCode 915. 分割数组
date: 2022-10-25 20:20:06
tags:
 - 数组
categories: LeetCode
---

# [915\. 分割数组](https://leetcode.cn/problems/partition-array-into-disjoint-intervals/)

## Description

Difficulty: **中等**  

Related Topics: [数组](https://leetcode.cn/tag/array/)


给定一个数组 `nums` ，将其划分为两个连续子数组 `left` 和 `right`， 使得：

*   `left` 中的每个元素都小于或等于 `right` 中的每个元素。
*   `left` 和 `right` 都是非空的。
*   `left` 的长度要尽可能小。

_在完成这样的分组后返回 `left` 的 **长度 **_。

用例可以保证存在这样的划分方法。

**示例 1：**

```
输入：nums = [5,0,3,8,6]
输出：3
解释：left = [5,0,3]，right = [8,6]
```

**示例 2：**

```
输入：nums = [1,1,1,0,6,12]
输出：4
解释：left = [1,1,1,0]，right = [6,12]
```

**提示：**

*   2 <= nums.length <= 10<sup>5</sup>
*   0 <= nums[i] <= 10<sup>6</sup>
*   可以保证至少有一种方法能够按题目所描述的那样对 `nums` 进行划分。


## Solution

Language: **C++**

```c++
class Solution {
public:
    int partitionDisjoint(vector<int>& nums) {
        // 只需要记录左边最大的和右边最小的
        vector<int> left = nums;
        vector<int> right = nums;
        int leftMax = INT_MIN, rightMin = INT_MAX;
        for (int i = 0;i < nums.size();i++) {
            leftMax = max(nums[i], leftMax);
            left[i] = leftMax;
            right[nums.size() - 1 - i] = rightMin;
            rightMin = min(rightMin, nums[nums.size() - 1 - i]);
        }
        for (int i = 0;i < left.size(); i++) {
            if (left[i] <= right[i]) {
                return i + 1;
            }
        }
        return nums.size();
    }
};
```