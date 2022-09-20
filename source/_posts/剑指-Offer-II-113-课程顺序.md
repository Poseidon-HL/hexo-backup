---
title: 剑指 Offer II 113. 课程顺序
date: 2022-09-15 21:04:30
tags:
 - 深度优先搜索
 - 广度优先搜索
 - 图
 - 拓扑排序
categories: 剑指 Offer II
---

# [剑指 Offer II 113\. 课程顺序](https://leetcode.cn/problems/QA2IGt/)

## Description

Difficulty: **中等**  

Related Topics: [深度优先搜索](https://leetcode.cn/tag/depth-first-search/), [广度优先搜索](https://leetcode.cn/tag/breadth-first-search/), [图](https://leetcode.cn/tag/graph/), [拓扑排序](https://leetcode.cn/tag/topological-sort/)


现在总共有 `numCourses` 门课需要选，记为 `0` 到 `numCourses-1`。

给定一个数组 `prerequisites` ，它的每一个元素 `prerequisites[i]` 表示两门课程之间的先修顺序。 例如 prerequisites[i] = [a<sub>i</sub>, b<sub>i</sub>] 表示想要学习课程 a<sub>i</sub> ，需要先完成课程 b<sub>i</sub> 。

请根据给出的总课程数  `numCourses` 和表示先修顺序的 `prerequisites` 得出一个可行的修课序列。

可能会有多个正确的顺序，只要任意返回一种就可以了。如果不可能完成所有课程，返回一个空数组。

**示例 1:**

```
输入: numCourses = 2, prerequisites = [[1,0]] 
输出: [0,1]
解释: 总共有 2 门课程。要学习课程 1，你需要先完成课程 0。因此，正确的课程顺序为 [0,1] 。
```

**示例 2:**

```
输入: numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]
输出: [0,1,2,3] or [0,2,1,3]
解释: 总共有 4 门课程。要学习课程 3，你应该先完成课程 1 和课程 2。并且课程 1 和课程 2 都应该排在课程 0 之后。
 因此，一个正确的课程顺序是 [0,1,2,3] 。另一个正确的排序是 [0,2,1,3] 。
```

**示例 3:**

```
输入: numCourses = 1, prerequisites = [] 
输出: [0]
解释: 总共 1 门课，直接修第一门课就可。
```

**提示:**

*   `1 <= numCourses <= 2000`
*   `0 <= prerequisites.length <= numCourses * (numCourses - 1)`
*   `prerequisites[i].length == 2`
*   `0 <= ai, bi < numCourses`
*   `ai != bi`
*   `prerequisites` 中不存在重复元素

注意：本题与主站 210 题相同：[https://leetcode-cn.com/problems/course-schedule-ii/](https://leetcode-cn.com/problems/course-schedule-ii/)


## Solution

Language: **C++**

```c++
class Solution {
public:
    vector<int> degree;
    vector<int> res;
    vector<vector<int>> graph;
    vector<int> findOrder(int numCourses, vector<vector<int>>& prerequisites) {
        degree = vector<int> (numCourses);
        graph = vector<vector<int>> (numCourses);
        for (int i = 0;i < prerequisites.size();i++) {
            degree[prerequisites[i][0]]++;
            graph[prerequisites[i][1]].push_back(prerequisites[i][0]);
        }
        queue<int> now;
        for (int i = 0;i < degree.size();i++) {
            if (degree[i] == 0) {
                now.push(i);
            }
        }
        while (now.size() != 0) {
            int ele = now.front();
            now.pop();
            res.push_back(ele);
            for (int i = 0;i < graph[ele].size(); i++) {
                degree[graph[ele][i]]--;
                if (degree[graph[ele][i]] == 0) {
                    now.push(graph[ele][i]);
                }
            }
        }
        for (int i = 0;i < degree.size();i++) {
            if (degree[i] != 0) {
                return vector<int>(0);
            }
        }
        return res;
    }
};
```