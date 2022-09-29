---
title: LCP 41. 黑白翻转棋
date: 2022-09-29 13:42:54
tags:
 - 广度优先搜索
 - 数组
categories: LCP
---


# [LCP 41\. 黑白翻转棋](https://leetcode.cn/problems/fHi6rV/)

## Description

Difficulty: **中等**  

Related Topics: [广度优先搜索](https://leetcode.cn/tag/breadth-first-search/problemset/), [数组](https://leetcode.cn/tag/array/problemset/)


在 `n*m` 大小的棋盘中，有黑白两种棋子，黑棋记作字母 `"X"`, 白棋记作字母 `"O"`，空余位置记作 `"."`。当落下的棋子与其他相同颜色的棋子在行、列或对角线完全包围（中间不存在空白位置）另一种颜色的棋子，则可以翻转这些棋子的颜色。

![1630396029-eTgzpN-6da662e67368466a96d203f67bb6e793](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220929/1630396029-eTgzpN-6da662e67368466a96d203f67bb6e793.5xhib4u9bao.gif)

![1630396240-nMvdcc-8e4261afe9f60e05a4f740694b439b6b](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220929/1630396240-nMvdcc-8e4261afe9f60e05a4f740694b439b6b.7et6ha07nlw0.gif)

![1630396291-kEtzLL-6fcb682daeecb5c3f56eb88b23c81d33](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220929/1630396291-kEtzLL-6fcb682daeecb5c3f56eb88b23c81d33.3vnl6mehy7w0.gif)

**示例1:**

```
输入：chessboard = ["....X.","....X.","XOOO..","......","......"]

输出：3

解释：
可以选择下在 [2,4] 处，能够翻转白方三枚棋子。
```

**示例2:**

```
输入：chessboard = [".X.",".O.","XO."]

输出：2

解释：
可以选择下在 [2,2] 处，能够翻转白方两枚棋子
```

![1626683255-OBtBud-2126c1d21b1b9a9924c639d449cc6e65](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220929/1626683255-OBtBud-2126c1d21b1b9a9924c639d449cc6e65.5y6ja6c0u3w0.gif)

**示例3:**

```
输入：chessboard = [".......",".......",".......","X......",".O.....","..O....","....OOX"]

输出：4

解释：
可以选择下在 [6,3] 处，能够翻转白方四枚棋子。
```

![1630393770-Puyked-803f2f04098b6174397d6c696f54d709](https://cdn.staticaly.com/gh/Poseidon-HL/image-hosting@master/20220929/1630393770-Puyked-803f2f04098b6174397d6c696f54d709.2gw3h3h7y6e0.gif)

**提示：**

1. ` 1 <= chessboard.length, chessboard[i].length <= 8 `
2. ` chessboard[i] 仅包含 "."、"O" 和 "X" `


## Solution

Language: **C++**

```c++
class Solution {
public:
    // 筛选坐标
    // 搜索判断
    vector<string> C;
    vector<vector<int>> weights;
    set<pair<int,int>> points;
    bool isValidIJ(int i, int j) {
        return (i >=0 && j >= 0 && i < C.size() && j < C[i].length());
    }

    void showBoard() {
        for (int i = 0;i < C.size(); i++) {
            for (int j = 0;j < C[i].size(); j++) {
                if (C[i][j] == '.') {
                    cout << "T ";
                } else {
                    cout << C[i][j] << " ";
                }
            }
            cout << endl;
        }
        cout << "--------------------------" << endl;
    }

    bool isValid(int i1, int j1, int i2, int j2) {
        // 两个坐标都不合法 pass
        // 两个坐标只有一个合法 那么另一个必须为黑色
        // 两个坐标都合法 那么同样的其中之一也必须为黑色
        bool firstValid = false, secondValid = false;
        firstValid = isValidIJ(i1, j1);
        secondValid = isValidIJ(i2, j2);
        if (!firstValid && !secondValid) {
            return false;
        }
        if (firstValid && !secondValid) {
            return C[i1][j1] == 'X';
        }
        if (!firstValid && secondValid) {
            return C[i2][j2] == 'X';
        }
        return C[i1][j1] == 'X' || C[i2][j2] == 'X';
    }

    void addW(int i1, int j1, int i2, int j2) {
        if (isValidIJ(i1,j1) && C[i1][j1] != 'X') {
            points.insert(make_pair(i1, j1));
        } else if (isValidIJ(i2,j2) && C[i2][j2] != 'X') {
            points.insert(make_pair(i2, j2));
        }
    }

    int Cal(int i, int j, int countX) {
        C[i][j] = 'X';
        // cout << "Result: " << i << " " << j << endl;
        int countXAfter = countX;
        while (true) {
            int origin = countXAfter;
            countXAfter = 0;
            // showBoard();
            for (int i = 0;i < weights.size(); i++) {
                for (int j = 0;j < C[i].length(); j++) {
                    if (C[i][j] == 'O') {
                        AddWeight(i , j, true);
                    }
                    if (C[i][j] == 'X') {
                        countXAfter++;
                    }
                }
            }
            if (origin == countXAfter) {
                break;
            }
        }
        return countXAfter;
    }

    bool AllBlack(int i1, int j1, int i2, int j2) {
        bool firstValid = isValidIJ(i1, j1);
        bool secondValid = isValidIJ(i2, j2);
        if (!firstValid || !secondValid) {
            return false;
        }
        return C[i1][j1] == 'X' && C[i2][j2] == 'X';
    }

    void AddWeight(int i, int j, bool flag) {
        bool needBeBlack;
        // cout << "[AddWeight]: " << i << " " << j << endl;
        int up = i, down = i, left = j, right = j;
        int rightUpi = i, rightUpj = j, rightDowni = i, rightDownj = j, leftUpi = i, leftUpj =j, leftDowni = i, leftDownj = j;
        while (up >= 0 && C[up][j] == 'O') { up--; }
        // cout << "1" << endl;
        while (down < C.size() && C[down][j] == 'O') { down++; }
        // cout << "2" << endl;
        if (isValid(up, j, down, j)) { addW(up, j, down, j); }
        if (flag && AllBlack(up, j, down, j)) {
            C[i][j] = 'X';
            return ;
        }
        while (left >= 0 && C[i][left] == 'O') { left--; }
        while (right < C[i].size() && C[i][right] == 'O') { right++; }
        if (isValid(i, left, i, right)) { addW(i, left, i, right); }
        if (flag && AllBlack(i, left, i, right)) {
            C[i][j] = 'X';
            return ;
        }
        while (rightUpi >= 0 && rightUpj < C[i].size() && C[rightUpi][rightUpj] == 'O') {
            rightUpi--;
            rightUpj++;
        }
        while (leftDowni < C.size() && leftDownj >= 0 && C[leftDowni][leftDownj] == 'O') {
            leftDowni++;
            leftDownj--;
        }
        if (isValid(rightUpi, rightUpj, leftDowni, leftDownj)) { addW(rightUpi, rightUpj, leftDowni, leftDownj); }
        if (flag && AllBlack(rightUpi, rightUpj, leftDowni, leftDownj)) {
            C[i][j] = 'X';
            return ;
        }
        while (rightDowni < C.size() && rightDownj < C[i].size() && C[rightDowni][rightDownj] == 'O') {
            rightDowni++;
            rightDownj++;
        }
        while (leftUpi >= 0 && leftUpj >= 0 && C[leftUpi][leftUpj] == 'O') {
            leftUpi--;
            leftUpj--;
        }
        if (isValid(rightDowni, rightDownj, leftUpi, leftUpj)) { addW(rightDowni, rightDownj, leftUpi, leftUpj); }
        if (flag && AllBlack(rightDowni, rightDownj, leftUpi, leftUpj)) {
            C[i][j] = 'X';
            return ;
        }
    }

    int flipChess(vector<string>& chessboard) {
        weights.resize(chessboard.size());
        C = chessboard;
        // showBoard();
        int countX = 0;
        for (int i = 0;i < weights.size(); i++) {
            for (char c : chessboard[i]) {
                weights[i].push_back(0);
            }
        }
        for (int i = 0;i < weights.size(); i++) {
            for (int j = 0;j < chessboard[i].length(); j++) {
                if (chessboard[i][j] == 'O') {
                    AddWeight(i , j, false);
                } else if (chessboard[i][j] == 'X') {
                    countX++;
                }
            }
        }
        int result = 0;
        for (auto it = points.begin(); it != points.end(); it++) {
            vector<string> C_backup = C;
            result = max(result, Cal((*it).first, (*it).second, countX));
            C = C_backup;
        }
        
        
        return result - countX - 1 >= 0 ? result - countX - 1: 0;    
    }
};
```