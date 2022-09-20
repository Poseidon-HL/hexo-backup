---
title: 剑指 Offer II 024. 反转链表
date: 2022-09-20 21:53:45
tags:
 - 递归
 - 链表
categories: 剑指 Offer II
---

# [剑指 Offer II 024\. 反转链表](https://leetcode.cn/problems/UHnkqh/)

## Description

Difficulty: **简单**  

Related Topics: [递归](https://leetcode.cn/tag/recursion/), [链表](https://leetcode.cn/tag/linked-list/)


给定单链表的头节点 `head` ，请反转链表，并返回反转后的链表的头节点。


**示例 1：**

![rev1ex1](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220915/rev1ex1.3w1dfx6h3ai0.webp)

```
输入：head = [1,2,3,4,5]
输出：[5,4,3,2,1]
```

**示例 2：**

![rev1ex2](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220915/rev1ex2.218s7zykg7j4.webp)

```
输入：head = [1,2]
输出：[2,1]
```

**示例 3：**

```
输入：head = []
输出：[]
```

**提示：**

*   链表中节点的数目范围是 `[0, 5000]`
*   `-5000 <= Node.val <= 5000`

**进阶：**链表可以选用迭代或递归方式完成反转。你能否用两种方法解决这道题？


注意：本题与主站 206 题相同： [https://leetcode-cn.com/problems/reverse-linked-list/](https://leetcode-cn.com/problems/reverse-linked-list/)


## Solution

Language: **C++**

```c++
/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode() : val(0), next(nullptr) {}
 *     ListNode(int x) : val(x), next(nullptr) {}
 *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 * };
 */
class Solution {
public:
    ListNode* reverseList(ListNode* head) {
        ListNode* helper1 = new ListNode();
        ListNode* head1 = head;
        ListNode* tmp;
        while (head1 != nullptr) {
            tmp = head1 -> next;
            head1 -> next = helper1 -> next;
            helper1 -> next = head1;
            head1 = tmp;
        }
        return helper1 -> next;
    }
};
```