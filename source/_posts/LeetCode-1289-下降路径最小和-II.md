---
title: LeetCode 1289. 下降路径最小和  II
date: 2022-09-30 17:34:54
tags:
 - 数组
 - 动态规划
 - 矩阵
categories: LeetCode
---

# [1289\. 下降路径最小和 II](https://leetcode.cn/problems/minimum-falling-path-sum-ii/)

## Description

Difficulty: **困难**  

Related Topics: [数组](https://leetcode.cn/tag/array/), [动态规划](https://leetcode.cn/tag/dynamic-programming/), [矩阵](https://leetcode.cn/tag/matrix/)


给你一个 `n x n` 整数矩阵 `arr` ，请你返回 **非零偏移下降路径** 数字和的最小值。

**非零偏移下降路径** 定义为：从 `arr` 数组中的每一行选择一个数字，且按顺序选出来的数字中，相邻数字不在原数组的同一列。

**示例 1：**

![falling-grid](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220930/falling-grid.5x44uj432ws0.webp)
```
输入：arr = [[1,2,3],[4,5,6],[7,8,9]]
输出：13
解释：
所有非零偏移下降路径包括：
[1,5,9], [1,5,7], [1,6,7], [1,6,8],
[2,4,8], [2,4,9], [2,6,7], [2,6,8],
[3,4,8], [3,4,9], [3,5,7], [3,5,9]
下降路径中数字和最小的是 [1,5,7] ，所以答案是 13 。
```

**示例 2：**

```
输入：grid = [[7]]
输出：7
```

**提示：**

*   `n == grid.length == grid[i].length`
*   `1 <= n <= 200`
*   `-99 <= grid[i][j] <= 99`


## Solution

Language: **C++**

```c++
class Solution {
public:
    int minFallingPathSum(vector<vector<int>>& grid) {
        for (int i = 1; i < grid.size(); i++) {
            for (int j = 0;j < grid[i].size(); j++) {
                int tmp = INT_MAX;
                for (int j2 = 0; j2 < grid[i].size(); j2++) {
                    if (j2 != j) {
                        tmp = min(tmp, grid[i - 1][j2]);
                    }
                }
                grid[i][j] += tmp;
            }
        }
        int result = INT_MAX;
        for (int j = 0;j < grid[grid.size() - 1].size();j++) {
            result = min(result, grid[grid.size() - 1][j]);
        }
        return result;
    }
};
```