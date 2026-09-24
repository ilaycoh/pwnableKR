FROM ubuntu:22.04

RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/kr.archive.ubuntu.com/g" /etc/apt/sources.list
RUN sed -i "s/http:\/\/security.ubuntu.com/http:\/\/kr.archive.ubuntu.com/g" /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y socat && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -u 1005 -m random_pwn

COPY random /home/random_pwn/random
COPY flag /home/random_pwn/flag

RUN chown root:random_pwn /home/random_pwn/random /home/random_pwn/flag
RUN chmod 550 /home/random_pwn/random
RUN chmod 440 /home/random_pwn/flag

USER random_pwn
WORKDIR /home/random_pwn
CMD ["socat", "TCP-LISTEN:10005,reuseaddr,fork", "EXEC:/usr/bin/timeout -k 5 300 /home/random_pwn/random,pty,stderr,echo=0"]
EXPOSE 10005
