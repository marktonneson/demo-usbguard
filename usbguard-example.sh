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
   Step One: Create /root/rules.conf with this content which allows USB flash disks
             and explicitly rejects devices with an additional and suspicious interface.

	allow with-interface equals { 08:*:* }
	reject with-interface all-of { 08:*:* 03:00:* }
	reject with-interface all-of { 08:*:* 03:01:* }
	reject with-interface all-of { 08:*:* e0:*:* }
	reject with-interface all-of { 08:*:* 02:*:* }
"

echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

$FormatRunCommand
echo -e "allow with-interface equals { 08:*:* }\nreject with-interface all-of { 08:*:* 03:00:* }\nreject with-interface all-of { 08:*:* 03:01:* }\nreject with-interface all-of { 08:*:* e0:*:* }\nreject with-interface all-of { 08:*:* 02:*:* }">/root/rules.conf
cat /root/rules.conf

echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e $FormatTextSyntax "
   Step Two: Allow users from the usbguard group to modify USB device authorization state,
               list USB devices, listen to exception events, and list USB authorization policy.
"
echo -e $FormatTextCommands "
	# usbguard add-user -g usbguard --devices=modify,list,listen --policy=list --exceptions=listen
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

$FormatRunCommand
groupadd usbguard
id mark
usermod -G usbguard mark
id mark
usbguard add-user -g usbguard --devices=modify,list,listen --policy=list --exceptions=listen

echo -e $FormatTextSyntax "
   Step Three: Install the new rules
"
echo -e $FormatTextCommands "
	# usbguard generate-policy > /root/rules.conf
	# install -m 0600 -o root -g root /root/rules.conf /etc/usbguard/rules.conf
	# systemctl restart usbguard
"
echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

$FormatRunCommand
usbguard generate-policy > /root/rules.conf
echo -e "allow with-interface equals { 08:*:* }\nreject with-interface all-of { 08:*:* 03:00:* }\nreject with-interface all-of { 08:*:* 03:01:* }\nreject with-interface all-of { 08:*:* e0:*:* }\nreject with-interface all-of { 08:*:* 02:*:* }">>/root/rules.conf
install -m 0600 -o root -g root rules.conf /etc/usbguard/rules.conf
systemctl restart usbguard
