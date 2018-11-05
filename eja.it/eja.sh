#!/bin/sh

losetup /dev/loop0 /mnt/eja.it/eja.img 

mount /dev/loop0 /mnt/ 

/mnt/eja.it/eja.sh

umount /mnt/
