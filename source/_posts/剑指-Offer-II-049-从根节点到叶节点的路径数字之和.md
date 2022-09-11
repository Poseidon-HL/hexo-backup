---
title: 剑指 Offer II 049. 从根节点到叶节点的路径数字之和
date: 2022-09-11 18:02:44
tags: 
 - 树
 - 深度优先搜索
 - 二叉树
categories: 剑指 Offer II
---

# [剑指 Offer II 049\. 从根节点到叶节点的路径数字之和](https://leetcode.cn/problems/3Etpl5/)

## Description

Difficulty: **中等**  

Related Topics: [树](https://leetcode.cn/tag/tree/), [深度优先搜索](https://leetcode.cn/tag/depth-first-search/), [二叉树](https://leetcode.cn/tag/binary-tree/)


给定一个二叉树的根节点 `root` ，树中每个节点都存放有一个 `0` 到 `9` 之间的数字。


每条从根节点到叶节点的路径都代表一个数字：

*   例如，从根节点到叶节点的路径 `1 -> 2 -> 3` 表示数字 `123` 。

计算从根节点到叶节点生成的 **所有数字之和** 。

**叶节点** 是指没有子节点的节点。

**示例 1：**

![](https://assets.leetcode.com/uploads/2021/02/19/num1tree.jpg)

```
输入：root = [1,2,3]
输出：25
解释：
从根到叶子节点路径 1->2 代表数字 12
从根到叶子节点路径 1->3 代表数字 13
因此，数字总和 = 12 + 13 = 25
```

**示例 2：**

![](https://assets.leetcode.com/uploads/2021/02/19/num2tree.jpg)

```
输入：root = [4,9,0,5,1]
输出：1026
解释：
从根到叶子节点路径 4->9->5 代表数字 495
从根到叶子节点路径 4->9->1 代表数字 491
从根到叶子节点路径 4->0 代表数字 40
因此，数字总和 = 495 + 491 + 40 = 1026
```

**提示：**

*   树中节点的数目在范围 `[1, 1000]` 内
*   `0 <= Node.val <= 9`
*   树的深度不超过 `10`


注意：本题与主站 129 题相同： [https://leetcode-cn.com/problems/sum-root-to-leaf-numbers/](https://leetcode-cn.com/problems/sum-root-to-leaf-numbers/)


## Solution

Language: **C++**

```c++
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    int sum = 0;
    void DFS(TreeNode* root, int i) {
        if (root == nullptr) {
            return;
        }
        i = i * 10 + root -> val;
        if (root -> left == nullptr && root -> right == nullptr) {
            sum += i;
        }
        DFS(root -> left, i);
        DFS(root -> right, i);
    }

    int sumNumbers(TreeNode* root) {
        DFS(root,0);
        return sum;
    }
};
```