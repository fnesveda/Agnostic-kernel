## Agnostic kernel
A filesystem independent kernel flasher (not only) for the Nexus 7 2012.

[Support thread on XDA-developers](http://forum.xda-developers.com/showthread.php?t=2748975)

This is a recovery tool primarily made for kernel/ROM developers, but anyone is welcome to use it, provided he knows what to do. It was made to enable kernel developers to have a single .zip with the kernel which will work on all partition layouts like All-F2FS, Data-F2FS and All-EXT4 (the standard layout).
It takes a boot.img, unpacks it during the installation, finds out what partition layout is used on the device, changes the fstab in the ramdisk accordingly, repacks the boot.img and flashes it.

If you just want to use Agnostic kernel, you'll find more info in the [support thread](http://forum.xda-developers.com/showthread.php?t=2748975).

This repository is rather a working folder I use to create the kernel zips. When you run make in the folder, it takes all the img files in images/ and creates corresponding agnostic-kernel zips in out/. Kinda boring.
