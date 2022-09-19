---
title: 剑指 Offer II 050. 向下的路径节点之和
date: 2022-09-13 13:40:00
tags: 
 - 树
 - 深度优先搜索
 - 二叉树
categories: 剑指 Offer II
---

# [剑指 Offer II 050\. 向下的路径节点之和](https://leetcode.cn/problems/6eUYwP/)

## Description

Difficulty: **中等**  

Related Topics: [树](https://leetcode.cn/tag/tree/), [深度优先搜索](https://leetcode.cn/tag/depth-first-search/), [二叉树](https://leetcode.cn/tag/binary-tree/)


给定一个二叉树的根节点 `root` ，和一个整数 `targetSum` ，求该二叉树里节点值之和等于 `targetSum` 的 **路径** 的数目。

**路径** 不需要从根节点开始，也不需要在叶子节点结束，但是路径方向必须是向下的（只能从父节点到子节点）。

**示例 1：**

![](https://assets.leetcode.com/uploads/2021/04/09/pathsum3-1-tree.jpg)

```
输入：root = [10,5,-3,3,2,null,11,3,-2,null,1], targetSum = 8
输出：3
解释：和等于 8 的路径有 3 条，如图所示。
```

**示例 2：**

```
输入：root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
输出：3
```

**提示:**

*   二叉树的节点个数的范围是 `[0,1000]`
*   -10<sup><span style="font-size: 9.449999809265137px;">9</span></sup> <= Node.val <= 10<sup><span style="font-size: 9.449999809265137px;">9</span></sup> 
*   `-1000 <= targetSum <= 1000` 

注意：本题与主站 437 题相同：[https://leetcode-cn.com/problems/path-sum-iii/](https://leetcode-cn.com/problems/path-sum-iii/)


## Solution

Language: **C++**

```c++
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
    int count = 0;
    long long target = target;
    vector<long long> DFS(TreeNode* root) {
        vector<long long> res;
        if (root == nullptr) {
            return res;
        }
        vector<long long> leftRes = DFS(root -> left);
        vector<long long> rightRes = DFS(root -> right);
        for (int i = 0;i < leftRes.size();i++) {
            if (leftRes[i] + root -> val == target) {
                count++;
            }
            res.push_back(leftRes[i] + root -> val);
        }
        for (int i = 0;i < rightRes.size();i++) {
            if (rightRes[i] + root -> val == target) {
                count++;
            }
            res.push_back(rightRes[i] + root -> val);
```