#!/bin/sh

mkisofs -V "camilliani" -o ../uboot.iso -b eja.it/isolinux.bin -c eja.it/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -l -r -J ./

#To make a bootable cd iso 



