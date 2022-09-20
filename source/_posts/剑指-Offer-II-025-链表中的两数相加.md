---
title: 剑指 Offer II 025. 链表中的两数相加
date: 2022-09-20 21:45:49
tags:
 - 栈
 - 链表
 - 数学
categories: 剑指 Offer II
---

# [剑指 Offer II 025\. 链表中的两数相加](https://leetcode.cn/problems/lMSNwu/)

## Description

Difficulty: **中等**  

Related Topics: [栈](https://leetcode.cn/tag/stack/), [链表](https://leetcode.cn/tag/linked-list/), [数学](https://leetcode.cn/tag/math/)


给定两个 **非空链表** `l1`和 `l2` 来代表两个非负整数。数字最高位位于链表开始位置。它们的每个节点只存储一位数字。将这两数相加会返回一个新的链表。

可以假设除了数字 0 之外，这两个数字都不会以零开头。

**示例1：**

![1626420025-fZfzMX-image](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220915/1626420025-fZfzMX-image.6big64vpahg0.webp)

```
输入：l1 = [7,2,4,3], l2 = [5,6,4]
输出：[7,8,0,7]
```

**示例2：**

```
输入：l1 = [2,4,3], l2 = [5,6,4]
输出：[8,0,7]
```

**示例3：**

```
输入：l1 = [0], l2 = [0]
输出：[0]
```

**提示：**

*   链表的长度范围为 `[1, 100]`
*   `0 <= node.val <= 9`
*   输入数据保证链表代表的数字无前导 0

**进阶：**如果输入链表不能修改该如何处理？换句话说，不能对列表中的节点进行翻转。

注意：本题与主站 445 题相同：[https://leetcode-cn.com/problems/add-two-numbers-ii/](https://leetcode-cn.com/problems/add-two-numbers-ii/)


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
    ListNode* ReverseList(ListNode* l1) {
        ListNode* helper1 = new ListNode();
        ListNode* head1 = l1;
        ListNode* tmp;
        while (head1 != nullptr) {
            tmp = head1 -> next;
            head1 -> next = helper1 -> next;
            helper1 -> next = head1;
            head1 = tmp;
        }
        return helper1 -> next;
    }

    int calNow(ListNode* l1, ListNode* l2, int carry) {
        int sum = 0;
        if (l2 == nullptr) {
            sum = l1 -> val + carry;
        } else {
            sum = l1 -> val + l2 -> val + carry;
        }
        l1 -> val = sum % 10;
        carry = sum / 10;
        return carry;
    }

    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        ListNode* helper1 = ReverseList(l1);
        ListNode* helper2 = ReverseList(l2);
        
        int carry = 0;
        ListNode* result = helper1;
        while(helper1 -> next != nullptr && helper2 -> next != nullptr) {
            carry = calNow(helper1,helper2,carry);
            helper1 = helper1 -> next;
            helper2 = helper2 -> next;
        }
        if (helper1 -> next == nullptr) {
            helper1 -> next = helper2 -> next;
        }
        carry = calNow(helper1,helper2,carry);
        helper1 = helper1 -> next;
        while (helper1 != nullptr && carry != 0) {
            carry = calNow(helper1,nullptr,carry);
            helper1 = helper1 -> next;
        }
        result = ReverseList(result);
        if (carry != 0) {
            ListNode* ans = new ListNode(carry, result);
            return ans;
        }
        return result;
    }
};
```