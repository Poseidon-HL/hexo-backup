---
title: 剑指 Offer II 054. 所有大于等于节点的值之和
date: 2022-09-11 19:03:43
tags: 
 - 树
 - 深度优先搜索
 - 二叉搜索树
 - 二叉树
categories: 剑指 Offer II
---

# [剑指 Offer II 054\. 所有大于等于节点的值之和](https://leetcode.cn/problems/w6cpku/)

## Description

Difficulty: **中等**  

Related Topics: [树](https://leetcode.cn/tag/tree/), [深度优先搜索](https://leetcode.cn/tag/depth-first-search/), [二叉搜索树](https://leetcode.cn/tag/binary-search-tree/), [二叉树](https://leetcode.cn/tag/binary-tree/)


<span style="font-size:10.5pt"><span style="font-family:Calibri"><span style="font-size:10.5000pt"><span style="font-family:宋体"><font face="宋体">给定一个二叉搜索树，请将它的每个</font></span></span></span></span>节点<span style="font-size:10.5pt"><span style="font-family:Calibri"><span style="font-size:10.5000pt"><span style="font-family:宋体"><font face="宋体">的值替换成树中大于或者等于该</font></span></span></span></span>节点<span style="font-size:10.5pt"><span style="font-family:Calibri"><span style="font-size:10.5000pt"><span style="font-family:宋体"><font face="宋体">值的所有</font></span></span></span></span>节点<span style="font-size:10.5pt"><span style="font-family:Calibri"><span style="font-size:10.5000pt"><span style="font-family:宋体"><font face="宋体">值之和。</font></span></span></span></span>

提醒一下，二叉搜索树满足下列约束条件：

*   节点的左子树仅包含键 **小于** 节点键的节点。
*   节点的右子树仅包含键 **大于** 节点键的节点。
*   左右子树也必须是二叉搜索树。

**示例 1：**

**![tree](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220919/tree.4bfq4k2urb40.webp)**

```
输入：root = [4,1,6,0,2,5,7,null,null,null,3,null,null,null,8]
输出：[30,36,21,36,35,26,15,null,null,null,33,null,null,null,8]
```

**示例 2：**

```
输入：root = [0,null,1]
输出：[1,null,1]
```

**示例 3：**

```
输入：root = [1,0,2]
输出：[3,3,2]
```

**示例 4：**

```
输入：root = [3,2,4,1]
输出：[7,9,4,10]
```

**提示：**

*   树中的节点数介于 `0` 和 10<sup>4</sup>之间。
*   每个节点的值介于 -10<sup>4</sup> 和 10<sup>4</sup> 之间。
*   树中的所有值 **互不相同** 。
*   给定的树为二叉搜索树。

注意：

*   本题与主站 538 题相同： [https://leetcode-cn.com/problems/convert-bst-to-greater-tree/](https://leetcode-cn.com/problems/convert-bst-to-greater-tree/)
*   本题与主站 1038 题相同：[https://leetcode-cn.com/problems/binary-search-tree-to-greater-sum-tree/](https://leetcode-cn.com/problems/binary-search-tree-to-greater-sum-tree/)


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
    int DFS(TreeNode* root, int sum) {
        if (root == nullptr) {
            return sum;
        }
        root -> val += DFS(root -> right, sum);
        return DFS(root -> left, root -> val);
    }
    TreeNode* convertBST(TreeNode* root) {
        DFS(root,0);
        return root;
    }
};
```