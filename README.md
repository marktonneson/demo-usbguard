# demo-usbguard
Quick demo of USBGuard functionality and usage

The USBGuard software framework provides system protection against intrusive USB devices by implementing basic whitelisting and blacklisting capabilities based on device attributes.

### Command Reference
To install the usbguard package, enter the following command as root:
```
<<<<<<< HEAD
      # yum install usbguard
=======
# yum install usbguard
>>>>>>> d8090aee9fab6fbb7bc06f7ae56e19f15f192be6
```

To create the initial rule set, enter the following command as root:
```
<<<<<<< HEAD
      # usbguard generate-policy > /etc/usbguard/rules.conf
=======
# usbguard generate-policy > /etc/usbguard/rules.conf
>>>>>>> d8090aee9fab6fbb7bc06f7ae56e19f15f192be6
```

Note: To customize the USBGuard rule set, edit the /etc/usbguard/rules.conf file. See the usbguard-rules.conf(5) man page for more information.

Start and enable the service:
```
<<<<<<< HEAD
      # systemctl enable usbguard && systemctl start usbguard
=======
# systemctl enable usbguard && systemctl start usbguard
>>>>>>> d8090aee9fab6fbb7bc06f7ae56e19f15f192be6
```

To list all USB devices recognized by USBGuard, enter the following command as root:
```
<<<<<<< HEAD
      # usbguard list-devices
=======
# usbguard list-devices
>>>>>>> d8090aee9fab6fbb7bc06f7ae56e19f15f192be6
```

To authorize a device to interact with the system, use the allow-device option:
```
<<<<<<< HEAD
      # usbguard allow-device [device num]
=======
# usbguard allow-device [device num]
>>>>>>> d8090aee9fab6fbb7bc06f7ae56e19f15f192be6
```

To deauthorize and remove a device from the system, use the reject-device option.
```
<<<<<<< HEAD
      # usbguard reject-device [device num]
=======
# usbguard reject-device [device num]
>>>>>>> d8090aee9fab6fbb7bc06f7ae56e19f15f192be6
```

To just deauthorize a device, use the usbguard command with the block-device option:
```
<<<<<<< HEAD
      # usbguard block-device [device num]
```
### References and Resources
* [Red Hat Documentation - RHEL 7](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-using-usbguard)
=======
# usbguard block-device [device num]
```

[Reference Documentation](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-using-usbguard)
>>>>>>> d8090aee9fab6fbb7bc06f7ae56e19f15f192be6
