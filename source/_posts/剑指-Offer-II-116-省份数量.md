---
title: 剑指 Offer II 116. 省份数量
date: 2022-09-15 13:48:28
tags: 
 - 深度优先搜索
 - 广度优先搜索
 - 并查集
 - 图
categories: 剑指 Offer II
---

# [剑指 Offer II 116\. 省份数量](https://leetcode.cn/problems/bLyHh0/)

## Description

Difficulty: **中等**  

Related Topics: [深度优先搜索](https://leetcode.cn/tag/depth-first-search/), [广度优先搜索](https://leetcode.cn/tag/breadth-first-search/), [并查集](https://leetcode.cn/tag/union-find/), [图](https://leetcode.cn/tag/graph/)


有 `n` 个城市，其中一些彼此相连，另一些没有相连。如果城市 `a` 与城市 `b` 直接相连，且城市 `b` 与城市 `c` 直接相连，那么城市 `a` 与城市 `c` 间接相连。

**省份** 是一组直接或间接相连的城市，组内不含其他没有相连的城市。

给你一个 `n x n` 的矩阵 `isConnected` ，其中 `isConnected[i][j] = 1` 表示第 `i` 个城市和第 `j` 个城市直接相连，而 `isConnected[i][j] = 0` 表示二者不直接相连。

返回矩阵中 **省份** 的数量。

**示例 1：**

![graph1](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220915/graph1.4bu3ninjlfw0.webp)

```
输入：isConnected = [[1,1,0],[1,1,0],[0,0,1]]
输出：2
```

**示例 2：**

![graph2](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220915/graph2.3wpzm942io40.webp)

```
输入：isConnected = [[1,0,0],[0,1,0],[0,0,1]]
输出：3
```

**提示：**

*   `1 <= n <= 200`
*   `n == isConnected.length`
*   `n == isConnected[i].length`
*   `isConnected[i][j]` 为 `1` 或 `0`
*   `isConnected[i][i] == 1`
*   `isConnected[i][j] == isConnected[j][i]`


注意：本题与主站 547 题相同： [https://leetcode-cn.com/problems/number-of-provinces/](https://leetcode-cn.com/problems/number-of-provinces/)


## Solution

Language: **C++**

```c++
class Solution {
public:
    vector<int> father;
    void initFather(int N) {
        for (int i = 0;i <= N; i++) {
            father.push_back(i);
        }
    }

    int findFather(int i) {
        if (i == father[i]) {
            return i;
        } else {
            int f = findFather(father[i]);
            father[i] = f;
            return f;
        }
    }

    void unionij(int i, int j) {
        int fi = findFather(i);
        int fj = findFather(j);
        if (fi != fj) {
            father[fi] = fj;
        }
    }

    int countFather() {
        int count = 0;
        for (int i = 1;i < father.size();i++) {
            if (father[i] == i) {
                count++;
            }
        }
        return count;
    }

    int findCircleNum(vector<vector<int>>& isConnected) {
        initFather(isConnected.size());
        for (int i = 0;i < isConnected.size();i++) {
            for (int j = 0;j < isConnected[i].size();j++) {
                if (isConnected[i][j] == 1) {
                    unionij(i + 1,j + 1);
                }
            }
        }
        return countFather();
    }
};
```