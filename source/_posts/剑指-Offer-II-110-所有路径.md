---
title: 剑指 Offer II 110. 所有路径
date: 2022-09-15 14:51:16
tags:
 - 深度优先搜索
 - 广度优先搜索
 - 回溯
categories: 剑指 Offer II

---

# [剑指 Offer II 110\. 所有路径](https://leetcode.cn/problems/bP4bmD/)

## Description

Difficulty: **中等**  

Related Topics: [深度优先搜索](https://leetcode.cn/tag/depth-first-search/), [广度优先搜索](https://leetcode.cn/tag/breadth-first-search/), [图](https://leetcode.cn/tag/graph/), [回溯](https://leetcode.cn/tag/backtracking/)


给定一个有 `n` 个节点的有向无环图，用二维数组 `graph` 表示，请找到所有从 `0` 到 `n-1` 的路径并输出（不要求按顺序）。

`graph` 的第 `i` 个数组中的单元都表示有向图中 `i` 号节点所能到达的下一些结点（译者注：有向图是有方向的，即规定了 a→b 你就不能从 b→a ），若为空，就是没有下一个节点了。

**示例 1：**

![all_1](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220915/all_1.5xiwjx00sus0.webp)

```
输入：graph = [[1,2],[3],[3],[]]
输出：[[0,1,3],[0,2,3]]
解释：有两条路径 0 -> 1 -> 3 和 0 -> 2 -> 3
```

**示例 2：**

![all_2](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220915/all_2.7a34rwz7nh80.webp)

```
输入：graph = [[4,3,1],[3,2,4],[3],[4],[]]
输出：[[0,4],[0,3,4],[0,1,3,4],[0,1,2,3,4],[0,1,4]]
```

**示例 3：**

```
输入：graph = [[1],[]]
输出：[[0,1]]
```

**示例 4：**

```
输入：graph = [[1,2,3],[2],[3],[]]
输出：[[0,1,2,3],[0,2,3],[0,3]]
```

**示例 5：**

```
输入：graph = [[1,3],[2],[3],[]]
输出：[[0,1,2,3],[0,3]]
```

**提示：**

*   `n == graph.length`
*   `2 <= n <= 15`
*   `0 <= graph[i][j] < n`
*   `graph[i][j] != i` 
*   保证输入为有向无环图 `(GAD)`

注意：本题与主站 797 题相同：[https://leetcode-cn.com/problems/all-paths-from-source-to-target/](https://leetcode-cn.com/problems/all-paths-from-source-to-target/)


## Solution

Language: **C++**

```c++
class Solution {
public:
    set<int> visited;
    int n;
    vector<vector<int>> res;
    vector<vector<int>> graphS;
    void DFS(vector<int>& path,int num) {
        path.push_back(num);
        visited.insert(num);
        if (num == n) {
            res.push_back(path);
        } else {
            for (int i = 0;i < graphS[num].size();i++) {
                DFS(path,graphS[num][i]);
            }
        }
        visited.erase(num);
        path.pop_back();
    }
    vector<vector<int>> allPathsSourceTarget(vector<vector<int>>& graph) {
        n = graph.size() - 1;
        graphS = graph;
        vector<int> path;
        DFS(path,0);
        return res;
    }
};
```