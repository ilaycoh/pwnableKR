FROM ubuntu:22.04

ENV TERM xterm-256color

RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/kr.archive.ubuntu.com/g" /etc/apt/sources.list
RUN sed -i "s/http:\/\/security.ubuntu.com/http:\/\/kr.archive.ubuntu.com/g" /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y perl python3 socat vim-tiny nano && \
    rm -rf /var/lib/apt/lists/*

# Add users
RUN useradd -u 1013 -m cmd2
RUN useradd -u 1113 -m cmd2_pwn

# Copy binary
COPY cmd2 /home/cmd2_pwn/cmd2
COPY cmd2.c /home/cmd2_pwn/cmd2.c
COPY flag /home/cmd2_pwn/flag
COPY loader.sh /loader.sh
COPY super.pl /super.pl

# Set privileges
RUN chown -R root:cmd2_pwn /home/cmd2_pwn
RUN chmod 551 /home
RUN chmod 2755 /home/cmd2_pwn/cmd2
RUN chmod 755 /home/cmd2_pwn/cmd2.c
RUN chmod 440 /home/cmd2_pwn/flag
RUN chmod 755 /loader.sh
RUN chmod 755 /super.pl

WORKDIR /home/cmd2
CMD ["perl", "/super.pl"]

EXPOSE 10013
