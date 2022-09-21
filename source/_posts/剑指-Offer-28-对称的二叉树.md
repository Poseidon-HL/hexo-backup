---
title: 剑指 Offer 28. 对称的二叉树
date: 2022-09-21 16:02:47
tags:
 - 树
 - 深度优先搜索
 - 广度优先搜索
 - 二叉树
categories: 剑指 Offer
---

# [剑指 Offer 28\. 对称的二叉树](https://leetcode.cn/problems/dui-cheng-de-er-cha-shu-lcof/)

## Description

Difficulty: **简单**  

Related Topics: [树](https://leetcode.cn/tag/tree/), [深度优先搜索](https://leetcode.cn/tag/depth-first-search/), [广度优先搜索](https://leetcode.cn/tag/breadth-first-search/), [二叉树](https://leetcode.cn/tag/binary-tree/)


请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和它的镜像一样，那么它是对称的。

例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

```    
    1  
   / \  
  2   2  
 / \ / \  
3  4 4  3
```  
但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

```
    1  
   / \  
  2   2  
   \   \  
   3    3
```

**示例 1：**

```
输入：root = [1,2,2,3,4,4,3]
输出：true
```

**示例 2：**

```
输入：root = [1,2,2,null,3,null,3]
输出：false
```

**限制：**

`0 <= 节点个数 <= 1000`

注意：本题与主站 101 题相同：[https://leetcode-cn.com/problems/symmetric-tree/](https://leetcode-cn.com/problems/symmetric-tree/)


## Solution

Language: **C++**

```c++
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:
    bool Judge(TreeNode* l, TreeNode* r) {
        if (l == NULL && r == NULL) {
            return true;
        }
        if ((l == NULL || r == NULL) || (l -> val != r -> val)) {
            return false;
        }
        return Judge(l -> left, r -> right) & Judge(l -> right, r -> left);
    }

    bool isSymmetric(TreeNode* root) {
        return root == NULL ? true: Judge(root -> left, root -> right);
    }
};
```