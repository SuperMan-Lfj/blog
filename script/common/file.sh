#!/bin/bash


#$1 文件路径
#返回值：true:存在，false:不存在
function file_fileExits()
{
    if [ -f "$1" ];then
  		return 0;
	else
 	 	return -1;
	fi
}


#$1 文件夹路径
#返回值：true:存在，false:不存在
function file_dirExits()
{
    if [ -d "$1" ];then
  		return 0;
	else
 	 	return -1;
	fi
}

#$1：文件夹
#返回值：文件夹名字数组 
function file_listDirName()
{
	inputDir=$1
	inputDir="${inputDir%*/}"
 	for dir in $(ls $inputDir)
 	do
     	[ -d $inputDir/$dir ] && echo $dir
 	done   
}