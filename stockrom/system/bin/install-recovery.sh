#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8439808 51bd7e95de71d0b9d8605668b01ca8bc20124064 5943296 b54818953abb311a24f5cbfb51d200c3ebae2e28
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:8439808:51bd7e95de71d0b9d8605668b01ca8bc20124064; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:5943296:b54818953abb311a24f5cbfb51d200c3ebae2e28 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 51bd7e95de71d0b9d8605668b01ca8bc20124064 8439808 b54818953abb311a24f5cbfb51d200c3ebae2e28:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
