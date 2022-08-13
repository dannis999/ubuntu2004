#!/bin/sh -ex

save_d=/run/mnt/data/system-data/var/log/debug
last_d=$(find $save_d/ -type d -name boot\* | sort | tail -n1)
if [ -z "$last_d" ]; then last_d=0; fi
next_d=$save_d/boot$((${last_d##*boot} + 1))
mkdir -p $next_d
mv /run/log/base/*.svg $next_d

initrd_f=$(find /run/log -maxdepth 1 -name \*.svg -printf "%f" -quit)
if [ -n "$initrd_f" ]; then
    mv /run/log/"$initrd_f" $next_d/initrd-"$initrd_f"
fi
