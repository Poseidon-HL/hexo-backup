---
title: LeetCode 1679. K 和数对的最大数目
date: 2022-09-24 18:30:46
tags:
 - 数组
 - 哈希表
 - 双指针
 - 排序
categories: LeetCode
---

# [1679\. K 和数对的最大数目](https://leetcode.cn/problems/max-number-of-k-sum-pairs/)

## Description

Difficulty: **中等**  

Related Topics: [数组](https://leetcode.cn/tag/array/), [哈希表](https://leetcode.cn/tag/hash-table/), [双指针](https://leetcode.cn/tag/two-pointers/), [排序](https://leetcode.cn/tag/sorting/)


给你一个整数数组 `nums` 和一个整数 `k` 。

每一步操作中，你需要从数组中选出和为 `k` 的两个整数，并将它们移出数组。

返回你可以对数组执行的最大操作数。

**示例 1：**

```
输入：nums = [1,2,3,4], k = 5
输出：2
解释：开始时 nums = [1,2,3,4]：
- 移出 1 和 4 ，之后 nums = [2,3]
- 移出 2 和 3 ，之后 nums = []
不再有和为 5 的数对，因此最多执行 2 次操作。
```

**示例 2：**

```
输入：nums = [3,1,3,4,3], k = 6
输出：1
解释：开始时 nums = [3,1,3,4,3]：
- 移出前两个 3 ，之后nums = [1,4,3]
不再有和为 6 的数对，因此最多执行 1 次操作。
```

**提示：**

*   1 <= nums.length <= 10<sup>5</sup>
*   1 <= nums[i] <= 10<sup>9</sup>
*   1 <= k <= 10<sup>9</sup>


## Solution

Language: **C++**

```c++
class Solution {
public:
    int maxOperations(vector<int>& nums, int k) {
        sort(nums.begin(), nums.end());
        int l = 0, r = nums.size() - 1;
        int res = 0;
        while (l < r) {
            if (nums[l] + nums[r] > k) {
                r--;
            } else if (nums[l] + nums[r] < k) {
                l++;
            } else {
                res++;
                l++;
                r--;
            }
        }
        return res;
    }
};
```