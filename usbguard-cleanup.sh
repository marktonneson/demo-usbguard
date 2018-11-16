#!/bin/bash

echo -e "
Cleaning up ...
"
yum remove -y usbguard
rm -f /root/rules.conf
rm -rf /etc/usbguard
rm -rf /var/log/usbguard
groupdel usbguard
userdel -rf usbuser
userdel -rf nousbuser
