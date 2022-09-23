---
title: LeetCode 332. 重新安排行程
date: 2022-09-23 20:22:56
tags:
 - 深度优先搜索
 - 图
 - 欧拉回路
categories: LeetCode
---

# [332\. 重新安排行程](https://leetcode.cn/problems/reconstruct-itinerary/)

## Description

Difficulty: **困难**  

Related Topics: [深度优先搜索](https://leetcode.cn/tag/depth-first-search/), [图](https://leetcode.cn/tag/graph/), [欧拉回路](https://leetcode.cn/tag/eulerian-circuit/)


给你一份航线列表 `tickets` ，其中 tickets[i] = [from<sub>i</sub>, to<sub>i</sub>] 表示飞机出发和降落的机场地点。请你对该行程进行重新规划排序。

所有这些机票都属于一个从 `JFK`（肯尼迪国际机场）出发的先生，所以该行程必须从 `JFK` 开始。如果存在多种有效的行程，请你按字典排序返回最小的行程组合。

*   例如，行程 `["JFK", "LGA"]` 与 `["JFK", "LGB"]` 相比就更小，排序更靠前。

假定所有机票至少存在一种合理的行程。且所有的机票 必须都用一次 且 只能用一次。

**示例 1：**

![itinerary1-graph](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220923/itinerary1-graph.32anpdd0b90.webp)

```
输入：tickets = [["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]]
输出：["JFK","MUC","LHR","SFO","SJC"]
```

**示例 2：**

![itinerary2-graph](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220923/itinerary2-graph.1akgq0m1igcg.webp)

```
输入：tickets = [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
输出：["JFK","ATL","JFK","SFO","ATL","SFO"]
解释：另一种有效的行程是 ["JFK","SFO","ATL","JFK","ATL","SFO"] ，但是它字典排序更大更靠后。
```

**提示：**

*   `1 <= tickets.length <= 300`
*   `tickets[i].length == 2`
*   from<sub>i</sub>.length == 3
*   to<sub>i</sub>.length == 3
*   from<sub>i</sub> 和 to<sub>i</sub> 由大写英文字母组成
*   from<sub>i</sub> != to<sub>i</sub>


## Solution

Language: **C++**

```c++
class Solution {
public:
    map<string,vector<string>> Edges;
    map<string,pair<int,int>> Degrees; // 出度 入度
    vector<string> res;

    void DFS(string start) {
        while (Edges[start].size() > 0) {
            string ele = Edges[start][Edges[start].size() - 1];
            Edges[start].pop_back();
            DFS(ele);
            res.push_back(ele);
        }
    }

    static bool cmp(string a, string b) {
        return a > b;
    }

    vector<string> findItinerary(vector<vector<string>>& tickets) {
        for (int i = 0;i < tickets.size();i++) {
            if (Degrees.find(tickets[i][0]) == Degrees.end()) {
                Degrees[tickets[i][0]] = make_pair(0,0);
            }
            if (Degrees.find(tickets[i][1]) == Degrees.end()) {
                Degrees[tickets[i][1]] = make_pair(0,0);
            }
            Degrees[tickets[i][0]].first++;
            Degrees[tickets[i][1]].second++;
            Edges[tickets[i][0]].push_back(tickets[i][1]);
        }
        
        for (auto it = Edges.begin(); it != Edges.end(); it++) {
            sort((it -> second).begin(), (it -> second).end(), cmp);
        }
        
        DFS("JFK");
        res.push_back("JFK");
        reverse(res.begin(), res.end());
        return res; 
    }
};
```