#!/bin/bash

if [[ $LANG =~ 'zh_CN' ]]
then
    source ./language/zh_cn.sh
else
    source ./language/en_us.sh
fi
source ./common/functions.sh

#config NDK path
S_NDK_PATH=`read_string_not_empty "$S_INPUT_NDK_PATH"`
check_dir_exits "$S_NDK_PATH"
if [[ $? -ne 0 ]]
then
   echo "$S_INPUT_NDK_PATH_NOT_EXITS" 
   echo "$S_ABORT"
   exit
fi
 
 # choose api level
S_NDK_API=($(list_dir_name "${S_NDK_PATH%*/}/platforms"))
{
	    for(( i=0;i<${#S_NDK_API[@]};i++)) do
        echo "${S_NDK_API[i]}"
        done;
}    	
S_API=`choose_string_in_array "$S_INPUT_API" "${S_NDK_API[*]}" `

# choose arch 
S_NDK_ARCH=($(list_dir_name "${S_NDK_PATH%*/}/platforms/$S_API"))
{
	    for(( i=0;i<${#S_NDK_ARCH[@]};i++)) do
        echo "${S_NDK_ARCH[i]}"
        done;
}    	
S_ARCH=`choose_string_in_array "$S_INPUT_ARCH" "${S_NDK_ARCH[*]}" `
echo $S_ARCH

