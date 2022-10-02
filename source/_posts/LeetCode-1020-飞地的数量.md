---
title: LeetCode 1020. 飞地的数量
date: 2022-10-02 16:27:14
tags:
 - 深度优先搜索
 - 广度优先搜索
 - 并查集
 - 数组
 - 矩阵
categories: LeetCode
---

# [1020\. 飞地的数量](https://leetcode.cn/problems/number-of-enclaves/)

## Description

Difficulty: **中等**  

Related Topics: [深度优先搜索](https://leetcode.cn/tag/depth-first-search/), [广度优先搜索](https://leetcode.cn/tag/breadth-first-search/), [并查集](https://leetcode.cn/tag/union-find/), [数组](https://leetcode.cn/tag/array/), [矩阵](https://leetcode.cn/tag/matrix/)


给你一个大小为 `m x n` 的二进制矩阵 `grid` ，其中 `0` 表示一个海洋单元格、`1` 表示一个陆地单元格。

一次 **移动** 是指从一个陆地单元格走到另一个相邻（**上、下、左、右**）的陆地单元格或跨过 `grid` 的边界。

返回网格中 **无法** 在任意次数的移动中离开网格边界的陆地单元格的数量。

**示例 1：**

![enclaves1](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20221002/enclaves1.1054b6pxnecw.webp)
```
输入：grid = [[0,0,0,0],[1,0,1,0],[0,1,1,0],[0,0,0,0]]
输出：3
解释：有三个 1 被 0 包围。一个 1 没有被包围，因为它在边界上。
```

**示例 2：**

![enclaves2](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20221002/enclaves2.4zphtxsx9mc0.webp)
```
输入：grid = [[0,1,1,0],[0,0,1,0],[0,0,1,0],[0,0,0,0]]
输出：0
解释：所有 1 都在边界上或可以到达边界。
```

**提示：**

*   `m == grid.length`
*   `n == grid[i].length`
*   `1 <= m, n <= 500`
*   `grid[i][j]` 的值为 `0` 或 `1`


## Solution

Language: **C++**

```c++
class Solution {
public:
    vector<vector<int>> G;
    vector<vector<bool>> isAble2Grid;
    vector<vector<bool>> visited;
    int indexI[4] = {0, 0, -1, 1};
    int indexJ[4] = {-1, 1, 0, 0};
    void Spread(int i, int j) {
        if (i < 0 || i >= G.size() || j < 0 || j >= G[i].size() || G[i][j] == 0 || visited[i][j]) {
            return ;
        }
        if (isAble2Grid[i][j]) {
            return ;
        }
        visited[i][j] = true;
        isAble2Grid[i][j] = true;
        for (int idx = 0;idx < 4; idx++) {
            Spread(i + indexI[idx], j + indexJ[idx]);
        }
        visited[i][j] = false;
    }
    int numEnclaves(vector<vector<int>>& grid) {
        G = grid;
        isAble2Grid.resize(G.size());
        visited.resize(G.size());
        for (int i = 0;i < grid.size(); i++) {
            isAble2Grid[i].resize(G[i].size());
            visited[i].resize(G[i].size());
        }
        for (int i = 0;i < grid.size(); i++) {
            Spread(i,0);
            Spread(i, G[i].size() - 1);
        }
        for (int j = 0;j < grid[0].size(); j++) {
            Spread(0,j);
            Spread(G.size() - 1, j);
        }
        int res = 0;
        for (int i = 0;i < G.size(); i++) {
            for (int j = 0;j < G[i].size();j++) {
                if (grid[i][j] == 1) {
                    if (!isAble2Grid[i][j]) {
                        res++;
                    }
                }
            }
        }
        return res;
    }
};
```