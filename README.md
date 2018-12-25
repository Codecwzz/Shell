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

