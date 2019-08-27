<<<<<<< HEAD
## USBGuard Demo WalkThru

### Requirements
* Minimum VM: 1vCPU x 1GB mem, running RHEL 7.latest or RHEL 8.latest
* If using VM, make sure USB passthrough is enabled
* USB stick for testing

### WalkThru:
=======
# USBGuard Demo WalkThru

## Requirements
* Minimum VM: 1vCPU x 1GB mem, running RHEL 7
* If using VM, make sure USB passthrough is enabled
* USB stick for testing

## WalkThru:
>>>>>>> d8090aee9fab6fbb7bc06f7ae56e19f15f192be6
* Setup via usbguard-setup.sh
  * Installs usbguard package
	* Generates initial policy and displays policy
	* Starts service
	* Creates local users for testing
  * Will need root or sudo to execute
* List devices
```
<<<<<<< HEAD
      # usbguard list-devices
=======
# usbguard list-devices
>>>>>>> d8090aee9fab6fbb7bc06f7ae56e19f15f192be6
```
* Plug-in new device (and redirect it if using a VM)
  * Run above command again, notice that the new device is blocked
* Enable new device, replace [device number] with the correct number from the list-devices output
```
<<<<<<< HEAD
      # usbguard allow-device [device number]
```
* Mount device (example below, edit mount command to match your device and environment)
```
      # lsblk
      # mount /dev/sda1 /mnt
      # ls -l /mnt
```
* Block new device, check mount (it should be gone)
```
      # usbguard block-device [device number]
      # ls -l /mnt
```
* Extra Credit: plug in a different USB drive (and redirect it if using a VM).  It should be blocked by the default policy.
```
      # usbguard list-devices
=======
# usbguard allow-device [device number]
```
* Mount device (example below, edit mount command to match your device and environment)
```
# lsblk
# mount /dev/sda1 /mnt
# ls -l /mnt
```
* Block new device, check mount (it should be gone)
```
# usbguard block-device [device number]
# ls -l /mnt
```
* Extra Credit: plug in a different USB drive (and redirect it if using a VM).  It should be blocked by the default policy.
```
# usbguard list-devices
>>>>>>> d8090aee9fab6fbb7bc06f7ae56e19f15f192be6
```
* Examine /etc/usbguard/usbguard-daemon.conf file
  * It is well documented, note the default policies
* Run usbguard-example.sh
  * It will step thru creating custom rules
  * Also modifies config to allow non-root users to use usbguard
* Test non-root user
  * Remove any USB device from previous steps
  * Reinstate original configuration
	```
<<<<<<< HEAD
	     # usbguard generate-policy > /etc/usbguard/rules.conf
	     # systemctl restart usbguard
=======
	# usbguard generate-policy > /etc/usbguard/rules.conf
	# systemctl restart usbguard
>>>>>>> d8090aee9fab6fbb7bc06f7ae56e19f15f192be6
	```
  * Login (or su) as usbuser
	* List devices
	```
<<<<<<< HEAD
	     $ usbguard list-devices
	```
	* Plug in USB (and redirect it if using a VM) and as non-root user allow that device
	```
	     $ usbguard allow-device [device number]
  	   $ usbguard list-devices
=======
	$ usbguard list-devices
	```
	* Plug in USB (and redirect it if using a VM) and as non-root user allow that device
	```
	$ usbguard allow-device [device number]
  	$ usbguard list-devices
>>>>>>> d8090aee9fab6fbb7bc06f7ae56e19f15f192be6
	```
* Extra Credit: Test non-root user w/o usbguard privileges
  * Login (or su) as nousbuser
	* List devices (should fail)
	```
<<<<<<< HEAD
	     $ usbguard list-devices
	```
	* Plug in USB and as non-root user allow that device (should fail)
	```
	     $ usbguard allow-device [device number]
=======
	$ usbguard list-devices
	```
	* Plug in USB and as non-root user allow that device (should fail)
	```
	$ usbguard allow-device [device number]
>>>>>>> d8090aee9fab6fbb7bc06f7ae56e19f15f192be6
	```
* Cleanup via usbguard-cleanup.sh
  * Optional if demo VM is disposable
