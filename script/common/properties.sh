#!/bin/bash

# $1 properties的文件路径
# $2 key
# 返回值： 对应的value。不存在则为空
function prop_getKey {

	propPath=$1
	targetKey=$2
	
if [ -f $propPath ]
then
    v=`grep $targetKey ${propPath} | cut -d'=' -f2`
	echo ${v}
fi
}
