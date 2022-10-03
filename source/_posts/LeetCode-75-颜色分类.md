---
title: LeetCode 75. 颜色分类
date: 2022-10-03 16:43:34
tags:
 - 数组
 - 双指针
 - 排序
categories: LeetCode
---

# [75\. 颜色分类](https://leetcode.cn/problems/sort-colors/)

## Description

Difficulty: **中等**  

Related Topics: [数组](https://leetcode.cn/tag/array/), [双指针](https://leetcode.cn/tag/two-pointers/), [排序](https://leetcode.cn/tag/sorting/)


给定一个包含红色、白色和蓝色、共 `n`个元素的数组 `nums` ，**[原地](https://baike.baidu.com/item/%E5%8E%9F%E5%9C%B0%E7%AE%97%E6%B3%95)**对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。

我们使用整数 `0`、 `1` 和 `2` 分别表示红色、白色和蓝色。

必须在不使用库的sort函数的情况下解决这个问题。

**示例 1：**

```
输入：nums = [2,0,2,1,1,0]
输出：[0,0,1,1,2,2]
```

**示例 2：**

```
输入：nums = [2,0,1]
输出：[0,1,2]
```

**提示：**

*   `n == nums.length`
*   `1 <= n <= 300`
*   `nums[i]` 为 `0`、`1` 或 `2`

**进阶：**

*   你可以不使用代码库中的排序函数来解决这道题吗？
*   你能想出一个仅使用常数空间的一趟扫描算法吗？


## Solution

Language: **C++**

根据限制要求，使用一次遍历以及常数的时间复杂度和空间复杂度，用指针记录从前往后遍历的位置，如果当前位置为红色，则如果有在之前的白色，交换二者，如果当前位置为白色，则如果之前没有白色的则记录当前白色位置，否则无需操作，如果当前位置为蓝色，则与需要被交换的蓝色位置进行交换，再判断即可

```c++
class Solution {
public:
    void sortColors(vector<int>& nums) {
        int blue = nums.size() - 1;
        while (blue >= 0 && nums[blue] == 2) {
            blue--;
        }
        int red = 0, white = -1;
        while (red <= blue) {
            // cout << "nums: ";
            // for (int n : nums) {
            //     cout << n << " ";
            // }
            // cout << endl;
            // cout << red << " " << blue << endl;
            switch (nums[red]) {
                case 0:
                    // cout << "case 0 called" << endl;
                    if (white != -1) {
                        nums[white] = 0;
                        nums[red] = 1;
                        for ( ; white <= red && nums[white] != 1; white++) { }
                        red++;
                    } else {
                        red++;
                    }
                    break;
                case 1:
                    // cout << "case 1 called" << endl;
                    if (white == -1) {
                        white = red;
                        red++;
                    } else {
                        red++;
                    }
                    break;
                case 2:
                    // cout << "case 2 called" << endl;
                    nums[red] = nums[blue];
                    nums[blue] = 2;
                    while (blue >= 0 && nums[blue] == 2) {
                        blue--;
                    }
                    break;
            }
        }

    }
};
```