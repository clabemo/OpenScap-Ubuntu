#!/bin/bash

DATE=$(date +%m%d%Y)

# Download oval file
wget -O /var/tmp/com.ubuntu.$(lsb_release -cs).usn.oval.xml.bz2 https://security-metadata.canonical.com/oval/com.ubuntu.$(lsb_release -cs).usn.oval.xml.bz2

# Extract the xml file
bunzip2 /var/tmp/com.ubuntu.$(lsb_release -cs).usn.oval.xml.bz2

# Scan for vulnerability
oscap oval eval --results /var/tmp/report_${DATE}.xml --report /var/tmp/report_${DATE}.html /var/tmp/com.ubuntu.$(lsb_release -cs).usn.oval.xml
