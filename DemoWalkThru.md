# USBGuard
### Demo walkthru:
* Run usbguard-setup.sh = Install, generate policy, view policy, start service
* List devices
* Plug-in new device
* Enable new device, mount device
* Reject new device, check mount
* Examine usbguard-daemon.conf file, Whitelist and Blacklist options
* Run usbguard-example.sh, test user, test mount new device

### Command Reference
To install the usbguard package, enter the following command as root:
	
```# yum install usbguard```

To create the initial rule set, enter the following command as root:

```# usbguard generate-policy > /etc/usbguard/rules.conf```

Note: To customize the USBGuard rule set, edit the /etc/usbguard/rules.conf file. See the usbguard-rules.conf(5) man page for more information.

Start and enable the service:

```# systemctl enable usbguard && systemctl start usbguard```

To list all USB devices recognized by USBGuard, enter the following command as root:

```# usbguard list-devices```

To authorize a device to interact with the system, use the allow-device option:

```# usbguard allow-device [N]```

To deauthorize and remove a device from the system, use the reject-device option. 

```# usbguard reject-device [N]```

To just deauthorize a device, use the usbguard command with the block-device option:

```# usbguard block-device [N]```

[Reference Documentation](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-using-usbguard)
