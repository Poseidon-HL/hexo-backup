---
title: LeetCode 1145. 二叉树着色游戏
date: 2022-11-05 16:46:02
tags: 
 - 树
 - 深度优先搜索
 - 二叉树
categories: LeetCode
---

# [1145\. 二叉树着色游戏](https://leetcode.cn/problems/binary-tree-coloring-game/)

## Description

Difficulty: **中等**  

Related Topics: [树](https://leetcode.cn/tag/tree/), [深度优先搜索](https://leetcode.cn/tag/depth-first-search/), [二叉树](https://leetcode.cn/tag/binary-tree/)


有两位极客玩家参与了一场「二叉树着色」的游戏。游戏中，给出二叉树的根节点 `root`，树上总共有 `n` 个节点，且 `n` 为奇数，其中每个节点上的值从 `1` 到 `n` 各不相同。

游戏从「一号」玩家开始（「一号」玩家为红色，「二号」玩家为蓝色），最开始时，

「一号」玩家从 `[1, n]` 中取一个值 `x`（`1 <= x <= n`）；

「二号」玩家也从 `[1, n]` 中取一个值 `y`（`1 <= y <= n`）且 `y != x`。

「一号」玩家给值为 `x` 的节点染上红色，而「二号」玩家给值为 `y` 的节点染上蓝色。

之后两位玩家轮流进行操作，每一回合，玩家选择一个他之前涂好颜色的节点，将所选节点一个 **未着色** 的邻节点（即左右子节点、或父节点）进行染色。

如果当前玩家无法找到这样的节点来染色时，他的回合就会被跳过。

若两个玩家都没有可以染色的节点时，游戏结束。着色节点最多的那位玩家获得胜利 ✌️。

现在，假设你是「二号」玩家，根据所给出的输入，假如存在一个 `y` 值可以确保你赢得这场游戏，则返回 `true`；若无法获胜，就请返回 `false`。

**示例：**

**![](https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2019/08/04/1480-binary-tree-coloring-game.png)**

```
输入：root = [1,2,3,4,5,6,7,8,9,10,11], n = 11, x = 3
输出：True
解释：第二个玩家可以选择值为 2 的节点。
```

**提示：**

*   二叉树的根节点为 `root`，树上由 `n` 个节点，节点上的值从 `1` 到 `n` 各不相同。
*   `n` 为奇数。
*   `1 <= x <= n <= 100`


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
    int X;
    int leftNum = 0;
    int rightNum = 0;
    // 找对应节点的俩儿子节点 父亲节点等
    void CountSubTreeNum(TreeNode* root, bool isLeft) {
        if (root == nullptr) {
            return ;
        }
        if (isLeft) {
            leftNum++;
        } else {
            rightNum++;
        }
        CountSubTreeNum(root -> left, isLeft);
        CountSubTreeNum(root -> right, isLeft);
    }

    void Traverse(TreeNode* root) {
        if (root == nullptr) {
            return ;
        }
        if (root -> val == X) {
            CountSubTreeNum(root -> left, true);
            CountSubTreeNum(root -> right, false);
            return;
        }
        Traverse(root -> left);
        Traverse(root -> right);
    }
    
    bool btreeGameWinningMove(TreeNode* root, int n, int x) {
        // 统计总的数目 统计第一个玩家的子树的数目
        // 根节点需要重新判断
        X = x;
        Traverse(root);
        int parentNum = n - leftNum - rightNum - 1;
        int maxChose = max(leftNum, rightNum);
        maxChose = max(maxChose, parentNum);
        int minChose = min(leftNum, rightNum);
        minChose = min(minChose, parentNum);
        return maxChose > n - maxChose;
    }
};
```
