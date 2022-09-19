---
title: 剑指 Offer II 062. 实现前缀树
date: 2022-09-15 17:18:11
tags: 
 - 设计
 - 字典树
 - 哈希表
 - 字符串
categories: 剑指 Offer II
sticky: 62
---

# [剑指 Offer II 062\. 实现前缀树](https://leetcode.cn/problems/QC3q1f/)

## Description

Difficulty: **中等**  

Related Topics: [设计](https://leetcode.cn/tag/design/), [字典树](https://leetcode.cn/tag/trie/), [哈希表](https://leetcode.cn/tag/hash-table/), [字符串](https://leetcode.cn/tag/string/)


**[Trie](https://baike.baidu.com/item/字典树/9825209?fr=aladdin)**（发音类似 "try"）或者说 **前缀树** 是一种树形数据结构，用于高效地存储和检索字符串数据集中的键。这一数据结构有相当多的应用情景，例如自动补完和拼写检查。

请你实现 Trie 类：

*   `Trie()` 初始化前缀树对象。
*   `void insert(String word)` 向前缀树中插入字符串 `word` 。
*   `boolean search(String word)` 如果字符串 `word` 在前缀树中，返回 `true`（即，在检索之前已经插入）；否则，返回 `false` 。
*   `boolean startsWith(String prefix)` 如果之前已经插入的字符串 `word` 的前缀之一为 `prefix` ，返回 `true` ；否则，返回 `false` 。

**示例：**

```
输入
inputs = ["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
inputs = [[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
输出
[null, null, true, false, true, null, true]

解释
Trie trie = new Trie();
trie.insert("apple");
trie.search("apple");   // 返回 True
trie.search("app");     // 返回 False
trie.startsWith("app"); // 返回 True
trie.insert("app");
trie.search("app");     // 返回 True
```

**提示：**

*   `1 <= word.length, prefix.length <= 2000`
*   `word` 和 `prefix` 仅由小写英文字母组成
*   `insert`、`search` 和 `startsWith` 调用次数 **总计** 不超过 3 * 10<sup>4</sup> 次

注意：本题与主站 208 题相同：[https://leetcode-cn.com/problems/implement-trie-prefix-tree/](https://leetcode-cn.com/problems/implement-trie-prefix-tree/) 


## Solution

Language: **C++**

```c++
    bool search(string word) {
        Trie* node = this;
        for (char c : word) {
            int index = c - 'a';
            if (node -> children[index] == nullptr) {
                return false;
            }
            node = node -> children[index];
        }
    }
    
    /** Returns if the word is in the trie. */
            node = node -> children[index];
        }
        node -> isEnd = true;
            if (node -> children[index] == nullptr) {
                node -> children[index] = new Trie();
            }
        for (char c : word) {
            int index = c - 'a';
    /** Inserts a word into the trie. */
    void insert(string word) {
        Trie* node = this;
    bool isEnd;
    Trie():children(26),isEnd(false) {}
    
public:
    /** Initialize your data structure here. */
    vector<Trie*> children;
class Trie {
```