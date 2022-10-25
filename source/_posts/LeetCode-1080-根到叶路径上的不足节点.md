---
title: LeetCode 1080. 根到叶路径上的不足节点
date: 2022-10-25 15:50:26
tags:
 - 树
 - 深度优先搜索
 - 二叉树
categories: LeetCode
---

# [1080\. 根到叶路径上的不足节点](https://leetcode.cn/problems/insufficient-nodes-in-root-to-leaf-paths/)

## Description

Difficulty: **中等**  

Related Topics: [树](https://leetcode.cn/tag/tree/), [深度优先搜索](https://leetcode.cn/tag/depth-first-search/), [二叉树](https://leetcode.cn/tag/binary-tree/)


给定一棵二叉树的根 `root`，请你考虑它所有 **从根到叶的路径**：从根到任何叶的路径。（所谓一个叶子节点，就是一个没有子节点的节点）

假如通过节点 `node` 的每种可能的 “根-叶” 路径上值的总和全都小于给定的 `limit`，则该节点被称之为「不足节点」，需要被删除。

请你删除所有不足节点，并返回生成的二叉树的根。

**示例 1：**

![insufficient-1](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20221025/insufficient-1.efewl4g6kyo.webp)

![insufficient-2](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20221025/insufficient-2.y2ac3txbtwg.webp)
```
输入：root = [1,2,3,4,-99,-99,7,8,9,-99,-99,12,13,-99,14], limit = 1

输出：[1,2,3,4,null,null,7,8,9,null,14]
```

**示例 2：**
![insufficient-3](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20221025/insufficient-3.4ee2ep0dy5u0.webp)
![insufficient-4](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20221025/insufficient-4.35j26584uyu0.webp)
```
输入：root = [5,4,8,11,null,17,4,7,1,null,null,5,3], limit = 22

输出：[5,4,8,11,null,17,4,7,null,null,null,5]
```

**示例 3：**

```
输入：root = [5,-6,-6], limit = 0
输出：[]
```

**提示：**

1.  给定的树有 `1` 到 `5000` 个节点
2.  `-10^5 <= node.val <= 10^5`
3.  `-10^9 <= limit <= 10^9`


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
    int L;

    bool Traverse(TreeNode* root, int sum) {
        if (root == nullptr) {
            return true;
        }
        sum += root -> val;
        if (root -> left == nullptr && root -> right == nullptr) {
            if (sum < L) {
                return true;
            }
            return false;
        }
        bool LRes = Traverse(root -> left, sum), RRes = Traverse(root -> right, sum);

        root -> left = LRes ? nullptr: root -> left;
        root -> right = RRes ? nullptr: root -> right;

        return LRes && RRes;
    }

    TreeNode* sufficientSubset(TreeNode* root, int limit) {
        L = limit;
        return Traverse(root,0) ? nullptr : root;
    }
};
```