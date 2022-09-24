---
title: LeetCode 2333. 最小差值平方和
date: 2022-09-24 20:38:25
tags:
 - 数组
 - 数学
 - 排序
 - 堆（优先队列）
categories: LeetCode
---

# [2333\. 最小差值平方和](https://leetcode.cn/problems/minimum-sum-of-squared-difference/)

## Description

Difficulty: **中等**  

Related Topics: [数组](https://leetcode.cn/tag/array/), [数学](https://leetcode.cn/tag/math/), [排序](https://leetcode.cn/tag/sorting/), [堆（优先队列）](https://leetcode.cn/tag/heap-priority-queue/)


给你两个下标从 **0** 开始的整数数组 `nums1` 和 `nums2` ，长度为 `n` 。

数组 `nums1` 和 `nums2` 的 **差值平方和** 定义为所有满足 `0 <= i < n` 的 (nums1[i] - nums2[i])<sup>2</sup> 之和。

同时给你两个正整数 `k1` 和 `k2` 。你可以将 `nums1` 中的任意元素 `+1` 或者 `-1` 至多 `k1` 次。类似的，你可以将 `nums2` 中的任意元素 `+1` 或者 `-1` 至多 `k2` 次。

请你返回修改数组`nums1`至多`k1` 次且修改数组`nums2` 至多 `k2`次后的最小 **差值平方和** 。

**注意：**你可以将数组中的元素变成 **负** 整数。

**示例 1：**

```
输入：nums1 = [1,2,3,4], nums2 = [2,10,20,19], k1 = 0, k2 = 0
输出：579
解释：nums1 和 nums2 中的元素不能修改，因为 k1 = 0 和 k2 = 0 。
差值平方和为：(1 - 2)2 + (2 - 10)2 + (3 - 20)2 + (4 - 19)2 = 579 。
```

**示例 2：**

```
输入：nums1 = [1,4,10,12], nums2 = [5,8,6,9], k1 = 1, k2 = 1
输出：43
解释：一种得到最小差值平方和的方式为：
- 将 nums1[0] 增加一次。
- 将 nums2[2] 增加一次。
最小差值平方和为：
(2 - 5)2 + (4 - 8)2 + (10 - 7)2 + (12 - 9)2 = 43 。
注意，也有其他方式可以得到最小差值平方和，但没有得到比 43 更小答案的方案。
```

**提示：**

*   `n == nums1.length == nums2.length`
*   1 <= n <= 10<sup>5</sup>
*   0 <= nums1[i], nums2[i] <= 10<sup>5</sup>
*   0 <= k1, k2 <= 10<sup>9</sup>


## Solution

Language: **C++**

```c++
class Solution {
public:
    long long cal(long long a) {
        return a * a;
    }

    long long minSumSquareDiff(vector<int>& nums1, vector<int>& nums2, int k1, int k2) {
        long long result = 0;
        for (int i = 0;i < nums1.size();i++) {
            nums1[i] = (abs(nums1[i] - nums2[i]));
        }
        sort(nums1.begin(),nums1.end());
        vector<int> count(nums1.size() + 1,0);
        count[nums1.size() - 1] = 0;
        int sum = 0;
        for (int j = count.size() - 2; j > 0; j--) {
            count[j] = (count.size() - 1 - j) * (nums1[j] - nums1[j - 1]) + count[j + 1]; 
        }
        count[0] = (count.size() - 1) * (nums1[0]) + count[1];
        // for (auto ele : count) {
            // cout << ele  << " ";
        // }
        int index = count.size() - 1;
        k1 += k2;
        for ( ;index >= 0 && count[index] < k1; index--) { }
        // cout << "index: " << index;
        // if (index == 0) {
        //     return 0;
        // }
        for (int i = 0;i < index;i++) {
            result = result + cal(nums1[i]);
        }
         
        if (nums1.size() > index) {
            k1 -= count[index + 1];
            // cout << "k1 " << k1;
            int addNum = k1 / (nums1.size() - index);
            int modNum = k1 % (nums1.size() - index);
            // cout << endl << "Nums: " << addNum << " " << modNum << endl;
            for (int i = index; i < nums1.size(); i++) {
                if (modNum) {
                    modNum--;
                    result = result + cal(nums1[index] - addNum - 1);
                } else {
                    result = result + cal(nums1[index] - addNum);
                }
            }
        }
        return result;
    }
};
```