#!/bin/bash
#硬链接，符号链接的区别
#硬链接：不可对目录创建硬链接，同时删除全部链接文件，文件才真正被删除。ln source target
#符号链接：删除源文件，目标文件也就不存在了。ln -s source target
