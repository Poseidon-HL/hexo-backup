---
title: 剑指 Offer II 109. 开密码锁
date: 2022-09-16 10:59:32
tags: 
 - 广度优先搜索
 - 数组
 - 哈希表
 - 字符串
categories: 剑指 Offer II
---

# [剑指 Offer II 109\. 开密码锁](https://leetcode.cn/problems/zlDJc7/)

## Description

Difficulty: **中等**  

Related Topics: [广度优先搜索](https://leetcode.cn/tag/breadth-first-search/), [数组](https://leetcode.cn/tag/array/), [哈希表](https://leetcode.cn/tag/hash-table/), [字符串](https://leetcode.cn/tag/string/)


一个密码锁由 4 个环形拨轮组成，每个拨轮都有 10 个数字： `'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'` 。每个拨轮可以自由旋转：例如把 `'9'` 变为 `'0'`，`'0'` 变为 `'9'` 。每次旋转都只能旋转一个拨轮的一位数字。

锁的初始数字为 `'0000'` ，一个代表四个拨轮的数字的字符串。

列表 `deadends` 包含了一组死亡数字，一旦拨轮的数字和列表里的任何一个元素相同，这个锁将会被永久锁定，无法再被旋转。

字符串 `target` 代表可以解锁的数字，请给出解锁需要的最小旋转次数，如果无论如何不能解锁，返回 `-1` 。

**示例 1:**

```
输入：deadends = ["0201","0101","0102","1212","2002"], target = "0202"
输出：6
解释：
可能的移动序列为 "0000" -> "1000" -> "1100" -> "1200" -> "1201" -> "1202" -> "0202"。
注意 "0000" -> "0001" -> "0002" -> "0102" -> "0202" 这样的序列是不能解锁的，因为当拨动到 "0102" 时这个锁就会被锁定。
```

**示例 2:**

```
输入: deadends = ["8888"], target = "0009"
输出：1
解释：
把最后一位反向旋转一次即可 "0000" -> "0009"。
```

**示例 3:**

```
输入: deadends = ["8887","8889","8878","8898","8788","8988","7888","9888"], target = "8888"
输出：-1
解释：
无法旋转到目标数字且不被锁定。
```

**示例 4:**

```
输入: deadends = ["0000"], target = "8888"
输出：-1
```

**提示：**

*   `1 <= deadends.length <= 500`
*   `<font face="monospace">deadends[i].length == 4</font>`
*   `<font face="monospace">target.length == 4</font>`
*   `target` **不在** `deadends` 之中
*   `target` 和 `deadends[i]` 仅由若干位数字组成

注意：本题与主站 752 题相同： [https://leetcode-cn.com/problems/open-the-lock/](https://leetcode-cn.com/problems/open-the-lock/)


## Solution

Language: **C++**

```c++
        while (thisRound.size() != 0) {
            int round = thisRound.size();
            count++;
            while (round > 0) {
                string now = thisRound.front();
                thisRound.pop();
                for (int i = 0;i < 4;i++) {
                    string addOne = cal(now,i,"+");
                    string subOne = cal(now,i,"-");
                    if (booms.find(addOne) == booms.end() && visited.find(addOne) == visited.end()) {
        }
        thisRound.push("0000");
        visited.insert("0000");
        count = 0;
        if (target == "0000") {
            return count;
        if (booms.find("0000") != booms.end()) {
            return count;
        }
            booms.insert(deadend);
        }
    int openLock(vector<string>& deadends, string target) {
        queue<string> thisRound;
        for (string deadend: deadends) {
    set<string> visited;
    set<string> booms;
    int count = -1;
        return src;
    }

```