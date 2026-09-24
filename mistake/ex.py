from pwn import *

r = remote("pwnable.kr",10008)
r.recv(1024)


r.sendline(b'0000000000')
r.recv(1024)


r.sendline(b'1111111111')
r.recv(1024)
flag = r.recv(1024)
print(flag)


