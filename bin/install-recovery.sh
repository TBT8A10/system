#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery:100663296:7959133e95fd35fd8d0bf081009671497001737c; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot:33554432:7de228094c520d6bb0a99ef62bfb1ed7c6fb9f56 \
          --target EMMC:/dev/block/by-name/recovery:100663296:7959133e95fd35fd8d0bf081009671497001737c && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
