#!/bin/bash
clear

echo "KERNAL KERNAL KERNAL KERNAL KARNAL KARMA KARMA KARMA"
date
echo "Start Compilation ^^^^^@^^^^  Time"
echo "Set TurboBoost For Faster Android Kernal Compilation"
/usr/bin/cpupower frequency-set -g performance
/usr/sbin/x86_energy_perf_policy performance
echo "1" > /sys/devices/system/cpu/intel_pstate/no_turbo

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


export DTC_EXT=dtc
export CROSS_COMPILE=/usr/bin/aarch64-unknown-linux-gnu-
export CROSS_COMPILE_ARM32=/usr/bin/armv7-unknown-linux-gnueabihf-
export CC=/usr/bin/aarch64-unknown-linux-gnu-gcc
export LD=/usr/bin/aarch64-unknown-linux-gnu-ld.bfd
export AR=/usr/bin/aarch64-unknown-linux-gnu-ar
export AS=/usr/bin/aarch64-unknown-linux-gnu-as
export NM=/usr/bin/aarch64-unknown-linux-gnu-nm
export RANLIB=/usr/bin/aarch64-unknown-linux-gnu-ranlib
export STRIP=/usr/bin/aarch64-unknown-linux-gnu-strip
export OBJCOPY=/usr/bin/aarch64-unknown-linux-gnu-objcopy
export OBJDUMP=/usr/bin/aarch64-unknown-linux-gnu-objdump
export HOSTCC=/usr/bin/aarch64-unknown-linux-gnu-gcc
export HOSTLD=/usr/bin/aarch64-unknown-linux-gnu-ld.bfd
export HOSTAR=/usr/bin/aarch64-unknown-linux-gnu-gcc-ar


export KCFLAGS+="-O3 -march=armv8-a+fp+simd+crc+crypto -mcpu=cortex-a72.cortex-a53 -mtune=cortex-a72.cortex-a53 -falign-functions=32 -flimit-function-alignment -fno-math-errno -fno-trapping-math -fgraphite-identity -floop-nest-optimize -fno-stack-protector -fno-strict-aliasing --param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14"
export KBUILD_CFLAGS+="-O3 -march=armv8-a+fp+simd+crc+crypto -mcpu=cortex-a72.cortex-a53 -mtune=cortex-a72.cortex-a53 -falign-functions=32 -flimit-function-alignment -fno-math-errno -fno-trapping-math -fgraphite-identity -floop-nest-optimize -fno-stack-protector -fno-strict-aliasing --param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14"

PATH="${PATH}" make -j3 O=/OUT ARCH=arm64 SUBARCH=arm CC=aarch64-unknown-linux-gnu-gcc LD=aarch64-unknown-linux-gnu-ld.bfd DTC_EXT=dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y KCFLAGS+="-O3 -march=armv8-a+fp+simd+crc+crypto -mcpu=cortex-a72.cortex-a53 -mtune=cortex-a72.cortex-a53 -falign-functions=32 -flimit-function-alignment -fno-math-errno -fno-trapping-math -fgraphite-identity -floop-nest-optimize -fno-stack-protector -fno-strict-aliasing --param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14" CONFIG_NO_ERROR_ON_MISMATCH=y CONFIG_ADRENO_IDLER=y CONFIG_STATE_NOTIFIER=y CONFIG_DYNAMIC_FSYNC=y CONFIG_DEBUG_SECTION_MISMATCH=y h872_gcc_defconfig

PATH="${PATH}" make -j3 O=/OUT ARCH=arm64 SUBARCH=arm CC=aarch64-unknown-linux-gnu-gcc LD=aarch64-unknown-linux-gnu-ld.bfd DTC_EXT=dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y KCFLAGS+="-O3 -march=armv8-a+fp+simd+crc+crypto -mcpu=cortex-a72.cortex-a53 -mtune=cortex-a72.cortex-a53 -falign-functions=32 -flimit-function-alignment -fno-math-errno -fno-trapping-math -fgraphite-identity -floop-nest-optimize -fno-stack-protector -fno-strict-aliasing --param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14" CONFIG_NO_ERROR_ON_MISMATCH=y CONFIG_ADRENO_IDLER=y CONFIG_STATE_NOTIFIER=y CONFIG_DYNAMIC_FSYNC=y CONFIG_DEBUG_SECTION_MISMATCH=y oldconfig

