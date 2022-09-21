---
title: LeetCode 1026. 节点与其祖先之间的最大差值
date: 2022-09-21 17:09:43
tags:
 - 树
 - 深度优先搜索
 - 二叉树
categories: LeetCode
---

# [1026\. 节点与其祖先之间的最大差值](https://leetcode.cn/problems/maximum-difference-between-node-and-ancestor/)

## Description

Difficulty: **中等**  

Related Topics: [树](https://leetcode.cn/tag/tree/), [深度优先搜索](https://leetcode.cn/tag/depth-first-search/), [二叉树](https://leetcode.cn/tag/binary-tree/)


给定二叉树的根节点 `root`，找出存在于 **不同** 节点 `A` 和 `B` 之间的最大值 `V`，其中 `V = |A.val - B.val|`，且 `A` 是 `B` 的祖先。

（如果 A 的任何子节点之一为 B，或者 A 的任何子节点是 B 的祖先，那么我们认为 A 是 B 的祖先）

**示例 1：**

![tmp-tree](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220921/tmp-tree.3gcdxh464fe0.webp)

```
输入：root = [8,3,10,1,6,null,14,null,null,4,7,13]
输出：7
解释： 
我们有大量的节点与其祖先的差值，其中一些如下：
|8 - 3| = 5
|3 - 7| = 4
|8 - 1| = 7
|10 - 13| = 3
在所有可能的差值中，最大值 7 由 |8 - 1| = 7 得出。
```

**示例 2：**

![tmp-tree-1](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220921/tmp-tree-1.4mko5tws9ee0.webp)

```
输入：root = [1,null,2,null,0,3]
输出：3
```

**提示：**

*   树中的节点数在 `2` 到 `5000` 之间。
*   0 <= Node.val <= 10<sup>5</sup>


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
    int result = 0;

    pair<int,int> Traverse(TreeNode* root, int val) {
        if (root == nullptr) {
            return make_pair(val,val);
        }
        pair<int,int> leftVal = Traverse(root -> left,root -> val);
        pair<int,int> rightVal = Traverse(root -> right,root -> val);
        int minChild = min(leftVal.first, rightVal.second);
        int maxChild = max(leftVal.first, rightVal.second);
        result = max(result, abs(root -> val - minChild));
        result = max(result, abs(root -> val - maxChild));
        return make_pair(min(root -> val, minChild), max(root -> val, maxChild));
    }

    int maxAncestorDiff(TreeNode* root) {
        Traverse(root,root -> val);
        return result;
    }
};
```