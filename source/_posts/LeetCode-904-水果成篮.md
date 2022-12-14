---
title: LeetCode 904. 水果成篮
date: 2022-09-29 20:28:56
tags:
 - 数组
 - 哈希表
 - 滑动窗口
categories: LeetCode
---

# [904\. 水果成篮](https://leetcode.cn/problems/fruit-into-baskets/)

## Description

Difficulty: **中等**  

Related Topics: [数组](https://leetcode.cn/tag/array/), [哈希表](https://leetcode.cn/tag/hash-table/), [滑动窗口](https://leetcode.cn/tag/sliding-window/)


你正在探访一家农场，农场从左到右种植了一排果树。这些树用一个整数数组 `fruits` 表示，其中 `fruits[i]` 是第 `i` 棵树上的水果 **种类** 。

你想要尽可能多地收集水果。然而，农场的主人设定了一些严格的规矩，你必须按照要求采摘水果：

*   你只有 **两个** 篮子，并且每个篮子只能装 **单一类型** 的水果。每个篮子能够装的水果总量没有限制。
*   你可以选择任意一棵树开始采摘，你必须从 **每棵** 树（包括开始采摘的树）上 **恰好摘一个水果** 。采摘的水果应当符合篮子中的水果类型。每采摘一次，你将会向右移动到下一棵树，并继续采摘。
*   一旦你走到某棵树前，但水果不符合篮子的水果类型，那么就必须停止采摘。

给你一个整数数组 `fruits` ，返回你可以收集的水果的 **最大** 数目。

**示例 1：**

```
输入：fruits = [1,2,1]
输出：3
解释：可以采摘全部 3 棵树。
```

**示例 2：**

```
输入：fruits = [0,1,2,2]
输出：3
解释：可以采摘 [1,2,2] 这三棵树。
如果从第一棵树开始采摘，则只能采摘 [0,1] 这两棵树。
```

**示例 3：**

```
输入：fruits = [1,2,3,2,2]
输出：4
解释：可以采摘 [2,3,2,2] 这四棵树。
如果从第一棵树开始采摘，则只能采摘 [1,2] 这两棵树。
```

**示例 4：**

```
输入：fruits = [3,3,3,1,2,1,1,2,3,3,4]
输出：5
解释：可以采摘 [1,2,1,1,2] 这五棵树。
```

**提示：**

*   1 <= fruits.length <= 10<sup>5</sup>
*   `0 <= fruits[i] < fruits.length`


## Solution

Language: **C++**

```c++
class Solution {
public:
    void printVector(vector<int>& tmp) {
        for (int i = 0;i < tmp.size(); i++) {
            cout << tmp[i] << " ";
        }
        cout << endl;
    }

    int totalFruit(vector<int>& fruits) {
        vector<int> count(fruits.size());
        count[0] = 1;
        int beforeNum = 1 , result = 0;
        for (int i = 1;i < fruits.size(); i++) {
            if (fruits[i] == fruits[i - 1]) {
                beforeNum++;
            } else {
                count[i] = beforeNum;
                beforeNum = 1;
            }
        }
        // printVector(count);
        deque<int> save;
        int idx = 0;
        int countNum = 0;
        while (idx < fruits.size()) {
            if (save.size() == 0) {
                save.push_back(fruits[idx]);
                idx++;
                countNum++;
            } else if (save.size() == 1) {
                if (fruits[idx] != save.front()) {
                    save.push_back(fruits[idx]);
                }
                idx++;
                countNum++;
            } else {
                if (fruits[idx] != save.front() && fruits[idx] != save.back()) {                if (save.front() != fruits[idx - 1]) {
                    save.pop_front();
                } else {
                    save.pop_back();
                }
                    // cout << "pop element" << " ";
                    save.push_back(fruits[idx]);
                    countNum = count[idx];
                }
                idx++;
                countNum++;
            }
            // cout << idx - 1 << " " << "countNum: " << countNum << endl;
            result = max(result, countNum);
        }

        return result;
    }
};
```