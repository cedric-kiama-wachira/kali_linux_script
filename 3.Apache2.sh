#!/bin/bash
systemctl start apache2
systemctl enable apache2

a2enmod ssl
s
mv 