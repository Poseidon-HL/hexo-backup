---
title: LeetCode 801. 使序列递增的最小交换次数
date: 2022-10-10 16:51:23
tags:
 - 数组
 - 动态规划
categories: LeetCode
---

# [801\. 使序列递增的最小交换次数](https://leetcode.cn/problems/minimum-swaps-to-make-sequences-increasing/)

## Description

Difficulty: **困难**  

Related Topics: [数组](https://leetcode.cn/tag/array/), [动态规划](https://leetcode.cn/tag/dynamic-programming/)


我们有两个长度相等且不为空的整型数组 `nums1` 和 `nums2` 。在一次操作中，我们可以交换 `nums1[i]` 和 `nums2[i]`的元素。

*   例如，如果 `nums1 = [1,2,3,8` ， `nums2 =[5,6,7,4]` ，你可以交换 `i = 3` 处的元素，得到 `nums1 =[1,2,3,4]` 和 `nums2 =[5,6,7,8]` 。

返回 _使 `nums1` 和 `nums2` **严格递增 **所需操作的最小次数_ 。

数组 `arr` **严格递增** 且  `arr[0] < arr[1] < arr[2] < ... < arr[arr.length - 1]` 。

**注意：**

*   用例保证可以实现操作。

**示例 1:**

```
输入: nums1 = [1,3,5,4], nums2 = [1,2,3,7]
输出: 1
解释: 
交换 A[3] 和 B[3] 后，两个数组如下:
A = [1, 3, 5, 7] ， B = [1, 2, 3, 4]
两个数组均为严格递增的。
```

**示例 2:**

```
输入: nums1 = [0,3,5,8,9], nums2 = [2,1,4,6,9]
输出: 1
```

**提示:**

*   2 <= nums1.length <= 10<sup>5</sup>
*   `nums2.length == nums1.length`
*   0 <= nums1[i], nums2[i] <= 2 * 10<sup>5</sup>


## Solution

Language: **C++**

```c++
class Solution {
public:
    int minSwap(vector<int>& nums1, vector<int>& nums2) {
        // DP[n][i]  i = 0不交换当前位置元素 i = 1交换当前位置元素
        vector<vector<int>> res;
        res.resize(nums1.size());
        res[0] = {0, 1};
        res[0][1] = nums2[0] == nums1[0] ? 0 : 1;
        for (int i = 1; i < res.size(); i++) {
            res[i].resize(2);
            if (nums1[i] == nums2[i]) {
                res[i][0] = min(res[i - 1][0], res[i - 1][1]);
                res[i][1] = res[i][0];
                continue;
            }
            // 如果交换前满足并且交换后也满足的话，可以取最小值，否则只能取其一
            bool satisfied1 = ((nums1[i] > nums1[i - 1]) && (nums2[i] > nums2[i - 1]));
            bool satisfied2 = ((nums1[i] > nums2[i - 1]) && (nums2[i] > nums1[i - 1]));
            if (satisfied1 && satisfied2) {
                res[i][0] = min(res[i - 1][0], res[i - 1][1]);
                res[i][1] = min(res[i - 1][1], res[i - 1][0]) + 1;
            } else if (satisfied1) {
                res[i][0] = res[i - 1][0];
                res[i][1] = res[i - 1][1] + 1;
            } else {
                res[i][1] = res[i - 1][0] + 1;
                res[i][0] = res[i - 1][1];
            }
        }
        return min(res[res.size() - 1][0], res[res.size() - 1][1]);
    }
};
```