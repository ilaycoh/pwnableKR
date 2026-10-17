FROM ubuntu:22.04

RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/kr.archive.ubuntu.com/g" /etc/apt/sources.list
RUN sed -i "s/http:\/\/security.ubuntu.com/http:\/\/kr.archive.ubuntu.com/g" /etc/apt/sources.list

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y perl python3 libc6:i386 libseccomp2:i386 && \
    rm -rf /var/lib/apt/lists/*

#Adduser
RUN useradd -u 1116 -m horcruxes_pwn

#Copy Binary
COPY horcruxes /home/horcruxes_pwn/horcruxes
COPY flag /home/horcruxes_pwn/flag
COPY super.pl /home/horcruxes_pwn/super.pl

#Set Privilege
RUN chown -R root:horcruxes_pwn /home/horcruxes_pwn
RUN chmod 755 /home/horcruxes_pwn/horcruxes
RUN chmod 440 /home/horcruxes_pwn/flag
RUN chmod 550 /home/horcruxes_pwn/super.pl

WORKDIR /home/horcruxes_pwn
USER horcruxes_pwn
CMD ["perl", "/home/horcruxes_pwn/super.pl"]
EXPOSE 10016
