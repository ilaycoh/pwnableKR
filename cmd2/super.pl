#!/usr/bin/perl
use Socket;

$port = 10013;
@exec = (
    "/usr/bin/socat",
    "STDIO",
    "EXEC:/usr/bin/unshare -m /loader.sh,pty,stderr,setsid,ctty,sigint,sane,echo=0"
);

socket(SERVER, PF_INET, SOCK_STREAM, 6);
setsockopt(SERVER, SOL_SOCKET, SO_REUSEADDR, pack("l", 1));
bind(SERVER, sockaddr_in($port, INADDR_ANY));
listen(SERVER, SOMAXCONN);

$SIG{"CHLD"} = "IGNORE";

while ($addr = accept CLIENT, SERVER) {
    $| = 1;

    ($port, $packed_ip) = sockaddr_in($addr);
    $datestring = localtime();
    $ip = inet_ntoa($packed_ip);

    print "$ip: $port connected($datestring)\r\n";

    fork || do {
        $| = 1;

        close SERVER;
        open STDIN,  "<&CLIENT";
        open STDOUT, ">&CLIENT";
        open STDERR, ">&CLIENT";
        close CLIENT;

        print "=================================================================================\r\n";
        print "  [ CMD2 Shell ]\r\n";
        print "  Daddy bought me a system command shell.\r\n";
        print "  but he put some filters to prevent me from playing with it without his permission...\r\n";
        print "  but I wanna play anytime I want!\n\r\n";
        print "  ※ You got 500s in /bin/sh. Good luck.\r\n";
        print "  ※ Available: python3\r\n";
        print "  ※ Interactive terminal available: vim-tiny nano\r\n";
        print "=================================================================================\r\n";

        exec @exec;
        exit 0;
    };

    close CLIENT;
}

close SERVER;
