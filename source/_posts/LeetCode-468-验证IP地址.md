---
title: LeetCode 468. 验证IP地址
date: 2022-10-25 15:45:11
tags:
 - 字符串
categories: LeetCode
---

# [468\. 验证IP地址](https://leetcode.cn/problems/validate-ip-address/)

## Description

Difficulty: **中等**  

Related Topics: [字符串](https://leetcode.cn/tag/string/)


给定一个字符串 `queryIP`。如果是有效的 IPv4 地址，返回 `"IPv4"` ；如果是有效的 IPv6 地址，返回 `"IPv6"` ；如果不是上述类型的 IP 地址，返回 `"Neither"` 。

**有效的IPv4地址** 是 `“x1.x2.x3.x4”` 形式的IP地址。 其中 0 <= x<sub>i</sub> <= 255 且 x<sub>i</sub> **不能包含** 前导零。例如: `“192.168.1.1”` 、 `“192.168.1.0”` 为有效IPv4地址， `“192.168.01.1”` 为无效IPv4地址; `“192.168.1.00”` 、 `“192.168@1.1”` 为无效IPv4地址。

**一个有效的IPv6地址 **是一个格式为`“x1:x2:x3:x4:x5:x6:x7:x8”` 的IP地址，其中:

*   1 <= x<sub>i</sub>.length <= 4
*   x<sub>i</sub> 是一个 **十六进制字符串** ，可以包含数字、小写英文字母( `'a'` 到 `'f'` )和大写英文字母( `'A'` 到 `'F'` )。
*   在 x<sub>i</sub> 中允许前导零。

例如 `"2001:0db8:85a3:0000:0000:8a2e:0370:7334"` 和 `"2001:db8:85a3:0:0:8A2E:0370:7334"` 是有效的 IPv6 地址，而 `"2001:0db8:85a3::8A2E:037j:7334"` 和 `"02001:0db8:85a3:0000:0000:8a2e:0370:7334"` 是无效的 IPv6 地址。

**示例 1：**

```
输入：queryIP = "172.16.254.1"
输出："IPv4"
解释：有效的 IPv4 地址，返回 "IPv4"
```

**示例 2：**

```
输入：queryIP = "2001:0db8:85a3:0:0:8A2E:0370:7334"
输出："IPv6"
解释：有效的 IPv6 地址，返回 "IPv6"
```

**示例 3：**

```
输入：queryIP = "256.256.256.256"
输出："Neither"
解释：既不是 IPv4 地址，又不是 IPv6 地址
```

**提示：**

*   `queryIP` 仅由英文字母，数字，字符 `'.'` 和 `':'` 组成。


## Solution

Language: **Go**

```go
func isValidIpv4(src string) bool {
	if num, err := strconv.Atoi(src); err == nil {
		if !(num >= 0 && num <= 255) {
			return false
		}
		if num == 0 && len(src) != 1 {
			return false
		}
		if num > 0 && src[0] == '0' {
			return false
		}
	} else {
		return false
	}

	return true
}

func validIPAddress(queryIP string) string {
	case1Slice := strings.Split(queryIP, ":")
	case2Slice := strings.Split(queryIP, ".")
	if len(case1Slice) != 1 {
		if len(case1Slice) != 8 {
			return "Neither"
		}
		for _, item := range case1Slice {
			println(item)
			if item == "" || item == "." || len(item) > 4 {
				return "Neither"
			}
			for _, c := range item {
				if (c >= 'a' && c <= 'f') || (c >= 'A' && c <= 'F') || (c >= '0' && c <= '9') {
					continue
				}
				return "Neither"
			}
		}
		return "IPv6"
	}
	if len(case2Slice) != 1 {
		if len(case2Slice) != 4 {
			return "Neither"
		}
		for _, item := range case2Slice {
			if item == "" || item == ":" {
				return "Neither"
			}
			if !isValidIpv4(item) {
				return "Neither"
			}
		}
		return "IPv4"
	}

	return "Neither"
}
```