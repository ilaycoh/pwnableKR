FROM ubuntu:22.04

RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/kr.archive.ubuntu.com/g" /etc/apt/sources.list
RUN sed -i "s/http:\/\/security.ubuntu.com/http:\/\/kr.archive.ubuntu.com/g" /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y socat && \
    rm -rf /var/lib/apt/lists/*

#Adduser
RUN useradd -u 1008 -m mistake

#Copy Binary
COPY mistake /home/mistake/mistake
COPY flag /home/mistake/flag
COPY password /home/mistake/password

#Set Privilege
RUN chown -R mistake:mistake /home/mistake
RUN chmod 440 /home/mistake/flag
RUN chmod 440 /home/mistake/password

USER mistake
WORKDIR /home/mistake
CMD ["socat", "TCP-LISTEN:10008,reuseaddr,fork", "EXEC:/usr/bin/timeout -k 5 300 /home/mistake/mistake,pty,stderr,echo=0"]
EXPOSE 10008
