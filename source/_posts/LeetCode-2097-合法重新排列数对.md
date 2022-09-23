---
title: LeetCode 2097. 合法重新排列数对
date: 2022-09-23 19:16:58
tags:
 - 深度优先搜索
 - 图
 - 欧拉回路
categories: LeetCode
---

# [2097\. 合法重新排列数对](https://leetcode.cn/problems/valid-arrangement-of-pairs/)

## Description

Difficulty: **困难**  

Related Topics: [深度优先搜索](https://leetcode.cn/tag/depth-first-search/), [图](https://leetcode.cn/tag/graph/), [欧拉回路](https://leetcode.cn/tag/eulerian-circuit/)


给你一个下标从 **0** 开始的二维整数数组 `pairs` ，其中 pairs[i] = [start<sub>i</sub>, end<sub>i</sub>] 。如果 `pairs` 的一个重新排列，满足对每一个下标 `i` （ `1 <= i < pairs.length` ）都有 end<sub>i-1</sub> == start<sub>i</sub>，那么我们就认为这个重新排列是 `pairs` 的一个 **合法重新排列** 。

请你返回 **任意一个** `pairs` 的合法重新排列。

**注意：**数据保证至少存在一个 `pairs` 的合法重新排列。

**示例 1：**

```
输入：pairs = [[5,1],[4,5],[11,9],[9,4]]
输出：[[11,9],[9,4],[4,5],[5,1]]
解释：
输出的是一个合法重新排列，因为每一个 endi-1 都等于 starti 。
end0 = 9 == 9 = start1 
end1 = 4 == 4 = start2
end2 = 5 == 5 = start3
```

**示例 2：**

```
输入：pairs = [[1,3],[3,2],[2,1]]
输出：[[1,3],[3,2],[2,1]]
解释：
输出的是一个合法重新排列，因为每一个 endi-1 都等于 starti 。
end0 = 3 == 3 = start1
end1 = 2 == 2 = start2
重新排列后的数组 [[2,1],[1,3],[3,2]] 和 [[3,2],[2,1],[1,3]] 都是合法的。
```

**示例 3：**

```
输入：pairs = [[1,2],[1,3],[2,1]]
输出：[[1,2],[2,1],[1,3]]
解释：
输出的是一个合法重新排列，因为每一个 endi-1 都等于 starti 。
end0 = 2 == 2 = start1
end1 = 1 == 1 = start2
```

**提示：**

*   1 <= pairs.length <= 10<sup>5</sup>
*   `pairs[i].length == 2
*   0 <= start<sub>i</sub>, end<sub>i</sub> <= 10<sup>9</sup>
*   start<sub>i</sub> != end<sub>i</sub>
*   pairs` 中不存在一模一样的数对。
*   至少 **存在** 一个合法的 `pairs` 重新排列。


## Solution

Language: **C++**

```c++
class Solution {
public:
    map<int,pair<int,int>> Degrees; // 出度 入度
    map<int,queue<int>> outEdges; // 出边 入边
    vector<vector<int>> result;
    void DFS(int node) {
        while (outEdges[node].size()) {
            vector<int> path;
            int front = outEdges[node].front();
            outEdges[node].pop();
            DFS(front);
            path.push_back(node);
            path.push_back(front);
            result.push_back(path);
            
        }
    }
    vector<vector<int>> validArrangement(vector<vector<int>>& pairs) {     
        for (int i = 0;i < pairs.size();i++) {
            if (Degrees.find(pairs[i][0]) == Degrees.end()) {
                Degrees[pairs[i][0]] = make_pair(0,0);
            }
            if (Degrees.find(pairs[i][1]) == Degrees.end()) {
                Degrees[pairs[i][1]] = make_pair(0,0);
            }
            Degrees[pairs[i][0]].first++;
            Degrees[pairs[i][1]].second++;
            outEdges[pairs[i][0]].push(pairs[i][1]);
        } 
        int begin = pairs[0][0];
        for (auto it = Degrees.begin(); it != Degrees.end(); it++) {
            if ((it -> second).first > (it -> second).second) {
                begin = it -> first;
            }
        }
        DFS(begin);
        reverse(result.begin(), result.end());
        return result;
    }
};
```