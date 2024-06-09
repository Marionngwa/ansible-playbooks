#!/bin/bash

ansible ws -m command -a "sudo yum install httpd -y"
ansible all -m command -a "uptime"
ansible db -m command -a 'echo "hello, friend" > /tmp/hello.txt'

