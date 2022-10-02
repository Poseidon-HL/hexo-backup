---
title: 剑指 Offer II 112. 最长递增路径
date: 2022-10-02 17:42:30
tags:
 - 深度优先搜索
 - 广度优先搜索
 - 图
 - 拓扑排序
 - 记忆化搜索
 - 数组
 - 动态规划
 - 矩阵
categories: 剑指 Offer II
---

# [剑指 Offer II 112\. 最长递增路径](https://leetcode.cn/problems/fpTFWP/)

## Description

Difficulty: **困难**  

Related Topics: [深度优先搜索](https://leetcode.cn/tag/depth-first-search/), [广度优先搜索](https://leetcode.cn/tag/breadth-first-search/), [图](https://leetcode.cn/tag/graph/), [拓扑排序](https://leetcode.cn/tag/topological-sort/), [记忆化搜索](https://leetcode.cn/tag/memoization/), [数组](https://leetcode.cn/tag/array/), [动态规划](https://leetcode.cn/tag/dynamic-programming/), [矩阵](https://leetcode.cn/tag/matrix/)


给定一个 `m x n` 整数矩阵 `matrix` ，找出其中 **最长递增路径** 的长度。

对于每个单元格，你可以往上，下，左，右四个方向移动。 **不能** 在 **对角线** 方向上移动或移动到 **边界外**（即不允许环绕）。

**示例 1：**

![grid1](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20221002/grid1.32wqcd2m28w0.webp)
```
输入：matrix = [[9,9,4],[6,6,8],[2,1,1]]
输出：4 
解释：最长递增路径为 [1, 2, 6, 9]。
```

**示例 2：**

![tmp-grid](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20221002/tmp-grid.5a8yi866r30.webp)
```
输入：matrix = [[3,4,5],[3,2,6],[2,2,1]]
输出：4 
解释：最长递增路径是 [3, 4, 5, 6]。注意不允许在对角线方向上移动。
```

**示例 3：**

```
输入：matrix = [[1]]
输出：1
```

**提示：**

*   `m == matrix.length`
*   `n == matrix[i].length`
*   `1 <= m, n <= 200`
*   0 <= matrix[i][j] <= 2<sup>31</sup> - 1

注意：本题与主站 329 题相同： [https://leetcode-cn.com/problems/longest-increasing-path-in-a-matrix/](https://leetcode-cn.com/problems/longest-increasing-path-in-a-matrix/)


## Solution

Language: **C++**

```c++
class Solution {
public:
    vector<vector<int>> M;
    vector<vector<int>> PathLength;
    int indexX[4] = {-1, 1, 0, 0};
    int indexY[4] = {0, 0, -1, 1};
    int DFS(int i, int j, int num, bool flag) {
        // cout << i << " " << j << endl;
        if (i < 0 || i >= M.size() || j < 0 || j >= M[i].size()) {
            return 0;
        }
        if (num >= M[i][j] && flag) {
            return 0;
        }
        if (PathLength[i][j] != 0) {
            return PathLength[i][j];
        }
        int maxPath = 0;
        for (int idx = 0;idx < 4; idx++) {
            maxPath = max(maxPath, DFS(i + indexX[idx], j + indexY[idx], M[i][j], true));
        }
        PathLength[i][j] = maxPath + 1;
        return PathLength[i][j];
    }
    int longestIncreasingPath(vector<vector<int>>& matrix) {
        M = matrix;
        PathLength.resize(M.size());
        for (int i = 0;i < matrix.size(); i++) {
            PathLength[i].resize(matrix[i].size());
            for (int j = 0;j < PathLength[i].size(); j++) {
                PathLength[i][j] = 0;
            }
        }
        int res = 0;
        for (int i = 0;i < matrix.size(); i++) {
            for (int j = 0;j < matrix[i].size(); j++) {
                res = max(res, DFS(i, j, M[i][j], false));
            }
        }
        return res;
    }
};
```