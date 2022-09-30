---
title: LeetCode 863. 二叉树中所有距离为 K 的结点
date: 2022-09-30 16:52:21
tags:
 - 树
 - 深度优先搜索
 - 广度优先搜索
 - 二叉树
categories: LeetCode
---

# [863\. 二叉树中所有距离为 K 的结点](https://leetcode.cn/problems/all-nodes-distance-k-in-binary-tree/)

## Description

Difficulty: **中等**  

Related Topics: [树](https://leetcode.cn/tag/tree/), [深度优先搜索](https://leetcode.cn/tag/depth-first-search/), [广度优先搜索](https://leetcode.cn/tag/breadth-first-search/), [二叉树](https://leetcode.cn/tag/binary-tree/)


给定一个二叉树（具有根结点 `root`）， 一个目标结点 `target` ，和一个整数值 `k` 。

返回到目标结点 `target` 距离为 `k` 的所有结点的值的列表。 答案可以以 **任何顺序** 返回。

**示例 1：**

![sketch0](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220930/sketch0.45pxp127u7c0.webp)
```
输入：root = [3,5,1,6,2,0,8,null,null,7,4], target = 5, k = 2
输出：[7,4,1]
解释：所求结点为与目标结点（值为 5）距离为 2 的结点，值分别为 7，4，以及 1
```

**示例 2:**

```
输入: root = [1], target = 1, k = 3
输出: []
```

**提示:**

*   节点数在 `[1, 500]` 范围内
*   `0 <= Node.val <= 500`
*   `Node.val` 中所有值 **不同**
*   目标结点 `target` 是树上的结点。
*   `0 <= k <= 1000`


## Solution

Language: **C++**

```c++
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:
    int targetVal;
    vector<TreeNode*> srcNode;
    set<int> visited;
    vector<int> res;
    bool findParent(TreeNode* root) {
        if (root == NULL) {
            return false;
        }
        if (root -> val == targetVal) {
            srcNode.push_back(root);
            visited.insert(root -> val);
            return true;
        }
        if (findParent(root -> left) || findParent(root -> right)) {
            srcNode.push_back(root);
            visited.insert(root -> val);
            return true;
        }
        return false;
    }

    bool isSubTree(TreeNode* root) {
        return (root == NULL || visited.find(root -> val) != visited.end()); 
    }

    void findDistance(TreeNode* root, int distance) {
        if (root == NULL) {
            return ;
        }
        if (distance == 0) {
            res.push_back(root -> val);
            return ;
        }
        if (!isSubTree(root -> left)) {
            findDistance(root -> left, distance - 1);
        }
        if (!isSubTree(root -> right)) {
            findDistance(root -> right, distance - 1);
        }
        return ;
    }

    vector<int> distanceK(TreeNode* root, TreeNode* target, int k) {
        targetVal = target -> val;
        findParent(root);
        for (int i = 0;i < srcNode.size(); i++) {
            findDistance(srcNode[i], k - i);
        }
        return res;
    }
};
```