---
title: 剑指 Offer II 046. 二叉树的右侧视图
date: 2022-09-13 13:48:48
tags:
 - 树
 - 深度优先搜索
 - 广度优先搜索
 - 二叉树
categories: 剑指 Offer II
---

# [剑指 Offer II 046\. 二叉树的右侧视图](https://leetcode.cn/problems/WNC0Lk/)

## Description

Difficulty: **中等**  

Related Topics: [树](https://leetcode.cn/tag/tree/), [深度优先搜索](https://leetcode.cn/tag/depth-first-search/), [广度优先搜索](https://leetcode.cn/tag/breadth-first-search/), [二叉树](https://leetcode.cn/tag/binary-tree/)


给定一个二叉树的 **根节点** `root`，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。

**示例 1:**

![](https://assets.leetcode.com/uploads/2021/02/14/tree.jpg)

```
输入: [1,2,3,null,5,null,4]
输出: [1,3,4]
```

**示例 2:**

```
输入: [1,null,3]
输出: [1,3]
```

**示例 3:**

```
输入: []
输出: []
```

**提示:**

*   二叉树的节点个数的范围是 `[0,100]`
*   `-100 <= Node.val <= 100` 

注意：本题与主站 199 题相同：[https://leetcode-cn.com/problems/binary-tree-right-side-view/](https://leetcode-cn.com/problems/binary-tree-right-side-view/)


## Solution

Language: **C++**

```c++
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    // 层序遍历 用队列
    vector<int> res;
    vector<int> rightSideView(TreeNode* root) {
        queue<TreeNode*> tmp;
        tmp.push(root);
        while (tmp.size() != 0 && root != nullptr) {
            int num = tmp.size();
            while (num) {
                TreeNode* topEle = tmp.front();
                tmp.pop();
                if (num == 1) {
                    res.push_back(topEle -> val);
                }
                if (topEle -> left != nullptr) {
                    tmp.push(topEle -> left);
                }
                if (topEle -> right != nullptr) {
                    tmp.push(topEle -> right);
                }
                num--;
            }
        }
        
        return res;
    }
};
```