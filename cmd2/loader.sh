#!/bin/bash

secret_dir=`mktemp -d --tmpdir=/tmp`

mount -n -o size=50m -t tmpfs tmpfs $secret_dir
cp /home/cmd2_pwn/cmd2 $secret_dir
cp /home/cmd2_pwn/cmd2.c $secret_dir
cp /home/cmd2_pwn/flag $secret_dir
chown -R cmd2_pwn:cmd2_pwn $secret_dir
chmod 111 /tmp
chmod 777 $secret_dir
chmod 2755 $secret_dir/cmd2
chmod 440 $secret_dir/flag
cd $secret_dir

timeout --preserve-status -k 5s 500s su cmd2 -c 'TERM=xterm-256color script -qefc "stty sane rows 40 cols 120; exec /bin/sh -i" /dev/null'

cd /
umount -f $secret_dir 2>/dev/null
rm -rf $secret_dir 2>/dev/null
