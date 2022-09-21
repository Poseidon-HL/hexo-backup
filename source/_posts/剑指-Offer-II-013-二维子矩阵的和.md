---
title: 剑指 Offer II 013. 二维子矩阵的和
date: 2022-09-21 13:15:09
tags:
 - 设计
 - 数组
 - 矩阵
 - 前缀和
categories: 剑指 Offer II
---

# [剑指 Offer II 013\. 二维子矩阵的和](https://leetcode.cn/problems/O4NDxx/)

## Description

Difficulty: **中等**  

Related Topics: [设计](https://leetcode.cn/tag/design/), [数组](https://leetcode.cn/tag/array/), [矩阵](https://leetcode.cn/tag/matrix/), [前缀和](https://leetcode.cn/tag/prefix-sum/)


<big><small>给定一个二维矩阵 `matrix`，</small></big>以下类型的多个请求：

*   <big><small>计算其子矩形范围内元素的总和，该子矩阵的左上角为 `(row1, col1)` ，右下角为 `(row2, col2)` 。</small></big>

实现 `NumMatrix` 类：

*   `NumMatrix(int[][] matrix)` 给定整数矩阵 `matrix` 进行初始化
*   `int sumRegion(int row1, int col1, int row2, int col2)` 返回<big><small>左上角</small></big><big> <small>`(row1, col1)` 、右下角 `(row2, col2)`</small></big> 的子矩阵的元素总和。

**示例 1：**

![1626332422-wUpUHT-image](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220921/1626332422-wUpUHT-image.y1zp8o1cbao.webp)

```
输入: 
["NumMatrix","sumRegion","sumRegion","sumRegion"]
[[[[3,0,1,4,2],[5,6,3,2,1],[1,2,0,1,5],[4,1,0,1,7],[1,0,3,0,5]]],[2,1,4,3],[1,1,2,2],[1,2,2,4]]
输出: 
[null, 8, 11, 12]

解释:
NumMatrix numMatrix = new NumMatrix([[3,0,1,4,2],[5,6,3,2,1],[1,2,0,1,5],[4,1,0,1,7],[1,0,3,0,5]]]);
numMatrix.sumRegion(2, 1, 4, 3); // return 8 (红色矩形框的元素总和)
numMatrix.sumRegion(1, 1, 2, 2); // return 11 (绿色矩形框的元素总和)
numMatrix.sumRegion(1, 2, 2, 4); // return 12 (蓝色矩形框的元素总和)
```

**提示：**

*   `m == matrix.length`
*   `n == matrix[i].length`
*   `1 <= m, n <= 200`
*   -10<sup>5</sup> <= matrix[i][j] <= 10<sup>5</sup>
*   `0 <= row1 <= row2 < m`
*   `0 <= col1 <= col2 < n`
*   最多调用 10<sup>4</sup> 次 `sumRegion` 方法

注意：本题与主站 304 题相同： [https://leetcode-cn.com/problems/range-sum-query-2d-immutable/](https://leetcode-cn.com/problems/range-sum-query-2d-immutable/)


## Solution

Language: **C++**

```c++
class NumMatrix {
public:
    vector<vector<int>> Matrix;
    int getSum(int row1, int col1) {
        if (row1 >= 0 && col1 >= 0) {
            return Matrix[row1][col1];
        }
        return 0;
    }
    NumMatrix(vector<vector<int>>& matrix) {
        Matrix = matrix;
        for (int i = 0;i < Matrix.size();i++) {
            for (int j = 1;j < Matrix[i].size();j++) {
                Matrix[i][j] += Matrix[i][j - 1];
            }
        }
        for (int j = 0;j < Matrix[0].size();j++) {
            for (int i = 1;i < Matrix.size();i++) {
                Matrix[i][j] += Matrix[i - 1][j];
            }
        }
    }
    
    int sumRegion(int row1, int col1, int row2, int col2) {
        return (getSum(row2,col2) - getSum(row2,col1 - 1) - getSum(row1 - 1,col2) + getSum(row1 - 1,col1 - 1));
    }
};

/**
 * Your NumMatrix object will be instantiated and called as such:
 * NumMatrix* obj = new NumMatrix(matrix);
 * int param_1 = obj->sumRegion(row1,col1,row2,col2);
 */
```