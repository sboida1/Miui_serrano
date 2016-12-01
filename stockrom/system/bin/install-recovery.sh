#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8437760 753064e1326407aa50da6a6e44f1a75b32d04d72 5941248 e4fa35e48e55c91b697b5c8084198b5658565c7c
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:8437760:753064e1326407aa50da6a6e44f1a75b32d04d72; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:5941248:e4fa35e48e55c91b697b5c8084198b5658565c7c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 753064e1326407aa50da6a6e44f1a75b32d04d72 8437760 e4fa35e48e55c91b697b5c8084198b5658565c7c:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
