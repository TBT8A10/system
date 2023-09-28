#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery:100663296:73da245c8386fd0ffa2fab3eed75de5ac585456b; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot:33554432:b22992b07ea10b7592b2a070b3feae3c5c6467c7 \
          --target EMMC:/dev/block/by-name/recovery:100663296:73da245c8386fd0ffa2fab3eed75de5ac585456b && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
