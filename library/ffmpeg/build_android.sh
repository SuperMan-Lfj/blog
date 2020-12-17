##!/bin/bash

export S_NDK_PATH=/Users/A/Program/android-ndk-r14b
export S_API=android-19
export S_ARCH=arch-arm

PREFIX=`pwd`/../build/

echo $PREFIX

#https://developer.android.com/ndk/guides/other_build_systems?hl=zh-cn
TOOLCHAIN=$S_NDK_PATH/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64
TARGET=arm-linux-androideabi
export AR=$TOOLCHAIN/bin/$TARGET-ar
export AS=$TOOLCHAIN/bin/$TARGET-as
export CC=$TOOLCHAIN/bin/$TARGET-gcc
export CXX=$TOOLCHAIN/bin/$TARGET-g++
export LD=$TOOLCHAIN/bin/$TARGET-ld
export RANLIB=$TOOLCHAIN/bin/$TARGET-ranlib
export STRIP=$TOOLCHAIN/bin/$TARGET-strip
         
CFLAGS=" -g -DANDROID -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -march=armv5te -mtune=xscale -msoft-float -mthumb -Wa,--noexecstack -Wformat -Werror=format-security -Os -DNDEBUG  -fPIC "
CXXFLAGS=" -g -DANDROID -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -march=armv5te -mtune=xscale -msoft-float -mthumb -Wa,--noexecstack -Wformat -Werror=format-security  -std=c++11 -Os -DNDEBUG  -fPIC "
LDFLAGS=" -Wl,--build-id -Wl,--warn-shared-textrel -Wl,--fatal-warnings -Wl,--no-undefined -Wl,-z,noexecstack -Wl,-z,relro -Wl,-z,now "


./configure \
--enable-cross-compile \
--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
--target-os=linux \
--arch=arm \
--extra-cflags="$CFLAGS" \
--extra-cxxflags="$CXXFLAGS" \
--extra-ldflags="$LDFLAGS" \
--sysroot=$S_NDK_PATH/platforms/$S_API/$S_ARCH \
 \
 \
--prefix=$PREFIX \
--enable-static \
--disable-shared \
--disable-programs \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--disable-avdevice \
 \
--disable-asm \


# make -j 8
# make install