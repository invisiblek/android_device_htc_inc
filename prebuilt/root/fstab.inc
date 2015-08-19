boot                     /boot            mtd     defaults                                                                    recoveryonly
recovery                 /recovery        mtd     defaults                                                                    recoveryonly
misc                     /misc            mtd     defaults                                                                    recoveryonly

/dev/block/mmcblk0p1     /system          ext4    ro,noatime,data=ordered                                                     wait
/dev/block/mmcblk0p2     /cache           ext4    noatime,nosuid,nodev,barrier=1,data=ordered,noauto_da_alloc,journal_async_commit,errors=panic wait,check
/dev/block/mmcblk0p3     /data            ext4    noatime,nosuid,nodev,barrier=1,data=ordered,noauto_da_alloc,journal_async_commit,errors=panic wait,check
