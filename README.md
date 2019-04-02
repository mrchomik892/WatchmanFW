# WatchmanFW 0.2x

Simple scripts for security in computer networks

Requirements:
- Linux machine
- Syslogd
- Mailserver (if You want recieved messages on email)
- Python3

# Quick install:

git clone https://github.com/futszak/WatchmanFW.git

cd WatchmanFW

chmod u+x watchmanfw

mv watchmanfw-sample.ini watchmanfw.ini

(edit watchmanfw.ini)

./watchmanfw &

# How its works ?

Syslog on linux machine recieved information (in UDP datagrams) about operations on local machine and on remote machines and writing in one or many files (look at /etc/rsyslog.conf).


Apr  2 09:25:42 menel sshd[31688]: pam_unix(sshd:auth): check pass; user unknown

Apr  2 09:25:42 menel sshd[31688]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=218.89.241.68

Apr  2 09:25:44 menel sshd[31688]: Failed password for invalid user vf from 218.89.241.68 port 34030 ssh2

Apr  2 09:25:44 menel sshd[31688]: Received disconnect from 218.89.241.68 port 34030:11: Bye Bye [preauth]

Apr  2 09:25:44 menel sshd[31688]: Disconnected from 218.89.241.68 port 34030 [preauth]

Apr  2 09:25:49 menel sshd[31690]: Accepted password for boss from 79.184.14.173 port 57860 ssh2


In logs is many information about failed login attempts, this is information noiss. If i have small server (example VPS on qnap disk storage), important information (in real time) for me is about successful login attempt.

Warchmanfw reading in real time there information and checks compliance with standard strings.


example1:

/etc/watchmanfw/boss@mydomain.com:

menel,Accepted password for boss


If on machine menel user boss was logged (strings "menel" and "Accepted password for boss") watchmanfw sending email to user boss@mydomain.com witch information about this.


example2:

/etc/watchmanfw/admin@mydomain.com:

menel,Accepted password for


If on machine menel any user (also boss) was logged (strings "menel" and "Accepted password for") watchmanfw sending email to user admin@mydomain.com witch information about this.
