# Shell
##### /bin/bash^M: 坏的解释器: 没有那个文件或目录 
解决方法：<br>
    使用在终端输入`sed -i 's/\r$//' test.sh`即可 <br>
    其中`test.sh`为我的文件名，这里改成自己需要的即可<br>
原因：<br>
    这个文件在Windows 下编辑过，在Windows下每一行结尾是\n\r，而Linux下则是\n<br>
    `sed -i 's/\r$//' test.sh` 会把test.sh中的行尾的\r替换为空白<br>    
##### linux下执行.sh文件的方法  
.sh文件就是文本文件，如果要执行，需要使用chmod a+x xxx.sh来给可执行权限。  

### 一键部署环境
```shell
rz
sed -i 's/\r$//' init.sh
chmod a+x init.sh
./init.sh
```
### Linux中的标准输入输出   
标准输入0    从键盘获得输入 /proc/self/fd/0    
标准输出1    输出到屏幕（即控制台） /proc/self/fd/1    
错误输出2    输出到屏幕（即控制台） /proc/self/fd/2    
/dev/null代表linux的空设备文件，所有往这个文件里面写入的内容都会丢失，俗称“黑洞”    
2>/dev/null意思就是把错误输出到“黑洞”   
\>/dev/null 2>&1默认情况是1，也就是等同于1>/dev/null 2>&1。意思就是把标准输出重定向到“黑洞”，还把错误输出2重定向到标准输出1，也就是标准输出和错误输出都进了“黑洞”    
2>&1 >/dev/null意思就是把错误输出2重定向到标准出书1，也就是屏幕，标准输出进了“黑洞”，也就是标准输出进了黑洞，错误输出打印到屏幕 
关于这里”&”的作用，我们可以这么理解2>/dev/null重定向到文件，那么2>&1，这里如果去掉了&就是把错误输出给了文件1了，用了&是表明1是标准输出。 
### shell中如何判断某一命令是否存在  
避免使用which，可用下列命令实现：
```
$ command -v foo >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }
$ type foo >/dev/null 2>&1 || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }
$ hash foo 2>/dev/null || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }
```
