#!/bin/bash

TextReset='\033[0m'
TextGreen='\033[32m'
TextBlue='\033[34m'
TextLightGrey='\033[37m'
TextBold='\033[1m'

FormatTextPause="$TextReset $TextLightGrey"  # Pause & continue
FormatTextCommands="$TextReset $TextGreen" # Commands to execute
FormatTextSyntax="$TextReset $TextBlue $TextBold" # Command Syntax & other text

# Place before command line to reset text format
FormatRunCommand="echo -e $TextReset"

# Reset text if script exits abnormally
trap 'echo -e $TextReset;exit' 1 2 3 15

clear

echo -e $FormatTextSyntax "
   Example Configuration:
	* Create a custom rule file
	* Only allow mass storage devices, block everything else
	* Only allow members of usbguard group to use USB devices
"

echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
   Step One: Create /root/new-rule.conf with this content which blocks any device that
             is not just a mass storage device. Devices with a hidden keyboard interface
             in a USB flash disk are blocked. Only devices with a single mass storage
             interface are allowed to interact with the operating system.
"
echo -e $FormatTextCommands "
	allow with-interface equals { 08:*:* }
"

echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

$FormatRunCommand
echo -e "allow with-interface equals { 08:*:* }">/root/new-rule.conf
cat /root/new-rule.conf

echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
   Step Two: Allow users from the usbguard group to modify USB device authorization state,
               list USB devices, listen to exception events, and list USB authorization policy.
"
echo -e $FormatTextCommands "
	Modify /etc/usbguard/usbguard-daemon.conf, add group (usbguard in this example) to IPCAllowedGroups

  IPCAllowedGroups=usbguard
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

$FormatRunCommand
groupadd usbguard
id usbuser
usermod -G usbguard usbuser
id usbuser
sed -i s/IPCAllowedGroups=$/IPCAllowedGroups=usbguard/ /etc/usbguard/usbguard-daemon.conf

echo -e $FormatTextSyntax "
   Step Three: Install the new rules
"
echo -e $FormatTextCommands "
  # usbguard generate-policy > /root/rules.conf
  # cat /root/new-rule.conf >> /root/rules.conf
	# install -m 0600 -o root -g root /root/rules.conf /etc/usbguard/rules.conf
	# systemctl restart usbguard
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

$FormatRunCommand
usbguard generate-policy > /root/rules.conf
cat /root/new-rule.conf >> /root/rules.conf
install -m 0600 -o root -g root /root/rules.conf /etc/usbguard/rules.conf
systemctl restart usbguard

echo -e $FormatTextCommands "
  View updated rules via:

  # usbguard list-rules
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

$FormatRunCommand
usbguard list-rules
