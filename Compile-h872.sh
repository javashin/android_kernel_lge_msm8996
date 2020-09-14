#!/bin/bash
clear

echo "KERNAL KERNAL KERNAL KERNAL KARNAL KARMA KARMA KARMA"
date
echo "Start Compilation ^^^^^@^^^^  Time"
echo "Set TurboBoost For Faster Android Kernal Compilation"
/usr/bin/cpupower frequency-set -g performance
/usr/sbin/x86_energy_perf_policy performance
echo 0 > /sys/devices/system/cpu/intel_pstate/no_turbo

echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "Preparing"
sleep 1

umount /OUT
rm -rf /OUT
export ARCH=arm64
export SUBARCH=arm
mkdir /OUT
mount /OUT

echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "Configuring"
sleep 1

#####PATH="/mnt/android-B/clang-master/bin:/mnt/android-B/aarch64-linux-android-4.9/bin:${PATH}#
PATH="/mnt/android-B/@/COMPILING/clang-master/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=clang LD=/usr/bin/aarch64-unknown-linux-gnu-ld.bfd DTC_EXT=dtc SELINUX_DEFCONFIG=selinux_defconfig CONFIG_ADRENO_IDLER=y CONFIG_STATE_NOTIFIER=y CONFIG_DYNAMIC_FSYNC=y CONFIG_BUILD_ARM64_DT_OVERLAY=y CLANG_TRIPLE=aarch64-unknown-linux-gnu- CROSS_COMPILE=aarch64-unknown-linux-gnu- CONFIG_NO_ERROR_ON_MISMATCH=y nondebug_defconfig
#tmo_h872_defconfig

#####PATH="/mnt/android-B/clang-master/bin:/mnt/android-B/aarch64-linux-android-4.9/bin:${PATH}# 
PATH="/mnt/android-B/@/COMPILING/clang-master/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=clang LD=/usr/bin/aarch64-unknown-linux-gnu-ld.bfd DTC_EXT=dtc SELINUX_DEFCONFIG=selinux_defconfig CONFIG_ADRENO_IDLER=y CONFIG_STATE_NOTIFIER=y CONFIG_DYNAMIC_FSYNC=y CONFIG_BUILD_ARM64_DT_OVERLAY=y CLANG_TRIPLE=aarch64-unknown-linux-gnu- CROSS_COMPILE=aarch64-unknown-linux-gnu- CONFIG_NO_ERROR_ON_MISMATCH=y oldconfig

#####PATH="/mnt/android-B/clang-master/bin:/mnt/android-B/aarch64-linux-android-4.9/bin:${PATH}# 
PATH="/mnt/android-B/@/COMPILING/clang-master/bin:${PATH}" make O=/OUT ARCH=arm64 SUBARCH=arm CC=clang LD=/usr/bin/aarch64-unknown-linux-gnu-ld.bfd DTC_EXT=dtc SELINUX_DEFCONFIG=selinux_defconfig CONFIG_ADRENO_IDLER=y CONFIG_STATE_NOTIFIER=y CONFIG_DYNAMIC_FSYNC=y CONFIG_BUILD_ARM64_DT_OVERLAY=y CLANG_TRIPLE=aarch64-unknown-linux-gnu- CROSS_COMPILE=aarch64-unknown-linux-gnu- CONFIG_NO_ERROR_ON_MISMATCH=y nconfig


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
#export PATH="/COMPILING/clang-master/bin:${PATH}"
#KBUILD_CFLAGS+="-mcpu=kyro -mcpu=cortex-a72.cortex-a53 -march=armv8-a+fp+simd+crc+crypto -march=armv8-a+fp+simd+crc+crypto"




export KCFLAGS+="-Wno-error -O3 -mllvm -polly -fno-stack-protector -fno-builtin-stpcpy -march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo -pipe"
export KBUILD_CFLAGS+="-Wno-error -O3 -mllvm -polly -fno-stack-protector -fno-builtin-stpcpy -march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo -pipe"

PATH="/mnt/android-B/@/COMPILING/clang-master/bin:${PATH}" make -j3 O=/OUT ARCH=arm64 SUBARCH=arm CC=clang LD=/usr/bin/aarch64-unknown-linux-gnu-ld.bfd DTC_EXT=dtc SELINUX_DEFCONFIG=selinux_defconfig CONFIG_BUILD_ARM64_DT_OVERLAY=y KCFLAGS+="-Wno-error -O3 -mllvm -polly -fno-stack-protector -fno-builtin-stpcpy -march=armv8-a+fp+simd+crc+crypto -mcpu=kryo -mtune=kryo -pipe" CLANG_TRIPLE=aarch64-unknown-linux-gnu- CROSS_COMPILE=aarch64-unknown-linux-gnu- CONFIG_NO_ERROR_ON_MISMATCH=y CONFIG_ADRENO_IDLER=y CONFIG_STATE_NOTIFIER=y CONFIG_DYNAMIC_FSYNC=y CONFIG_DEBUG_SECTION_MISMATCH=y V=0

echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "DONE"
echo "Set Normal Speed To Cooldown CPU After Compilation"
/usr/bin/cpupower frequency-set -g schedutil
/usr/sbin/x86_energy_perf_policy normal
echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo

rm ANYKERNEL/Image.gz-dtb
cp /OUT/arch/arm64/boot/Image.gz-dtb ANYKERNEL/
cd ANYKERNEL/
ls -lash Image.gz-dtb
rm *.zip
zip -r9 H872-jsX-BvD_rV1+13-Sep-2020.zip * -x .git README.md *placeholder
ls -lash H872-jsX-BvD_rV1+13-Sep-2020.zip
cp H872-jsX-BvD_rV1+13-Sep-2020.zip /home/

echo "YAY"
echo "KERNAL KERNAL KERNAL KERNAL KARNAL KARMA KARMA KARMA"
echo "Done By JavaShin-X Carlos Jimenez 2020."
