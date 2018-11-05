@echo off
REM Copyright 2007 Ubaldo Porcheddu <ubaldo@eja.it>
cls

ver | find  "95" > NUL
if not errorlevel 1 goto LOADLIN

start /w regedit /E %TEMP%\eja.reg "HKEY_CURRENT_USER\Software\Microsoft\Internet Connection Wizard"
find /i "completed" %TEMP%\eja.reg > NUL
if not errorlevel 1 goto QEMU
start /w regedit /s eja.it\win.reg
del %TEMP%\eja.reg
echo registro

:QEMU
start index.htm
@echo Il programma e' in esecuzione, per terminare e' necessario chiudere questa finestra.
eja.it\qemu.exe -m 64 -L eja.it -k en-us  -hda eja.it\eja.img -kernel eja.it\vmlinuz -initrd eja.it\initrd.gz -append "root=/dev/ram" -redir tcp:3520::80 -redir tcp:3521::23 -vnc :3522 -no-kqemu
exit


:LOADLIN
@echo Non e' possibile eseguire il programma in modalita' virtuale, il sistema provera' ora ad eseguirlo in modalita' nativa.
copy eja.it\loadlin.exe %TEMP% /Y
copy eja.it\vmlinuz %TEMP% /Y
copy eja.it\initrd.gz %TEMP% /Y
copy eja.it\loadlin.pif %TEMP% /Y
start %TEMP%\loadlin.exe %TEMP%\vmlinuz root=/dev/ram initrd=%TEMP%\initrd.gz vga=791 console=ttyS0 
exit


