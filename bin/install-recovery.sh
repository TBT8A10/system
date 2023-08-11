#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery:100663296:385dd8796cfaf7b7f79489116039c2114cd23a91; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot:33554432:a3f47a03ebf6550e6516f59b4f0ee0bd7cca5aa3 \
          --target EMMC:/dev/block/by-name/recovery:100663296:385dd8796cfaf7b7f79489116039c2114cd23a91 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
