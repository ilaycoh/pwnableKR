FROM ubuntu:22.04

RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/kr.archive.ubuntu.com/g" /etc/apt/sources.list
RUN sed -i "s/http:\/\/security.ubuntu.com/http:\/\/kr.archive.ubuntu.com/g" /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y socat libseccomp2 && \
    rm -rf /var/lib/apt/lists/*

#Adduser
RUN useradd -u 1015 -m asm
RUN useradd -u 1115 -m asm_pwn

#Copy Binary
COPY asm /home/asm_pwn/asm
COPY this_is_pwnable.kr_flag_file_please_read_this_file.sorry_the_file_name_is_very_loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo0000000000000000000000000ooooooooooooooooooooooo000000000000o0o0o0o0o0o0ong /home/asm_pwn/this_is_pwnable.kr_flag_file_please_read_this_file.sorry_the_file_name_is_very_loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo0000000000000000000000000ooooooooooooooooooooooo000000000000o0o0o0o0o0o0ong

#Set Privilege
RUN chown root:asm_pwn /home/asm_pwn/asm
RUN chown root:asm_pwn "/home/asm_pwn/this_is_pwnable.kr_flag_file_please_read_this_file.sorry_the_file_name_is_very_loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo0000000000000000000000000ooooooooooooooooooooooo000000000000o0o0o0o0o0o0ong"
RUN chmod 2550 /home/asm_pwn/asm
RUN chmod 440 "/home/asm_pwn/this_is_pwnable.kr_flag_file_please_read_this_file.sorry_the_file_name_is_very_loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo0000000000000000000000000ooooooooooooooooooooooo000000000000o0o0o0o0o0o0ong"

USER asm_pwn
WORKDIR /home/asm_pwn
CMD ["socat", "TCP-LISTEN:10015,reuseaddr,fork", "EXEC:/usr/bin/timeout -k 5 300 /home/asm_pwn/asm,pty,stderr,raw,echo=0"]
EXPOSE 10015
