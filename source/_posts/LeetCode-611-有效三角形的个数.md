---
title: LeetCode 611. 有效三角形的个数
date: 2022-10-10 20:04:32
tags:
 - 贪心
 - 数组
 - 双指针
 - 二分查找
 - 排序
categories: LeetCode
---

# [611\. 有效三角形的个数](https://leetcode.cn/problems/valid-triangle-number/)

## Description

Difficulty: **中等**  

Related Topics: [贪心](https://leetcode.cn/tag/greedy/), [数组](https://leetcode.cn/tag/array/), [双指针](https://leetcode.cn/tag/two-pointers/), [二分查找](https://leetcode.cn/tag/binary-search/), [排序](https://leetcode.cn/tag/sorting/)


给定一个包含非负整数的数组 `nums` ，返回其中可以组成三角形三条边的三元组个数。

**示例 1:**

```
输入: nums = [2,2,3,4]
输出: 3
解释:有效的组合是: 
2,3,4 (使用第一个 2)
2,3,4 (使用第二个 2)
2,2,3
```

**示例 2:**

```
输入: nums = [4,2,3,4]
输出: 4
```

**提示:**

*   `1 <= nums.length <= 1000`
*   `0 <= nums[i] <= 1000`


## Solution

Language: **C++**

```c++
class Solution {
public:
    vector<int> N;
    // 找到小于target的数
    int find(int target, int begin, int end) {
        int mid = begin + (end - begin) / 2;
        int res = mid;
        while (begin <= end) {
            mid = begin + (end - begin) / 2;
            if (N[mid] >= target) {
                end = mid - 1;
            } else {
                res = mid;
                begin = mid + 1;
            }
        }
        return res;
    }

    int triangleNumber(vector<int>& nums) {
        sort(nums.begin(), nums.end());
        N = nums;
        int res = 0;
        for (int i = 0;i < int(nums.size() - 2); i++) {
            for (int j = i + 1; j < int(nums.size() - 1); j++) {
                int idx = find(nums[i] + nums[j], j + 1, nums.size() - 1);
                res += (nums[i] + nums[j] > nums[idx] ? idx - j : 0);
            }
        }
        return res;
    }
};
```