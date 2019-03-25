# 进程
###
一些关于进程的命令  
ps：显示所有的进程的运行的状态  
top：实时显示当前所有的任务的资源占用情况  
jobs：列出所有活动作业的状态信息  
bg：设置后台中运行作业  
fg：设置前台中运行作业  
kill：发送信号给某个进程  
killall：杀死指定名字的进程  
###
## ps
###
tty这一列中？表示没有控制终端
###
```
luxiang@luxiang-Lenovo-G410:~$ ps x
  PID TTY      STAT   TIME COMMAND
 2972 ?        Ss     0:00 /lib/systemd/systemd --user
 2988 ?        S      0:00 (sd-pam)
 2996 ?        SLl    0:00 /usr/bin/gnome-keyring-daemon --daemonize --login
 3007 ?        Ss     0:00 /sbin/upstart --user
```
###
state表示进程的状态
###
|状态|含义|
|---|---|
|R|运行状态，进程正在运行或准备运行|
|S|睡眠状态|
|D|不可终端的状态|
|T|暂停状态（后续还可继续运行）|
|Z|无效或者僵尸进程，子进程被中止，还没有被父进程彻底释放掉|
|<|高优先级|
|N|低优先级|
# top

