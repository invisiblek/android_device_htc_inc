# mount point	fstype		device			[device2]

/misc		mtd		misc
/recovery	mtd		recovery
/boot		mtd		boot

/system		ext4		/dev/block/mmcblk0p1	NULL			ext3
/cache		ext4		/dev/block/mmcblk0p2	NULL			ext3
/data		ext4		/dev/block/mmcblk0p3

/sd-ext		auto		/dev/block/mmcblk1p1	/dev/block/mmcblk1
