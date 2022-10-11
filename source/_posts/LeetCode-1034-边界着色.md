---
title: LeetCode 1034. 边界着色
date: 2022-10-11 15:09:11
tags:
 - 深度优先搜索
 - 广度优先搜索
 - 数组
 - 矩阵
categories: LeetCode
---

# [1034\. 边界着色](https://leetcode.cn/problems/coloring-a-border/)

## Description

Difficulty: **中等**  

Related Topics: [深度优先搜索](https://leetcode.cn/tag/depth-first-search/), [广度优先搜索](https://leetcode.cn/tag/breadth-first-search/), [数组](https://leetcode.cn/tag/array/), [矩阵](https://leetcode.cn/tag/matrix/)


给你一个大小为 `m x n` 的整数矩阵 `grid` ，表示一个网格。另给你三个整数 `row`、`col` 和 `color` 。网格中的每个值表示该位置处的网格块的颜色。

两个网格块属于同一 **连通分量** 需满足下述全部条件：

*   两个网格块颜色相同
*   在上、下、左、右任意一个方向上相邻

**连通分量的边界**是指连通分量中满足下述条件之一的所有网格块：

*   在上、下、左、右任意一个方向上与不属于同一连通分量的网格块相邻
*   在网格的边界上（第一行/列或最后一行/列）

请你使用指定颜色 `color` 为所有包含网格块 `grid[row][col]` 的 **连通分量的边界** 进行着色，并返回最终的网格 `grid` 。

**示例 1：**

```
输入：grid = [[1,1],[1,2]], row = 0, col = 0, color = 3
输出：[[3,3],[3,2]]
```

**示例 2：**

```
输入：grid = [[1,2,2],[2,3,2]], row = 0, col = 1, color = 3
输出：[[1,3,3],[2,3,3]]
```

**示例 3：**

```
输入：grid = [[1,1,1],[1,1,1],[1,1,1]], row = 1, col = 1, color = 2
输出：[[2,2,2],[2,1,2],[2,2,2]]
```

**提示：**

*   `m == grid.length`
*   `n == grid[i].length`
*   `1 <= m, n <= 50`
*   `1 <= grid[i][j], color <= 1000`
*   `0 <= row < m`
*   `0 <= col < n`


## Solution

Language: **C++**

```c++
class Solution {
public:
    int indexX[4] = {0, 0, -1, 1};
    int indexY[4] = {-1, 1, 0, 0};
    vector<vector<int>> copy;
    
    bool isValid(int x, int y) {
        return (x >= 0 && x < copy.size() && y >= 0 && y < copy[x].size());
    }
    
    bool isBoundary(int x, int y) {
        return (x == 0 || x == copy.size() - 1 || y == 0 || y == copy[x].size() - 1);
    }

    vector<vector<int>> colorBorder(vector<vector<int>>& grid, int row, int col, int color) {
        copy = grid;
        queue<pair<int,int>> tmp;
        int target = grid[row][col];
        vector<vector<bool>> visited(grid.size(), vector<bool> (grid[0].size()));
        visited[row][col] = true;
        tmp.push(make_pair(row, col));
        while (tmp.size()) {
            pair<int,int> frontEle = tmp.front();
            bool isBound = false;
            for (int i = 0;i < 4;i++) {
                int newX = frontEle.first + indexX[i], newY = frontEle.second + indexY[i];
                if (isValid(newX, newY) && !visited[newX][newY] && copy[newX][newY] == target) {
                    visited[newX][newY] = true;
                    tmp.push(make_pair(newX, newY));
                }
                if (isValid(newX, newY) && copy[newX][newY] != target) {
                    isBound = true;
                }
            }
            if (isBound || isBoundary(frontEle.first, frontEle.second)) {
                grid[frontEle.first][frontEle.second] = color;
            }
            tmp.pop();
        }
        return grid;
    }
};
```