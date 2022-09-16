---
title: 算法&数据结构 前缀树Trie
date: 2022-09-16 11:10:48
tags:
 - 数据结构
 - 前缀树
categories: 算法&数据结构
---

```c++
class Trie {
public:
    vector<Trie*> children;
    bool isEnd;
    Trie():children(26),isEnd(false) {}
    
    void insert(string word) {
        Trie* node = this;
        for (char c : word) {
            int index = c - 'a';
            if (node -> children[index] == nullptr) {
                node -> children[index] = new Trie();
            }
            node = node -> children[index];
        }
        node -> isEnd = true;
    }
    
    bool search(string word) {
        Trie* node = this;
        for (char c : word) {
            int index = c - 'a';
            if (node -> children[index] == nullptr) {
                return false;
            }
            node = node -> children[index];
        }
        return node -> isEnd;
    }
    
    bool startsWith(string prefix) {
        Trie* node = this;
        for (char c : prefix) {
            int index = c - 'a';
            if (node -> children[index] == nullptr) {
                return false;
            }
            node = node -> children[index];
        }
        return true;
    }
};

```
