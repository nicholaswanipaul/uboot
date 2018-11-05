#!/bin/sh

clear

echo "To finish close this terminal window.";

cd `dirname $0`

open ./index.htm &

eja.it/qemu.mac -L eja.it/ -k en-us -hda eja.it/eja.img -kernel eja.it/vmlinuz -initrd eja.it/initrd.gz -append "root=/dev/ram" -redir tcp:3520::80 -redir tcp:3521::23 -vnc :3522

