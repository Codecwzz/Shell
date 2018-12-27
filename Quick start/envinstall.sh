#!/bin/bash
#
# Copyright Blockchaincc
#
echo
echo " ____    _____      _      ____    _____           _    _   _   ____   _____    _      _       _      "
echo "/ ___|  |_   _|    / \    |  _ \  |_   _|         | |  | \ | | / ___| |_   _|  / \    | |     | |     "
echo "\___ \    | |     / _ \   | |_) |   | |    _____  | |  |  \  | \___ \   | |   / _ \   | |     | |     "
echo " ___) |   | |    / ___ \  |  _ <    | |   |_____| | |  | |\  |  ___) |  | |  / ___ \  | |___  | |___  "
echo "|____/    |_|   /_/   \_\ |_| \_\   |_|           |_|  |_| \_| |____/   |_| /_/   \_\ |_____\ |_____\ "
echo

gofile="/root/go1.9.linux-amd64.tar.gz" 
gofolder="/usr/local/go"
gethfolder="/root/go-ethereum"


gcc-c++install(){
	echo "开始安装gcc-c++..."
	if hash gcc 2>/dev/null; then
		echo -e "\033[1m gcc-c++已存在 \033[0m"
		echo -e "\033[5m\033[41;37m ================== \033[0m"
        echo -e "\033[5m\033[41;37m|                  |\033[0m"
        echo -e "\033[5m\033[41;37m|  gcc-c++ version |\033[0m"
        echo -e "\033[5m\033[41;37m|                  |\033[0m" 
        echo -e "\033[5m\033[41;37m ================== \033[0m"
		echo `rpm -qa gcc-c++`
	else
		yum -y install gcc-c++ >&log.txt
		cat log.txt
		if hash gcc 2>/dev/null; then
			echo -e "\033[1m gcc-c++安装成功 \033[0m"
			echo -e "\033[5m\033[41;37m ================== \033[0m"
	        echo -e "\033[5m\033[41;37m|                  |\033[0m"
	        echo -e "\033[5m\033[41;37m|  gcc-c++ version |\033[0m"
	        echo -e "\033[5m\033[41;37m|                  |\033[0m" 
	        echo -e "\033[5m\033[41;37m ================== \033[0m"
			rpm -qa gcc-c++ >&log.txt
			cat log.txt
		else	
		    echo -e "\033[5m\033[41;37m!!!!!!gcc-c++安装失败!!!!!! \033[0m"
		    error
		    exit 1
		fi    
	fi
}

wgetinstall(){
	echo "开始安装wget..."
	if hash wget 2>/dev/null; then
		echo -e "\033[1m wget已存在 \033[0m"
		echo -e "\033[5m\033[41;37m ================== \033[0m"
        echo -e "\033[5m\033[41;37m|                  |\033[0m"
        echo -e "\033[5m\033[41;37m|    wget version  |\033[0m"
        echo -e "\033[5m\033[41;37m|                  |\033[0m" 
        echo -e "\033[5m\033[41;37m ================== \033[0m"
		wget -V >&log.txt
		cat log.txt
	else
		yum -y install wget >&log.txt
		cat log.txt
		if hash wget 2>/dev/null; then
			echo -e "\033[1m wget安装成功 \033[0m"
			echo -e "\033[5m\033[41;37m ================== \033[0m"
	        echo -e "\033[5m\033[41;37m|                  |\033[0m"
	        echo -e "\033[5m\033[41;37m|    wget version  |\033[0m"
	        echo -e "\033[5m\033[41;37m|                  |\033[0m" 
	        echo -e "\033[5m\033[41;37m ================== \033[0m"
			wget -V >&log.txt
            cat log.txt
		else	
		    echo -e "\033[5m\033[41;37m!!!!!!wget安装失败!!!!!! \033[0m"
		    error
		    exit 1
		fi    
	fi
}

gitinstall(){
	echo "开始安装git..."
	if hash git 2>/dev/null; then
		echo -e "\033[1m git已存在 \033[0m"
		echo -e "\033[5m\033[41;37m ================== \033[0m"
        echo -e "\033[5m\033[41;37m|                  |\033[0m"
        echo -e "\033[5m\033[41;37m|    git version   |\033[0m"
        echo -e "\033[5m\033[41;37m|                  |\033[0m" 
        echo -e "\033[5m\033[41;37m ================== \033[0m"
		git version >&log.txt
		cat log.txt
	else
		yum -y install git >&log.txt
		cat log.txt
		if hash git 2>/dev/null; then
			echo -e "\033[1m git安装成功 \033[0m"
			echo -e "\033[5m\033[41;37m ================== \033[0m"
	        echo -e "\033[5m\033[41;37m|                  |\033[0m"
	        echo -e "\033[5m\033[41;37m|    git version   |\033[0m"
	        echo -e "\033[5m\033[41;37m|                  |\033[0m" 
	        echo -e "\033[5m\033[41;37m ================== \033[0m"
			git version >log.txt
			cat log.txt
		else	
		    echo -e "\033[5m\033[41;37m!!!!!!git安装失败!!!!!! \033[0m"
		    error
		    exit 1
		fi    
	fi
}

