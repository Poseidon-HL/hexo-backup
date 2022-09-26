---
title: LeetCode 658. 找到 K 个最接近的元素
date: 2022-09-26 18:48:11
tags: 
 - 数组
 - 双指针
 - 二分查找
 - 堆（优先队列）
categories: LeetCode
---

# [658\. 找到 K 个最接近的元素](https://leetcode.cn/problems/find-k-closest-elements/)

## Description

Difficulty: **中等**  

Related Topics: [数组](https://leetcode.cn/tag/array/), [双指针](https://leetcode.cn/tag/two-pointers/), [二分查找](https://leetcode.cn/tag/binary-search/), [排序](https://leetcode.cn/tag/sorting/), [堆（优先队列）](https://leetcode.cn/tag/heap-priority-queue/)


给定一个 **排序好** 的数组 `arr` ，两个整数 `k` 和 `x` ，从数组中找到最靠近 `x`（两数之差最小）的 `k` 个数。返回的结果必须要是按升序排好的。

整数 `a` 比整数 `b` 更接近 `x` 需要满足：

*   `|a - x| < |b - x|` 或者
*   `|a - x| == |b - x|` 且 `a < b`

**示例 1：**

```
输入：arr = [1,2,3,4,5], k = 4, x = 3
输出：[1,2,3,4]
```

**示例 2：**

```
输入：arr = [1,2,3,4,5], k = 4, x = -1
输出：[1,2,3,4]
```

**提示：**

*   `1 <= k <= arr.length`
*   1 <= arr.length <= 10<sup>4</sup>
*   `arr` 按 **升序** 排列
*   -10<sup>4</sup> <= arr[i], x <= 10<sup>4</sup>


## Solution

Language: **C++**

```c++
class Solution {
public:
    deque<int> res;
    vector<int> findClosestElements(vector<int>& arr, int k, int x) {
        int left = 0, right = arr.size() - 1, mid = 0, index = 0;
        while (left <= right) {
            mid = left + (right - left) / 2;
            if (arr[mid] <= x) {
                index = mid;
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        // cout << index;
        left = index;
        right = index + 1;
        while (k) {
            if (left < 0) {
                res.push_back(arr[right++]);
            } else if (right >= arr.size()) {
                res.push_front(arr[left--]);
            } else if (abs(x - arr[left]) <= abs(arr[right] - x)) {
                res.push_front(arr[left--]);
            } else {
                res.push_back(arr[right++]);
            }
            k--;
        }
        vector<int> result;
        while (res.size()) {
            result.push_back(res.front());
            res.pop_front();
        }
        return result;
    }
};
```