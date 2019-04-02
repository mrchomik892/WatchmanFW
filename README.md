# WatchmanFW 0.2x
Simple scripts for security in computer networks
## Requirements:
- Linux machine
- Syslogd
- Mailserver (if You want recieved messages on email)
- Python3

## Quick install:

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

Apr  2 09:25:49 menel sshd[31690]: Accepted password for trainee from 79.184.14.173 port 57860 ssh2


In logs is many information about failed login attempts, this is information noiss. If i have small server (example VPS on qnap disk storage), important information (in real time) for me is about successful login attempt.

Warchmanfw reading in real time there information and checks compliance with standard strings.


example 1:

/etc/watchmanfw/trainee@mydomain.com:

menel,Accepted password for trainee


If on machine menel ustr trainee was logged (strings "menel" and "Accepted password for trainee") watchmanfw sending email to user trainee@mydomain.com witch information about this.


example 2:

/etc/watchmanfw/admin@mydomain.com:

menel,Accepted password for


If on machine menel any user (also trainee) was logged (strings "menel" and "Accepted password for") watchmanfw sending email to user admin@mydomain.com witch information about this.


# Second functionality (for Mikrotik)

This functionality is as port knocking, but this is "correct login knocking".

/etc/watchmanfw/watchmanfw.ini


[mikrotik]

address = address of Your Mikrotik

username = username

password = password

whitelist = whitelist

timeout = 1d


[machine]

name = machine_name

user = username

lstring = Accepted password for


Section [mikrotik] this is credential for API in main router Mikrotik. Section [machine] has correct login strings. If there are in logs, api added source address to the whitelist (whitelist name in [mikrotik] section) on specified in timeout (section [mikrotik]) time.


Next you should add sections on your mikrotik:

/ip firewall address-list

add address=external_address list=my

add address=watchmanfw_address list=whitelist

/ip firewall filter

add action=accept chain=input comment="pass syn packets for whitelist" dst-address-list=my protocol=tcp src-address-list=whitelist

add action=drop chain=input comment="drop all if no whitelist" dst-address-list=my protocol=tcp

# files

follow.py - function for reading syslog files

sndmail.py - function for sending mails

watchmanfw - main script

watchmanfw.ini - config for main script

watchmanFW.png - functionality on graphic
