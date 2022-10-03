---
title: LeetCode 2033. 获取单值网格的最小操作数
date: 2022-10-03 19:34:36
tags:
 - 数组
 - 数学
 - 矩阵
 - 排序
categories: LeetCode
---

# [2033\. 获取单值网格的最小操作数](https://leetcode.cn/problems/minimum-operations-to-make-a-uni-value-grid/)

## Description

Difficulty: **中等**  

Related Topics: [数组](https://leetcode.cn/tag/array/), [数学](https://leetcode.cn/tag/math/), [矩阵](https://leetcode.cn/tag/matrix/), [排序](https://leetcode.cn/tag/sorting/)


给你一个大小为 `m x n` 的二维整数网格 `grid` 和一个整数 `x` 。每一次操作，你可以对 `grid` 中的任一元素 **加** `x` 或 **减** `x` 。

**单值网格** 是全部元素都相等的网格。

返回使网格化为单值网格所需的 **最小** 操作数。如果不能，返回 `-1` 。

**示例 1：**

![gridtxt](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20221003/gridtxt.7ajdnh8hy6s0.webp)

```
输入：grid = [[2,4],[6,8]], x = 2
输出：4
解释：可以执行下述操作使所有元素都等于 4 ： 
- 2 加 x 一次。
- 6 减 x 一次。
- 8 减 x 两次。
共计 4 次操作。
```

**示例 2：**

![gridtxt-1](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20221003/gridtxt-1.60ldpmkd15k0.webp)

```
输入：grid = [[1,5],[2,3]], x = 1
输出：5
解释：可以使所有元素都等于 3 。
```

**示例 3：**

![gridtxt-2](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20221003/gridtxt-2.197q3eeff22o.webp)

```
输入：grid = [[1,2],[3,4]], x = 2
输出：-1
解释：无法使所有元素相等。
```

**提示：**

*   `m == grid.length`
*   `n == grid[i].length`
*   1 <= m, n <= 10<sup>5</sup>
*   1 <= m * n <= 10<sup>5</sup>
*   1 <= x, grid[i][j] <= 10<sup>4</sup>


## Solution

Language: **C++**

```c++
class Solution {
public:
    int minOperations(vector<vector<int>>& grid, int x) {
        vector<int> tmp;
        for (int i = 0;i < grid.size(); i++) {
            for (int j = 0;j < grid[i].size(); j++) {
                tmp.push_back(grid[i][j]);
            }
        }
        sort(tmp.begin(), tmp.end());
        int target_1 = tmp[tmp.size() / 2];
        int target_2 = tmp[(tmp.size() - 1) / 2];
        int res1 = 0, res2 = 0;
        for (int i = 0;i < grid.size(); i++) {
            for (int j = 0;j < grid[i].size(); j++) {
                if (abs(grid[i][j] - target_1) % x != 0) {
                    return -1;
                }
                res1 += abs(grid[i][j] - target_1) / x;
                res2 += abs(grid[i][j] - target_2) / x;
            }
        }
        return min(res1, res2);
    }
};
```