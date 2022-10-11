---
title: LeetCode 2181. 合并零之间的节点
date: 2022-10-11 16:36:39
tags:
 - 链表
 - 模拟
categories: LeetCode
---

# [2181\. 合并零之间的节点](https://leetcode.cn/problems/merge-nodes-in-between-zeros/)

## Description

Difficulty: **中等**  

Related Topics: [链表](https://leetcode.cn/tag/linked-list/), [模拟](https://leetcode.cn/tag/simulation/)


给你一个链表的头节点 `head` ，该链表包含由 `0` 分隔开的一连串整数。链表的 **开端** 和 **末尾** 的节点都满足 `Node.val == 0` 。

对于每两个相邻的 `0` ，请你将它们之间的所有节点合并成一个节点，其值是所有已合并节点的值之和。然后将所有 `0` 移除，修改后的链表不应该含有任何 `0` 。

 返回修改后链表的头节点 `head` 。

**示例 1：  
![ex1-1](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20221011/ex1-1.1fbw1wwmice8.webp)**

```
输入：head = [0,3,1,0,4,5,2,0]
输出：[4,11]
解释：
上图表示输入的链表。修改后的链表包含：
- 标记为绿色的节点之和：3 + 1 = 4
- 标记为红色的节点之和：4 + 5 + 2 = 11
```

**示例 2：  
![ex2-1](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20221011/ex2-1.11epibppkfio.webp)**

```
输入：head = [0,1,0,3,0,2,2,0]
输出：[1,3,4]
解释：
上图表示输入的链表。修改后的链表包含：
- 标记为绿色的节点之和：1 = 1
- 标记为红色的节点之和：3 = 3
- 标记为黄色的节点之和：2 + 2 = 4
```

**提示：**

*   列表中的节点数目在范围 [3, 2 * 10<sup>5</sup>] 内
*   `0 <= Node.val <= 1000`
*   **不** 存在连续两个 `Node.val == 0` 的节点
*   链表的 **开端** 和 **末尾** 节点都满足 `Node.val == 0`


## Solution

Language: **C++**

```c++
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    ListNode* mergeNodes(ListNode* head) {
        int count0 = 0, val = 0;
        ListNode* helper = new ListNode(0);
        helper -> next = head;
        ListNode* tra = head;
        ListNode* now = head;
        while (tra != nullptr) {
            val += tra -> val;
            if (tra -> val == 0) {
                count0++;
            }
            if (count0 == 2) {
                count0 = 1;
                now -> val = val;
                val = 0;
                now = now -> next;
                helper = helper -> next;
            }
            tra = tra -> next;
        }
        helper -> next = nullptr;
        return head;
    }
};
```