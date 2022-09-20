---
title: 剑指 Offer II 045. 二叉树最底层最左边的值
date: 2022-09-16 12:09:52
tags:
 - 树
 - 深度优先搜索
 - 广度优先搜索
 - 二叉树
categories: 剑指 Offer II
---

# [剑指 Offer II 045\. 二叉树最底层最左边的值](https://leetcode.cn/problems/LwUNpT/)

## Description

Difficulty: **中等**  

Related Topics: [树](https://leetcode.cn/tag/tree/), [深度优先搜索](https://leetcode.cn/tag/depth-first-search/), [广度优先搜索](https://leetcode.cn/tag/breadth-first-search/), [二叉树](https://leetcode.cn/tag/binary-tree/)


给定一个二叉树的 **根节点** `root`，请找出该二叉树的 **最底层 最左边 **节点的值。

假设二叉树中至少有一个节点。

**示例 1:**

![tree1](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220916/tree1.2pjca8hlfoa0.webp)

```
输入: root = [2,1,3]
输出: 1
```

**示例 2:**

![tree2](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220916/tree2.tb23ekbs3hs.webp)

```
输入: [1,2,3,4,null,5,6,null,null,7]
输出: 7
```

**提示:**

*   二叉树的节点个数的范围是 [1,10<sup>4</sup>]
*   -2<sup>31</sup> <= Node.val <= 2<sup>31</sup> - 1 

注意：本题与主站 513 题相同： [https://leetcode-cn.com/problems/find-bottom-left-tree-value/](https://leetcode-cn.com/problems/find-bottom-left-tree-value/)


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
    void Traverse(TreeNode* root,int level,int &maxlevel,int &finalData)
    {
        if(root == NULL)
            return ;
        if(level > maxlevel)
        {
            finalData = root -> val;
            maxlevel = level;
        }
        Traverse(root -> left,level + 1,maxlevel,finalData);
        Traverse(root -> right,level + 1,maxlevel,finalData);
        return ;
    }

    int findBottomLeftValue(TreeNode* root) {
        if(root == NULL)
            return 0;
        int finalData = root -> val;
        int maxlevel = 0;
        Traverse(root,0,maxlevel,finalData);
        return finalData;
    }
};
```