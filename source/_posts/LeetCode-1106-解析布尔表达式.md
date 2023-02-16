---
title: LeetCode 1106. 解析布尔表达式
date: 2022-11-05 16:46:16
tags:
 - 栈
 - 递归
 - 字符串
categories: LeetCode
---

# [1106\. 解析布尔表达式](https://leetcode.cn/problems/parsing-a-boolean-expression/)

## Description

Difficulty: **困难**  

Related Topics: [栈](https://leetcode.cn/tag/stack/), [递归](https://leetcode.cn/tag/recursion/), [字符串](https://leetcode.cn/tag/string/)


给你一个以字符串形式表述的 [布尔表达式](https://baike.baidu.com/item/%E5%B8%83%E5%B0%94%E8%A1%A8%E8%BE%BE%E5%BC%8F/1574380?fr=aladdin)（boolean） `expression`，返回该式的运算结果。

有效的表达式需遵循以下约定：

*   `"t"`，运算结果为 `True`
*   `"f"`，运算结果为 `False`
*   `"!(expr)"`，运算过程为对内部表达式 `expr` 进行逻辑 **非的运算**（NOT）
*   `"&(expr1,expr2,...)"`，运算过程为对 2 个或以上内部表达式 `expr1, expr2, ...` 进行逻辑 **与的运算**（AND）
*   `"|(expr1,expr2,...)"`，运算过程为对 2 个或以上内部表达式 `expr1, expr2, ...` 进行逻辑 **或的运算**（OR）

**示例 1：**

```
输入：expression = "!(f)"
输出：true
```

**示例 2：**

```
输入：expression = "|(f,t)"
输出：true
```

**示例 3：**

```
输入：expression = "&(t,f)"
输出：false
```

**示例 4：**

```
输入：expression = "|(&(t,f,t),!(t))"
输出：false
```

**提示：**

*   `1 <= expression.length <= 20000`
*   `expression[i]` 由 `{'(', ')', '&', '|', '!', 't', 'f', ','}` 中的字符组成。
*   `expression` 是以上述形式给出的有效表达式，表示一个布尔值。


## Solution

Language: **C++**

```c++
class Solution {
public:
    bool parseBoolExpr(string expression) {
        bool result;
        stack<char> tmp;
        for (char c : expression) {
            if (c == ',') {
                continue;
            }
            if (c == ')') {
                bool tmpResAnd = tmp.top() == 't' ? true : false;
                bool tmpResOr = tmp.top() == 't' ? true : false;
                tmp.pop();
                while (tmp.top() != '(') {
                    bool thisTop = tmp.top() == 't' ? true : false;
                    tmpResAnd = tmpResAnd && thisTop;
                    tmpResOr = tmpResOr || thisTop;
                    tmp.pop();
                }
                tmp.pop();
                if (tmp.top() == '&') {
                    tmp.pop();
                    tmp.push(tmpResAnd ? 't' : 'f');
                } else if (tmp.top() == '|') {
                    tmp.pop();
                    tmp.push(tmpResOr ? 't' : 'f');
                } else {
                    tmp.pop();
                    tmp.push(tmpResAnd ? 'f' : 't');
                }
            } else {
                tmp.push(c);
            }
        }

        return tmp.top() == 't';
    }
};
```