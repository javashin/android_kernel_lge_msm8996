#!/bin/bash
clear 


echo "KERNAL KERNAL KERNAL KERNAL KARNAL KARMA KARMA KARMA"
date
echo "Start Compilation ^^^^^@^^^^  Time"
echo "Set TurboBoost For Faster Android Kernal Compilation"
/usr/bin/cpupower frequency-set -g performance
/usr/sbin/x86_energy_perf_policy performance
#printf "1"  > /sys/devices/system/cpu/cpufreq/boost





echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "Preparing"
sleep 1

rm -rf OUT
export ARCH=arm64  
export SUBARCH=arm 
mkdir OUT 

echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "Configuring"
sleep 1

PATH="/mnt/android-B/clang-master/bin:/mnt/android-B/aarch64-linux-android-4.9/bin:${PATH}" make O=OUT ARCH=arm64 SUBARCH=arm CC=clang DTC_EXT=dtc SELINUX_DEFCONFIG=selinux_defconfig CONFIG_ADRENO_IDLER=y CONFIG_STATE_NOTIFIER=y CONFIG_DYNAMIC_FSYNC=y CONFIG_BUILD_ARM64_DT_OVERLAY=y CLANG_TRIPLE=aarch64-linux-android- CROSS_COMPILE=aarch64-linux-android- CONFIG_NO_ERROR_ON_MISMATCH=y jsx_custokernal_h872_defconfig
PATH="/mnt/android-B/clang-master/bin:/mnt/android-B/aarch64-linux-android-4.9/bin:${PATH}" make O=OUT ARCH=arm64 SUBARCH=arm CC=clang DTC_EXT=dtc SELINUX_DEFCONFIG=selinux_defconfig CONFIG_ADRENO_IDLER=y CONFIG_STATE_NOTIFIER=y CONFIG_DYNAMIC_FSYNC=y CONFIG_BUILD_ARM64_DT_OVERLAY=y CLANG_TRIPLE=aarch64-linux-android- CROSS_COMPILE=aarch64-linux-android- CONFIG_NO_ERROR_ON_MISMATCH=y oldconfig
PATH="/mnt/android-B/clang-master/bin:/mnt/android-B/aarch64-linux-android-4.9/bin:${PATH}" make O=OUT ARCH=arm64 SUBARCH=arm CC=clang DTC_EXT=dtc SELINUX_DEFCONFIG=selinux_defconfig CONFIG_ADRENO_IDLER=y CONFIG_STATE_NOTIFIER=y CONFIG_DYNAMIC_FSYNC=y CONFIG_BUILD_ARM64_DT_OVERLAY=y CLANG_TRIPLE=aarch64-linux-android- CROSS_COMPILE=aarch64-linux-android- CONFIG_NO_ERROR_ON_MISMATCH=y nconfig




echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "Compiling"
sleep 1

#export KCFLAGS+="-Wno-enum-conversion -Wno-uninitialized -Wno-logical-not-parentheses \
#-Wno-parentheses -Wno-incompatible-pointer-types -fno-stack-protector \
#-fno-merge-constants -Wno-ignored-optimization-argument -Wno-error \
#-Wno-tautological-constant-out-of-range-compare -Wno-xor-used-as-pow -Wno-fortify-source -O3 -fno-stack-protector"

KBUILD_CFLAGS+="-mcpu=kyro -mcpu=cortex-a72.cortex-a53 -march=armv8-a+fp+simd+crc+crypto -march=armv8-a+fp+simd+crc+crypto"

PATH="/mnt/android-B/clang-master/bin:/mnt/android-B/aarch64-linux-android-4.9/bin:${PATH}" make -j$(nproc --all) O=OUT ARCH=arm64 SUBARCH=arm CC=clang DTC_EXT=dtc SELINUX_DEFCONFIG=selinux_defconfig CONFIG_BUILD_ARM64_DT_OVERLAY=y KCFLAGS+="-Wno-error -O3 -fno-stack-protector -march=armv8-a+fp+simd+crc+crypto"  CLANG_TRIPLE=aarch64-linux-android- CROSS_COMPILE=aarch64-linux-android- CONFIG_NO_ERROR_ON_MISMATCH=y CONFIG_ADRENO_IDLER=y CONFIG_STATE_NOTIFIER=y CONFIG_DYNAMIC_FSYNC=y CONFIG_DEBUG_SECTION_MISMATCH=y V=0

echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "DONE"
echo "Set Normal Speed To Cooldown CPU After Compilation"
/usr/bin/cpupower frequency-set -g schedutil
/usr/sbin/x86_energy_perf_policy normal
#printf "0"  > /sys/devices/system/cpu/cpufreq/boost



rm ANYKERNEL/Image.gz-dtb
cp OUT/arch/arm64/boot/Image.gz-dtb ANYKERNEL/
cd ANYKERNEL/
ls -lash Image.gz-dtb
rm *.zip
zip -r9 H872-jsX-CustoKernal-19-JUNE-2020-TESTBUILD.zip * -x .git README.md *placeholder
ls -lash H872-jsX-CustoKernal-19-JUNE-2020-TESTBUILD.zip
cp H872-jsX-CustoKernal-19-JUNE-2020-TESTBUILD.zip /home/javashin/Desktop/
#adb push UPDATE-H872-AnyKernel3-24-APRIL-2020.zip /sdcard

echo "YAY"
echo "KERNAL KERNAL KERNAL KERNAL KARNAL KARMA KARMA KARMA"
echo "Done By JavaShin-X Carlos Jimenez 2020."
