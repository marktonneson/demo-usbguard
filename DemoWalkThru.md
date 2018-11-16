# USBGuard Demo WalkThru

## Requirements
* Minimum VM: 1vCPU x 1GB mem, running RHEL 7
* If using VM, make sure USB passthrough is enabled
* USB stick for testing

## WalkThru:
* Setup via usbguard-setup.sh
  * Installs usbguard package
	* Generates initial policy and displays policy
	* Starts service
	* Creates local users for testing
  * Will need root or sudo to execute
* List devices
```
# usbguard list-devices
```
* Plug-in new device
  * Run above command again, notice that the new device is blocked
* Enable new device, replace [device number] with the correct number from the list-devices output
  * Mount device (example below, edit mount command to match your device and environment)
```
# usbguard allow-device [device number]
# mount /dev/sda1 /mnt
```
* Block new device, check mount (it should be gone)
```
# usbguard block-device [device number]
# ls /mnt
```
* Examine /etc/usbguard/usbguard-daemon.conf file
  * It is well documented, note the default policies
* Run usbguard-example.sh
  * It will step thru creating custom rules
  * Also modifies config to allow non-root users to use usbguard
* Test non-root user
  * Reinstate original configuration
	```
	# usbguard generate-policy > /etc/usbguard/rules.conf
	# systemctl restart usbguard
	```
  * Login (or su) as usbuser
	* List devices
	```
	$ usbguard list-devices
	```
	* Plug in USB and as non-root user allow that device
	```
	$ usbguard allow-device [device number]
	```
* Extra Credit: Test non-root user w/o usbguard privileges
  * Login (or su) as nousbuser
	* List devices (should fail)
	```
	$ usbguard list-devices
	```
	* Plug in USB and as non-root user allow that device (should fail)
	```
	$ usbguard allow-device [device number]
	```
* Cleanup via usbguard-cleanup.sh
  * Optional if demo VM is disposable