goinstall(){
	echo "开始安装go..."
	if hash go 2>/dev/null; then
		echo -e "\033[1m go已存在 \033[0m"
		echo -e "\033[5m\033[41;37m ================== \033[0m"
        echo -e "\033[5m\033[41;37m|                  |\033[0m"
        echo -e "\033[5m\033[41;37m|    go version    |\033[0m"
        echo -e "\033[5m\033[41;37m|                  |\033[0m" 
        echo -e "\033[5m\033[41;37m ================== \033[0m"
		go version >log.txt
		cat log.txt
	else
		cd /root
		if [ -f $gofile ];then
			echo "$gofile已存在同名文件，现在进行删除操作."
			rm -rf $gofile
			echo "删除完成"
		fi
            wget https://storage.googleapis.com/golang/go1.11.4.linux-amd64.tar.gz
            echo "正在解压..."
			tar zxvf go1.11.4.linux-amd64.tar.gz >&/dev/null
			echo "解压完成"
		if [ -d $gofolder ]; then
			    echo "$gofolder已存在同名目录，现在进行删除操作."
				rm -rf $gofolder
				echo "删除完成"
		fi	
            mv go /usr/local/
            echo "export GOROOT=/usr/local/go" >> /etc/profile
			echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile
			source /etc/profile
		if hash go 2>/dev/null; then
			echo -e "\033[1m go安装成功 \033[0m"
			echo -e "\033[5m\033[41;37m ================== \033[0m"
	        echo -e "\033[5m\033[41;37m|                  |\033[0m"
	        echo -e "\033[5m\033[41;37m|    go version    |\033[0m"
	        echo -e "\033[5m\033[41;37m|                  |\033[0m" 
	        echo -e "\033[5m\033[41;37m ================== \033[0m"
			go version >log.txt
		    cat log.txt
		else	
		    echo -e "\033[5m\033[41;37m!!!!!!go安装失败!!!!!! \033[0m"
		    error
		    exit 1
		fi    
	fi
}

gethinstall(){
	echo "开始安装geth..."
	if hash geth 2>/dev/null; then
		echo -e "\033[1m geth已存在 \033[0m"
		echo -e "\033[5m\033[41;37m ================== \033[0m"
        echo -e "\033[5m\033[41;37m|                  |\033[0m"
        echo -e "\033[5m\033[41;37m|    geth version  |\033[0m"
        echo -e "\033[5m\033[41;37m|                  |\033[0m" 
        echo -e "\033[5m\033[41;37m ================== \033[0m"
		geth version >&log.txt
		cat log.txt
	else
		cd /root
        if [ -d $gethfolder ]; then
			    echo "$gethfolder已存在同名目录，现在进行删除操作."
				rm -rf $gethfolder
				echo "删除完成"
		fi
		echo "稍等片刻"
		git clone https://github.com/ethereum/go-ethereum.git >&log.txt
		cat log.txt
		cd $gethfolder
		echo "正在编译..."
        make all >&log.txt
        cat log.txt
        echo "编译完成"
        echo "export PATH=$PATH:/root/go-ethereum/build/bin" >> /etc/profile
        source /etc/profile
		if hash geth 2>/dev/null; then
			echo -e "\033[1m geth安装成功 \033[0m"
			echo -e "\033[5m\033[41;37m ================== \033[0m"
	        echo -e "\033[5m\033[41;37m|                  |\033[0m"
	        echo -e "\033[5m\033[41;37m|    geth version  |\033[0m"
	        echo -e "\033[5m\033[41;37m|                  |\033[0m" 
	        echo -e "\033[5m\033[41;37m ================== \033[0m"
			geth version >&log.txt
		    cat log.txt
		else	
		    echo -e "\033[5m\033[41;37m!!!!!!geth安装失败!!!!!! \033[0m"
		    error
		    exit 1
		fi    
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


##安装gcc-c++
gcc-c++install

##安装wget
wgetinstall

##安装git
gitinstall

##安装go
goinstall

##安装geth
gethinstall


echo
echo " _____   _   _   ____            _    _   _   ____   _____    _      _       _      "
echo "| ____| | \ | | |  _ \          | |  | \ | | / ___| |_   _|  / \    | |     | |     "
echo "|  _|   |  \| | | | | |  _____  | |  |  \  | \___ \   | |   / _ \   | |     | |     "
echo "| |___  | |\  | | |_| | |_____| | |  | |\  |  ___) |  | |  / ___ \  | |___  | |___  "
echo "|_____| |_| \_| |____/          |_|  |_| \_| |____/   |_| /_/   \_\ |_____\ |_____\ "
echo
exit 0