---
title: LeetCode 1138. 字母板上的路径
date: 2022-10-04 19:12:53
tags:
 - 哈希表
 - 字符串
categories: LeetCode
---

# [1138\. 字母板上的路径](https://leetcode.cn/problems/alphabet-board-path/)

## Description

Difficulty: **中等**  

Related Topics: [哈希表](https://leetcode.cn/tag/hash-table/), [字符串](https://leetcode.cn/tag/string/)


我们从一块字母板上的位置 `(0, 0)` 出发，该坐标对应的字符为 `board[0][0]`。

在本题里，字母板为`board = ["abcde", "fghij", "klmno", "pqrst", "uvwxy", "z"]`，如下所示。

![azboard](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20221004/azboard.45g6rpi3maw0.webp)

我们可以按下面的指令规则行动：

*   如果方格存在，`'U'` 意味着将我们的位置上移一行；
*   如果方格存在，`'D'` 意味着将我们的位置下移一行；
*   如果方格存在，`'L'` 意味着将我们的位置左移一列；
*   如果方格存在，`'R'` 意味着将我们的位置右移一列；
*   `'!'` 会把在我们当前位置 `(r, c)` 的字符 `board[r][c]` 添加到答案中。

（注意，字母板上只存在有字母的位置。）

返回指令序列，用最小的行动次数让答案和目标 `target` 相同。你可以返回任何达成目标的路径。

**示例 1：**

```
输入：target = "leet"
输出："DDR!UURRR!!DDD!"
```

**示例 2：**

```
输入：target = "code"
输出："RR!DDRR!UUL!R!"
```

**提示：**

*   `1 <= target.length <= 100`
*   `target` 仅含有小写英文字母。


## Solution

Language: **C++**

```c++
class Solution {
public:
    map<char, pair<int, int>> positions;
    string result;
    
    void initMap() {
        for (int i = 0; i <= 26; i++) {
            positions[char('a' + i)] = make_pair(i / 5, i % 5);
        }
    }

    string CalDistance(char src, char dst) {
        string move = "";
        if (src == 'z' && dst != 'z') {
            return "U" + CalDistance('u', dst);
        }
        if (dst == 'z' && src != 'z') {
            return CalDistance(src, 'u') + "D";
        }
        int Xdistance = positions[dst].first - positions[src].first;
        int Ydistance = positions[dst].second - positions[src].second;
        char xMove = Xdistance < 0 ? 'U' : 'D';
        char yMove = Ydistance < 0 ? 'L' : 'R';
        for (int i = 0;i < abs(Xdistance); i++) {
            move += xMove;
        }
        for (int i = 0;i < abs(Ydistance); i++) {
            move += yMove;
        }
        return move;
    }

    string alphabetBoardPath(string target) {
        initMap();
        char start = 'a';
        for (int i = 0;i < target.length(); i++) {
            result += CalDistance(start, target[i]);
            start = target[i];
            result += '!';
        }
        return result;
    }
};
```