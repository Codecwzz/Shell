#!/bin/bash
#
# Copyright Blockchaincc
#
echo
echo " ____    _____      _      ____    _____           _____   _   _   _       _  "
echo "/ ___|  |_   _|    / \    |  _ \  |_   _|         | ____| | \ | | | \     / | "
echo "\___ \    | |     / _ \   | |_) |   | |    _____  |  _|   |  \| |  \ \   / /  "
echo " ___) |   | |    / ___ \  |  _ <    | |   |_____| | |___  | |\  |   \ \_/ /   "
echo "|____/    |_|   /_/   \_\ |_| \_\   |_|           |_____| |_| \_|    \___/    "
echo





networkcheck (){
	ping -c 2 www.baidu.com >/dev/null 2>&1
	res=$?
	if [ $res -eq 0 ] ; then
		echo -e "\033[1m 网络畅通无阻，开始检测gcc-c++环境 \033[0m"
	else 
		echo -e "\033[5m\033[41;37m 无法连接到外部网络 \033[0m"
		echo -e "\033[5m\033[41;37m 网络畅通之后请重试 \033[0m"
		error
		exit 1
	fi
}

gcc-c++check() {
     if hash gcc 2>/dev/null; then
		echo -e "\033[1m ***已安装gcc-c++版本*** \033[0m"
		echo `rpm -qa gcc-c++`
		echo -e "\033[1m ***开始检测wget环境*** \033[0m"
	 else
		echo -e "\033[1m ======未安装gcc-c++======\033[0m"
		echo -e "\033[5m\033[41;37m 安装gcc-c++后重试 \033[0m"
		error
		exit 1
	 fi 
}

wgetenvcheck (){
     if hash wget 2>/dev/null;then
		echo -e "\033[1m ***已安装wget版本*** \033[0m"
		wget -V >&log.txt
		cat log.txt
		echo -e "\033[1m ***开始检测git环境*** \033[0m"
	 else
	 	echo -e "\033[1m ======未安装wget======\033[0m"
		echo -e "\033[5m\033[41;37m 安装wget后重试 \033[0m"
		error
		exit 1
	 fi 
}
gitenvcheck (){
	  if hash git 2>/dev/null; then
	  	echo -e "\033[1m ***已安装git版本*** \033[0m"
	    git version >&log.txt
	    cat log.txt
	   	echo -e "\033[1m ***开始检测golang环境*** \033[0m"
	   else
	    echo -e "\033[1m ======未安装git======\033[0m"
	    echo -e "\033[5m\033[41;37m 安装git后重试 \033[0m"
	    error
	    exit 1
	  fi
}

goenvcheck (){
		if hash go 2>/dev/null; then  
			echo -e "\033[1m ***已安装go版本*** \033[0m"
			go version >&log.txt
			cat log.txt
			echo -e "\033[1m ***开始检测geth环境*** \033[0m"
		else
			echo -e "\033[1m ======未安装golang======\033[0m" 
			echo -e "\033[5m\033[41;37m 安装golang后重试 \033[0m"
			error
			exit 1
	    fi
}

gethenvcheck (){
  if hash geth 2>/dev/null; then
  echo -e "\033[1m***geth版本*** \033[0m"
  geth version >&log.txt
  cat log.txt
  else
  	echo -e "\033[1m ======未安装geth======\033[0m"
    echo -e "\033[5m\033[41;37m 安装geth后重试 \033[0m"
    error
    exit 1
  fi
}


error(){
echo
echo " _____   ____     ____     _____     ____     _   _   _    "
echo "| ____| |  _ \   |  _ \   /  _  \   |  _ \   | | | | | |   "
echo "|  _|   | |_) |  | |_) | |  | |  |  | |_) |  | | | | | |   "
echo "| |___  |  _ <   |  _ <  |  |_|  |  |  _ <   |_| |_| |_|   "
echo "|_____| |_| \_\  |_| \_\  \_____/   |_| \_\  |_| |_| |_|   "
echo
}

##网络检测此版本只适用于可连接外网情况下
networkcheck
##gcc-c++环境检测
gcc-c++check
##wget环境检测
wgetenvcheck
##git环境检测
gitenvcheck
##golang环境检测
goenvcheck
##geth环境检测
gethenvcheck


echo
echo " _____   _   _   ____            _____   _   _   _       _  "
echo "| ____| | \ | | |  _ \          | ____| | \ | | | \     / | "
echo "|  _|   |  \| | | | | |  _____  |  _|   |  \| |  \ \   / /  "
echo "| |___  | |\  | | |_| | |_____| | |___  | |\  |   \ \_/ /   "
echo "|_____| |_| \_| |____/          |_____| |_| \_|    \___/    "
echo
exit 0