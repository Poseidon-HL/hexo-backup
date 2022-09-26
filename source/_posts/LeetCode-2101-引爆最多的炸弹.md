---
title: LeetCode 2101. 引爆最多的炸弹
date: 2022-09-26 18:19:26
tags:
 - 深度优先搜索
 - 广度优先搜索
 - 图
 - 几何
 - 数组
 - 数学
categories: LeetCode
---

# [2101\. 引爆最多的炸弹](https://leetcode.cn/problems/detonate-the-maximum-bombs/)

## Description

Difficulty: **中等**  

Related Topics: [深度优先搜索](https://leetcode.cn/tag/depth-first-search/), [广度优先搜索](https://leetcode.cn/tag/breadth-first-search/), [图](https://leetcode.cn/tag/graph/), [几何](https://leetcode.cn/tag/geometry/), [数组](https://leetcode.cn/tag/array/), [数学](https://leetcode.cn/tag/math/)


给你一个炸弹列表。一个炸弹的 **爆炸范围** 定义为以炸弹为圆心的一个圆。

炸弹用一个下标从 **0** 开始的二维整数数组 `bombs` 表示，其中 bombs[i] = [x<sub>i</sub>, y<sub>i</sub>, r<sub>i</sub>] 。x<sub>i</sub> 和 y<sub>i</sub> 表示第 `i` 个炸弹的 X 和 Y 坐标，r<sub>i</sub> 表示爆炸范围的 **半径** 。

你需要选择引爆 **一个 **炸弹。当这个炸弹被引爆时，**所有** 在它爆炸范围内的炸弹都会被引爆，这些炸弹会进一步将它们爆炸范围内的其他炸弹引爆。

给你数组 `bombs` ，请你返回在引爆 **一个** 炸弹的前提下，**最多** 能引爆的炸弹数目。

**示例 1：**

![desmos-eg-3](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220926/desmos-eg-3.653ju7tzh1k0.webp)

```
输入：bombs = [[2,1,3],[6,1,4]]
输出：2
解释：
上图展示了 2 个炸弹的位置和爆炸范围。
如果我们引爆左边的炸弹，右边的炸弹不会被影响。
但如果我们引爆右边的炸弹，两个炸弹都会爆炸。
所以最多能引爆的炸弹数目是 max(1, 2) = 2 。
```

**示例 2：**

![desmos-eg-2](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220926/desmos-eg-2.4v2i0h4mig00.webp)

```
输入：bombs = [[1,1,5],[10,10,5]]
输出：1
解释：
引爆任意一个炸弹都不会引爆另一个炸弹。所以最多能引爆的炸弹数目为 1 。
```

**示例 3：**

![desmos-eg1](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220926/desmos-eg1.1c949dnsyds0.webp)

```
输入：bombs = [[1,2,3],[2,3,1],[3,4,2],[4,5,3],[5,6,4]]
输出：5
解释：
最佳引爆炸弹为炸弹 0 ，因为：
- 炸弹 0 引爆炸弹 1 和 2 。红色圆表示炸弹 0 的爆炸范围。
- 炸弹 2 引爆炸弹 3 。蓝色圆表示炸弹 2 的爆炸范围。
- 炸弹 3 引爆炸弹 4 。绿色圆表示炸弹 3 的爆炸范围。
所以总共有 5 个炸弹被引爆。
```

**提示：**

*   `1 <= bombs.length <= 100`
*   `bombs[i].length == 3`
*   1 <= x<sub>i</sub>, y<sub>i</sub>, r<sub>i</sub> <= 10<sup>5</sup>


## Solution

本题开始想使用并查集解决，但是经过几次debug发现使用并查集是存在问题的，求得的结果可能偏大，这一版本代码仍有优化的空间。

Language: **C++**

```c++
class Solution {
public:
    vector<int> father;

    int findFather(int i) {
        if (i == father[i]) {
            return i;
        }
        int f = findFather(father[i]);
        father[i] = f;
        return f;
    }

    void merge(int i, int j) {
        int Fi = findFather(i);
        int Fj = findFather(j);
        if (Fi != Fj) {
            father[Fi] = Fj;
        }
        return ;
    }

    bool isEffected(vector<int> x1, vector<int> x2) {
        // 圆心的距离不超过 r1 + r2
        double distance = sqrt(pow((x1[0] - x2[0]), 2) + pow((x1[1] - x2[1]), 2));
        // cout << "distance: " << distance << " x: " << x1[0] << " " << x2[0] << endl;
        return distance <= double(x1[2]);
    }

    int maximumDetonation(vector<vector<int>>& bombs) {
        // father = vector<int>(bombs.size());
        // for (int i = 0;i < father.size(); i++) {
        //     father[i] = i;
        // }
        map<int, vector<int>> boomed;
        for (int i = 0;i < bombs.size(); i++) {
            for (int j = i + 1; j < bombs.size() ;j++) {
                if (isEffected(bombs[i], bombs[j])) {
                    // cout << "merge: " << i << " " << j << endl;
                    // 从 i 引爆 j
                    // merge(i,j);
                    boomed[i].push_back(j);
                }
                if (isEffected(bombs[j], bombs[i])) {
                    // cout << "merge: " << i << " " << j << endl;
                    boomed[j].push_back(i);
                }
            }
        }
        int result = 0;
        map<int, int> saveRes;
        for (int i = 0;i < bombs.size();i++) {
            unordered_set<int> visited;
            queue<int> now;
            now.push(i);
            visited.insert(i);
            if (saveRes.find(i) != saveRes.end()) {
                result = max(result, int(saveRes[i]));
                continue;
            }
            while (now.size()) {
                for (int next : boomed[now.front()]) {
                    if (visited.find(next) == visited.end()) {
                        visited.insert(next);
                        now.push(next);
                    }
                }
                now.pop();
            }
            saveRes[i] = visited.size();
            result = max(result, int(visited.size()));
        }
        
        return result;
    }
};
```