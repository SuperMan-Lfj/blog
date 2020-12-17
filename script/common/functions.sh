#!/bin/bash

#$1:提示语句
#返回值：输入的值
function read_string_not_empty() 
{
	RESULT=
	while [ -z "$RESULT" ]
	do
		read -p "$1" RESULT
	done
	
	echo "$RESULT"
}

#$1 文件路径
#返回值：true:存在，false:不存在
function check_file_exits()
{
    if [ -f "$1" ];then
  		return 0;
	else
 	 	return -1;
	fi
}


#$1 文件夹路径
#返回值：true:存在，false:不存在
function check_dir_exits()
{
    if [ -d "$1" ];then
  		return 0;
	else
 	 	return -1;
	fi
}

#$1：文件夹
#返回值：文件夹名字 
function list_dir_name()
{
	inputDir=$1
	inputDir="${inputDir%*/}"
 	for dir in $(ls $inputDir)
 	do
     	[ -d $inputDir/$dir ] && echo $dir
 	done   
}

#$1 提示语句
#$2 字符串数组
#返回值 选择的字符串
function choose_string_in_array()
{
	
	#加括号，作为数组
    arr=($2)
    
	MATCH=1
	RESULT=
	while [[ -z "$RESULT" ]] || [[ "$MATCH" -ne 0 ]]
	do
		read -p "$1" RESULT
		{
			for(( i=0;i<${#arr[@]};i++)) do
			{
        	  if [ "$RESULT" = "${arr[i]}" ]
        	  then
        	    MATCH=0
        	    break
        	  fi
        	}
    		done
		}
		
	done
	
	echo "$RESULT"
}
