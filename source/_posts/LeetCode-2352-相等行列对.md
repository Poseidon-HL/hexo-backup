---
title: LeetCode 2352. 相等行列对
date: 2022-10-25 15:43:01
tags:
 - 数组
 - 哈希表
 - 矩阵
 - 模拟
categories: LeetCode
---

# [2352\. 相等行列对](https://leetcode.cn/problems/equal-row-and-column-pairs/)

## Description

Difficulty: **中等**  

Related Topics: [数组](https://leetcode.cn/tag/array/), [哈希表](https://leetcode.cn/tag/hash-table/), [矩阵](https://leetcode.cn/tag/matrix/), [模拟](https://leetcode.cn/tag/simulation/)


给你一个下标从 **0** 开始、大小为 `n x n` 的整数矩阵 `grid` ，返回满足 R<sub>i</sub>行和C<sub>j</sub>列相等的行列对(R<sub>i</sub>, C<sub>j</sub>)的数目_。_

如果行和列以相同的顺序包含相同的元素（即相等的数组），则认为二者是相等的。

**示例 1：**

![ex1](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20221025/ex1.3ag3jr72of80.webp)

```
输入：grid = [[3,2,1],[1,7,6],[2,7,7]]
输出：1
解释：存在一对相等行列对：
- (第 2 行，第 1 列)：[2,7,7]
```

**示例 2：**

![ex2](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20221025/ex2.4zpaqquau7o0.webp)

```
输入：grid = [[3,1,2,2],[1,4,4,5],[2,4,2,2],[2,4,2,2]]
输出：3
解释：存在三对相等行列对：
- (第 0 行，第 0 列)：[3,1,2,2]
- (第 2 行, 第 2 列)：[2,4,2,2]
- (第 3 行, 第 2 列)：[2,4,2,2]
```

**提示：**

*   `n == grid.length == grid[i].length`
*   `1 <= n <= 200`
*   1 <= grid[i][j] <= 10<sup>5</sup>


## Solution

Language: **C++**

```c++
class Solution {
public:
    int equalPairs(vector<vector<int>>& grid) {
        map<string, int> countRow;
        map<string, int> countCol;
        for (int i = 0;i < grid.size();i++) {
            string thisLine;
            for (int j = 0;j < grid[i].size();j++) {
                thisLine += (to_string(grid[i][j]) + ",");
            }
            countRow[thisLine]++;
        }
        int res = 0;
        for (int j = 0;j < grid[0].size(); j++) {
            string thisCol;
            for (int i = 0;i < grid.size();i++) {
                thisCol += (to_string(grid[i][j]) + ",");
            }
            if (countRow.find(thisCol) != countRow.end()) {
                res += countRow[thisCol];
            }
        }
        return res;
    }
};
```
