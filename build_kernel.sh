#!/bin/bash

#Samsung Galaxy S8 (dreamlte) Kernel Build Script by boerck

export ANDROID_MAJOR_VERSION=p
export ARCH=arm64

KERNEL_PATH=$(pwd)


function f_timer {
    ELAPSEDTIME=$(($(date +"%s") - $1))
    printf "Kernel Build Elapsed Time: %02d:%02d:%05.2f\n" $((ELAPSEDTIME/60/60)) $((ELAPSEDTIME/60)) $((ELAPSEDTIME%60))
}



#####Kernel zImage build#####
echo "******************************"
echo "Clear Folder..."
make clean
make mrproper
echo "Clear Complete!!"
echo "******************************"
echo ""
echo ""


echo "******************************"
echo "Make Config..."
make exynos8895-dreamlte_defconfig
make menuconfig
echo "Make Config Complete!!"
echo "******************************"
echo ""
echo ""


echo "******************************"
echo "Kernel Build Start..."
echo "Build timer start!!"
STARTTIME=$(date +"%s")
make -j4
echo "Kernel Build Complete!!"
f_timer $STARTTIME
echo "******************************"
sleep 3
echo ""
echo ""
##############################



#####Ramdisk Build#####
echo "******************************"
cp $KERNEL_PATH/arch/arm64/boot/Image $KERNEL_PATH/AIK-Linux/split_img/boot.img-zImage
cp $KERNEL_PATH/arch/arm64/boot/dtb.img $KERNEL_PATH/AIK-Linux/split_img/boot.img-dt
echo "Compiling Ramdisk..."
cd $KERNEL_PATH/AIK-Linux
bash repackimg.sh
echo "******************************"
echo ""
echo ""

read -p "File name? > " file_name
mv $KERNEL_PATH/AIK-Linux/image-new.img $KERNEL_PATH/AIK-Linux/$file_name
##############################

stat $KERNEL_PATH/AIK-Linux/$file_name
cd $KERNEL_PATH
sleep 3
echo ""
echo ""
echo "Build End"
