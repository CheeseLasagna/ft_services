#!/bin/sh

ssh-keygen -A
/usr/sbin/sshd
nginx -g 'daemon off;'
