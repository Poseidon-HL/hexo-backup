---
title: 剑指 Offer II 009. 乘积小于 K 的子数组
date: 2022-09-21 12:42:58
tags: 
 - 数组
 - 滑动窗口
categories: 剑指 Offer II
---

# [剑指 Offer II 009\. 乘积小于 K 的子数组](https://leetcode.cn/problems/ZVAVXX/)

## Description

Difficulty: **中等**  

Related Topics: [数组](https://leetcode.cn/tag/array/), [滑动窗口](https://leetcode.cn/tag/sliding-window/)


给定一个正整数数组 `nums`和整数 `k` ，请找出该数组内乘积小于 `k` 的连续的子数组的个数。

**示例 1:**

```
输入: nums = [10,5,2,6], k = 100
输出: 8
解释: 8 个乘积小于 100 的子数组分别为: [10], [5], [2], [6], [10,5], [5,2], [2,6], [5,2,6]。
需要注意的是 [10,5,2] 并不是乘积小于100的子数组。
```

**示例 2:**

```
输入: nums = [1,2,3], k = 0
输出: 0
```

**提示: **

*   1 <= nums.length <= 3 * 10<sup>4</sup>
*   `1 <= nums[i] <= 1000`
*   0 <= k <= 10<sup>6</sup>

注意：本题与主站 713 题相同：[https://leetcode-cn.com/problems/subarray-product-less-than-k/](https://leetcode-cn.com/problems/subarray-product-less-than-k/) 


## Solution

Language: **C++**

```c++
class Solution {
public:
    int numSubarrayProductLessThanK(vector<int>& nums, int k) {
        int begin = 0;
        int end = 0;
        int result = 0;
        int multiply = 1;

        while(end < nums.size()) {
            while (end < nums.size() && multiply < k) {
                multiply *= nums[end];
                if (multiply >= k) {
                    break;
                }   
                result += (end - begin + 1);
                end++;
            }
            while (multiply >= k && begin <= end) {
                multiply /= nums[begin];
                begin++;
                if (multiply < k) {
                    result += (end - begin + 1);
                    end++;
                    break;
                }
                if (begin > end) {
                    end++;
                    break;
                }
            }
        }
        return result;
    }
};
```

- 注意边界细节问题
- 反向也需要相加