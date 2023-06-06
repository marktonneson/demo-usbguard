# demo-usbguard
Quick demo of USBGuard functionality and usage

The USBGuard software framework provides system protection against intrusive USB devices by implementing basic whitelisting and blacklisting capabilities based on device attributes.

### Command Reference
To install the usbguard package, enter the following command as root:
```
      # yum install usbguard
```

To create the initial rule set, enter the following command as root:
```
      # usbguard generate-policy > /etc/usbguard/rules.conf
```

Note: To customize the USBGuard rule set, edit the /etc/usbguard/rules.conf file. See the usbguard-rules.conf(5) man page for more information.

Start and enable the service:
```
      # systemctl enable usbguard && systemctl start usbguard
```

To list all USB devices recognized by USBGuard, enter the following command as root:
```
      # usbguard list-devices
```

To authorize a device to interact with the system, use the allow-device option:
```
      # usbguard allow-device [device num]
```

To deauthorize and remove a device from the system, use the reject-device option.
```
      # usbguard reject-device [device num]
```

To just deauthorize a device, use the usbguard command with the block-device option:
```
      # usbguard block-device [device num]
```
### References and Resources
* [Red Hat Documentation - RHEL 7](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-using-usbguard)
* [Red HAt Documentation - RHEL 8](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/security_hardening/protecting-systems-against-intrusive-usb-devices_security-hardening)
