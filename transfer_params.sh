#!/bin/bash
###参数传递###
#$0 执行的文件名
#$1 第一个参数 依次类推 $2 $3
#./transfer_params a b c
echo $0 $1 $2 $3
#输出 ./transfer_params.sh a b c
################################
# $# 参数的个数 3
# $* 显示所有的参数例如 $1 $2 $3   a b c
# $$ 脚本运行的当前进程id号
# $! 后台运行的最后一个进程id号
# $@ 同$* 差不多 使用： "$@" 返回 "a" "b" "c"
# $- 显示shell使用的当前选项
# $? 显示脚本退出时的状态，0表示正常，其他数值则出错

