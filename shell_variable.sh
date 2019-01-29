#!/bin/bash
# 定义变量需要注意的事项
# 1.变量名不加$符号
# 2.变量名与等号之间没有空格，变量名可以使用英文字母/数字/下划线，首字母不能以数字开头
# 3.变量不能含有空格
# 4.不能使用bash关键字
java=foo
javascript=bar
echo ${java}script
#fooscript
echo $javascript
#bar
#变量可以被重新定义
java=foooooo
echo ${java}
#foooooo
#只读变量
var1=aaaa
readonly var1
echo ${var1}
#var1=bbbb 非法只读变量
echo ${var1}
#删除变量（不能删除只读变量）
unset java
echo ${java}
#获取字符串的长度
echo ${#javascript}
echo `expr index ${javascript} r`
#javascript bar 输出3

##数组
arr=(a b c d e f)
echo ${arr[3]} #d
echo ${arr[@]} #a b c d e f
echo ${#arr[@]} #6
