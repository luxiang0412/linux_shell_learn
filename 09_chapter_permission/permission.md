# linux权限
###
    linux下所有都是文件，每个文件都有对应的权限。
###
## 目录
- [所有者，组成员和其他用户](#所有者，组成员和其他用户)
- [读取，写入和执行](#读取，写入和执行)
- [更改身份](#更改身份)
- [权限的使用](#权限的使用)
- [更改密码](#更改密码)
---
## 所有者，组成员和其他用户
###
每个用户都有一个uid，每个组都有一个gid。
###
```
luxiang@luxiang-Lenovo-G410:/home/github/linux_shell_learn/09_chapter_permission$ id
uid=1000(luxiang) gid=1000(luxiang) 组=1000(luxiang),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),113(lpadmin),128(sambashare
```
###
文件/etc/passwd中定义了对应用户的用户名，uid，gid，账户的真实姓名，主目录以及登录信息。  
/etc/shadow中保存的用户的密码信息
###
## 读取，写入和执行
```
luxiang@luxiang-Lenovo-G410:/home/github/linux_shell_learn/09_chapter_permission$ ls -al
总用量 12
drwxrwxr-x  2 luxiang luxiang 4096 3月  24 19:03 .
drwxrwxr-x 39 luxiang luxiang 4096 3月  17 22:04 ..
-rw-rw-r--  1 luxiang luxiang  928 3月  24 19:25 permission.md
```
###
`-rw-rw-r--`第一个代表的是文件的类型，如下表
###
|属性|文件类型|
|-------|------|
|-|普通的文件|
|d|目录|
|l|符号链接，符号链接指向的文件的属性才是真正的文件爱你属性|
|c|字符设备文件，如终端或调制解调器|
|b|块设备文件，如硬盘驱动或者光盘驱动|
###
第2-4个值表示文件所有着的权限  
第5-7个值表示文件所在的组的成员的权限  
第8-10个值表示其他成员的权限  
分别代表可读，可写，可执行。  
1 可执行
2 可写
4 可读
`-rw-rw-r--` 用数字表示就是554  
chmod可以更改文件权限  
u表示文件所有者，g表示组成员，o表示其他成员。  
如果想给这个文件的所有者读写可执行权限。组成员读可执行，其他成员可读。  
```
luxiang@luxiang-Lenovo-G410:/home/github/linux_shell_learn/09_chapter_permission$ chmod u+x,g-w,g+x permission.md 
luxiang@luxiang-Lenovo-G410:/home/github/linux_shell_learn/09_chapter_permission$ ls -al
总用量 12
drwxrwxr-x  2 luxiang luxiang 4096 3月  24 19:03 .
drwxrwxr-x 39 luxiang luxiang 4096 3月  17 22:04 ..
-rwxr-xr--  1 luxiang luxiang 1208 3月  24 19:26 permission.md
luxiang@luxiang-Lenovo-G410:/home/github/linux_shell_learn/09_chapter_permission$ chmod 554 permission.md 
luxiang@luxiang-Lenovo-G410:/home/github/linux_shell_learn/09_chapter_permission$ ls -al
总用量 12
drwxrwxr-x  2 luxiang luxiang 4096 3月  24 19:03 .
drwxrwxr-x 39 luxiang luxiang 4096 3月  17 22:04 ..
-r-xr-xr--  1 luxiang luxiang 2415 3月  24 19:40 permission.md
```
###
umask命令控制这创建文件时指定给文件的默认权限，当前用户默认创建文件权限是0002（八进制数字）
|原始文件模式|特殊权位|所有者|所在组|其他|
|---|---|---|---|--|
|掩码|000|000|000|010|
|结果|---|rw-|rw-|r--|
```
luxiang@luxiang-Lenovo-G410:/home/github/linux_shell_learn/09_chapter_permission$ umask 
0002
luxiang@luxiang-Lenovo-G410:/home/github/linux_shell_learn/09_chapter_permission$ umask 0022
luxiang@luxiang-Lenovo-G410:/home/github/linux_shell_learn/09_chapter_permission$ > a
luxiang@luxiang-Lenovo-G410:/home/github/linux_shell_learn/09_chapter_permission$ ls
a  permission.md
luxiang@luxiang-Lenovo-G410:/home/github/linux_shell_learn/09_chapter_permission$ ll
总用量 12
drwxrwxr-x  2 luxiang luxiang 4096 3月  24 19:49 ./
drwxrwxr-x 39 luxiang luxiang 4096 3月  17 22:04 ../
-rw-r--r--  1 luxiang luxiang    0 3月  24 19:49 a
-rw-rw-r--  1 luxiang luxiang 3168 3月  24 19:48 permission.md
```
###
特殊权限  
setuid（八进制4000）拥有该权限（仅d对具有可执行的文件有效）的文件会已该文件的所有权限来执行该文件，例如linux中的passwd命令，该命令就是有setuid权限，执行passwd会已root权限执行。然后将密码写入/etc/shadow中  
setgid（八进制2000）针对目录，在拥有setgid权限的目录下创建文件，该文件的所在的组为目录的组  
stikey（八进制1000）阻止用户的删除或重命名    
###
## 更改身份
###
su  以其他用户和组id的身份来运行shell  
也可以单独执行某条命令，例如su -c \`ls -al \/root\`  
sudo  以另一个用户的身份执行命令 例如：`sudo mkdir test`会要求输入密码，最终以root的权限创建一个test目录  
chown  更改所有者或者所在的组`chown [own]:[group]`  
chgrp  
###
## 权限的使用
## 更改密码
###
passwd 用法： `passwd [user]`  
###
