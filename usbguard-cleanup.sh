#!/bin/bash

yum remove -y usbguard
rm -f /root/rules.conf
rm -rf /etc/usbguard
rm -rf /var/log/usbguard
groupdel usbguard
