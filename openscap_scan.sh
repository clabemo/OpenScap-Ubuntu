#!/bin/bash

DATE=$(date +%m%d%Y)

# Download oval file
wget -O https://www.debian.org/security/oval/oval-definitions-bullseye.xml /var/tmp/oval-definitions-bullseye.xml

# Scan for vulnerability
oscap oval eval --results /var/tmp/report_${DATE}.xml --report /var/tmp/report_${DATE}.html /var/tmp/oval-definitions-bullseye.xml
