#!/bin/sh

clear

cd `dirname $0`

firefox ./index.htm &
if [ ! "`ps auxw | egrep ./index.htm`" ]; then ( mozilla ./index.htm & ); fi
if [ ! "`ps auxw | egrep ./index.htm`" ]; then ( netscape ./index.htm & ); fi
if [ ! "`ps auxw | egrep ./index.htm`" ]; then ( opera ./index.htm & ); fi
if [ ! "`ps auxw | egrep ./index.htm`" ]; then ( konqueror ./index.htm & ); fi
if [ ! "`ps auxw | egrep ./index.htm`" ]; then echo -e "Please open the file index.htm from the cdrom with your default browser" ; fi

echo "To finish close this terminal window.";

eja.it/qemu.bin -L eja.it/ -k en-us -hda eja.it/eja.img -kernel eja.it/vmlinuz -initrd eja.it/initrd.gz -append "root=/dev/ram" -redir tcp:3520::80 -redir tcp:3521::23 -vnc :3522 -no-kqemu

