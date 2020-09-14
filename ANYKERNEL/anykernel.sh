# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string="Custo-Kernal-JavaShin-X-H872 Kernel For LG G6 T-Mobile R3 Performance Optimore."
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=h872
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
#set_perm_recursive 0 0 755 644 $ramdisk/*;
#set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;


## AnyKernel install
dump_boot;

# begin ramdisk changes

# init.rc
#backup_file init.rc;
#replace_string init.rc "cpuctl cpu,timer_slack" "mount cgroup none /dev/cpuctl cpu" "mount cgroup none /dev/cpuctl cpu,timer_slack";

# init.tuna.rc
#backup_file init.tuna.rc;
#insert_line init.tuna.rc "nodiratime barrier=0" after "mount_all /fstab.lucye" "\tmount ext4 /dev/block/platform/omap/omap_hsmmc.0/by-name/userdata /data remount nosuid nodev noatime nodiratime barrier=0";
#append_file init.tuna.rc "bootscript" init.tuna;

# fstab.lucye
#backup_file fstab.lucye;
#patch_fstab fstab.lucye /system ext4 options "noatime,barrier=1" "noatime,nodiratime,barrier=0";
#patch_fstab fstab.lucye /cache ext4 options "barrier=1" "barrier=0,nomblk_io_submit";
#patch_fstab fstab.lucye /data ext4 options "data=ordered" "nomblk_io_submit,data=writeback";
#append_file fstab.lucye "usbdisk" fstab;

# end ramdisk changes

#ui_print " "
#ui_print "Device: LG G6 (H872)"
#ui_print "Kernel Name: Custo-Kernal-JavaShin-X"
#ui_print "Build User: root"
#ui_print "KVer: 3.18.140-jsX-perf_r3 JavaShin-X-H872 SMP PREEMPT aarch64"
#ui_print "Wed July 08 2020 "
#ui_print "Toolchain Info:"
#ui_print "PROTON CLANG 11.0.0 LTO+POLLY+PGO Optimized."
#ui_print "Cross 64bits/aarch64-linux-gnu-gcc version 10.1.0 (Debian 10.1.0-3) "
#ui_print "CFLAGS/KFLAGS=-O3 -mllvm -polly -fno-stack-protector -mcpu=kryo -mtune=kryo -march=armv8-a+fp+simd+crc+crypto -pipe"

write_boot;
## end install

