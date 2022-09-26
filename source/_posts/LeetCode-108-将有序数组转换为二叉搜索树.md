---
title: LeetCode 108. 将有序数组转换为二叉搜索树
date: 2022-09-26 16:00:46
tags:
 - 树
 - 二叉搜索树
 - 数组
 - 分治
 - 二叉树
categories: LeetCode
---

# [108\. 将有序数组转换为二叉搜索树](https://leetcode.cn/problems/convert-sorted-array-to-binary-search-tree/)

## Description

Difficulty: **简单**  

Related Topics: [树](https://leetcode.cn/tag/tree/), [二叉搜索树](https://leetcode.cn/tag/binary-search-tree/), [数组](https://leetcode.cn/tag/array/), [分治](https://leetcode.cn/tag/divide-and-conquer/), [二叉树](https://leetcode.cn/tag/binary-tree/)


给你一个整数数组 `nums` ，其中元素已经按 **升序** 排列，请你将其转换为一棵 **高度平衡** 二叉搜索树。

**高度平衡** 二叉树是一棵满足「每个节点的左右两个子树的高度差的绝对值不超过 1 」的二叉树。

**示例 1：**

![btree1](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220926/btree1.76uuhabd58w0.webp)

```
输入：nums = [-10,-3,0,5,9]
输出：[0,-3,9,-10,null,5]
解释：[0,-10,5,null,-3,null,9] 也将被视为正确答案：

```

**示例 2：**

![btree](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220926/btree.20ddgmf3vbpc.webp)

```
输入：nums = [1,3]
输出：[3,1]
解释：[1,null,3] 和 [3,1] 都是高度平衡二叉搜索树。
```

**提示：**

*   1 <= nums.length <= 10<sup>4</sup>
*   -10<sup>4</sup> <= nums[i] <= 10<sup>4</sup>
*   `nums` 按 **严格递增** 顺序排列


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
    TreeNode* BuildTree(vector<int> nums) {
        if (nums.size() == 0) {
            return nullptr;
        }
        TreeNode* root = new TreeNode(nums[nums.size() / 2]);
        int count = nums.size() % 2 == 0? 0:1;
        vector<int> left(nums.begin(),nums.end() - nums.size() / 2 - count);
        vector<int> right(nums.begin() + nums.size() / 2 + 1, nums.end());
        root -> left = BuildTree(left);
        root -> right = BuildTree(right);
        return root;
    }
    TreeNode* sortedArrayToBST(vector<int>& nums) {
        return BuildTree(nums);
    }
};
```