PATH="${PATH}" make -j3 O=/OUT ARCH=arm64 SUBARCH=arm CC=aarch64-unknown-linux-gnu-gcc LD=aarch64-unknown-linux-gnu-ld.bfd DTC_EXT=dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y KCFLAGS+="-O3 -march=armv8-a+fp+simd+crc+crypto -mcpu=cortex-a72.cortex-a53 -mtune=cortex-a72.cortex-a53 -falign-functions=32 -flimit-function-alignment -fno-math-errno -fno-trapping-math -fgraphite-identity -floop-nest-optimize -fno-stack-protector -fno-strict-aliasing --param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14" CONFIG_NO_ERROR_ON_MISMATCH=y CONFIG_ADRENO_IDLER=y CONFIG_STATE_NOTIFIER=y CONFIG_DYNAMIC_FSYNC=y CONFIG_DEBUG_SECTION_MISMATCH=y nconfig



echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "Compiling"
sleep 1


PATH="${PATH}" make -j3 O=/OUT ARCH=arm64 SUBARCH=arm CC=aarch64-unknown-linux-gnu-gcc LD=aarch64-unknown-linux-gnu-ld.bfd DTC_EXT=dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y KCFLAGS+="-O3 -march=armv8-a+fp+simd+crc+crypto -mcpu=cortex-a72.cortex-a53 -mtune=cortex-a72.cortex-a53 -falign-functions=32 -flimit-function-alignment -fno-math-errno -fno-trapping-math -fgraphite-identity -floop-nest-optimize -fno-stack-protector -fno-strict-aliasing --param=inline-min-speedup=15 --param=max-inline-insns-single=200 --param=max-inline-insns-auto=30 --param=early-inlining-insns=14" CONFIG_NO_ERROR_ON_MISMATCH=y CONFIG_ADRENO_IDLER=y CONFIG_STATE_NOTIFIER=y CONFIG_DYNAMIC_FSYNC=y CONFIG_DEBUG_SECTION_MISMATCH=y V=0

echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "Boot-Image-Done."

cp /OUT/arch/arm64/boot/Image.gz-dtb .

echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "##################################################"
echo "DONE"

echo "Set Normal Speed To Cooldown CPU After Compilation"
/usr/bin/cpupower frequency-set -g powersave
/usr/sbin/x86_energy_perf_policy power
echo "1" > /sys/devices/system/cpu/intel_pstate/no_turbo


ls -lash /OUT/arch/arm64/boot/Image.gz-dtb
ls -lash ./Image.gz-dtb

#ls -lash /OUT/drivers/staging/prima/wlan.ko
#ls -lash  ./wlan.ko

python2 libufdt/src/mkdtboimg.py create /OUT/arch/arm64/boot/dtbo.img /OUT/arch/arm64/boot/dts/qcom/*.dtbo
cp /OUT/arch/arm64/boot/dtbo.img .
ls -lash /OUT/arch/arm64/boot/dtbo.img
ls -lash  ./dtbo.img

cp ./dtbo.img ./Image.gz-dtb ANYKERNEL/
#cp ./wlan.ko ANYKERNEL/modules/system/lib/modules/pronto/pronto_wlan.ko

cd ANYKERNEL/
rm 3.18.140*.zip
zip -r9 3.18.140-jsX-BvD_rV1+H872-Sun-September-13-2020.zip * -x .git README.md *placeholder
cp 3.18.140-jsX-BvD_rV1+H872-Sun-September-13-2020.zip /home/javashin/Desktop/
ls -lash 3.18.140-jsX-BvD_rV1+H872-Sun-September-13-2020.zip ; pwd ; cd .. ; pwd


echo "done"


echo "YAY"
echo "KERNAL KERNAL KERNAL KERNAL KARNAL KARMA KARMA KARMA"
echo "DONE By JavaShin-X 2020"



