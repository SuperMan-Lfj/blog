#!/bin/bash

# $1 ndk文件夹路径
# 返回值： ndk的主版本号，比如10，22等。失败返回空
function ndk_getNDKVersion() {
	NDK_PATH=$1
	
	RELEASE_TXT_PATH=$NDK_PATH/RELEASE.TXT
	file_fileExits $RELEASE_TXT_PATH
	if [[ $? -eq 0 ]] 
	then
	    VERSION=`cat $RELEASE_TXT_PATH`
	    echo $VERSION
	    return ;
    fi

   PROPERITIES_PATH=$NDK_PATH/source.properties
   file_fileExits $PROPERITIES_PATH
	if [[ $? -eq 0 ]] 
	then
	    VERSION=$(prop_getKey $PROPERITIES_PATH 'Pkg.Revision')
	    echo $VERSION
	    return ;
    fi
    
    echo ""

}