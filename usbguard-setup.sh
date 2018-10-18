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

yum install -y usbguard

echo -e "
   To create the initial rule set, enter the following command as root:

	# usbguard generate-policy > /etc/usbguard/rules.conf

"
usbguard generate-policy > /etc/usbguard/rules.conf
cat /etc/usbguard/rules.conf

echo -e $FormatTextPause && read -p "<-- Press any key to continue -->" NULL

echo -e "
   Start the service

"
systemctl start usbguard
systemctl status usbguard

