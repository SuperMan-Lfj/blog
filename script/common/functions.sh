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
