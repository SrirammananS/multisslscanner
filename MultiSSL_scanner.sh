#!/bin/bash

# Check if testssl.sh and sslscan and nmap are installed
if ! which testssl > /dev/null || ! which sslscan > /dev/null || ! which nmap > /dev/null; then
  echo "Error: testssl.sh or sslscan or nmap is not installed." >&2
  exit 1
fi

# Get domain from user input
read -p "Enter the domain to scan: " domain

# Run testssl.sh on the domain
if [ -x "$(command -v testssl)" ]; then
    echo "Running testssl on $domain..."
    testssl --html "$domain" 
    echo "testssl html report generated in same file path"
    echo ""
fi

# Run sslscan on the domain
if [ -x "$(command -v sslscan)" ]; then
    echo "Running sslscan on $domain..."
    sslscan "$domain" 
    echo "sslscan report generated"
    echo ""
    echo "Converting the report to html"
    # Using sed command to convert sslscan report to html
    sslscan "$domain" | sed -e 's/\x1b\[[0-9;]*m//g' | awk '{print "<pre>" $0 "</pre>"}' > "sslscanreport.html"
    echo "sslscan html report generated in same file path"
fi

# Run nmap on the domain
if [ -x "$(command -v nmap)" ]; then
    echo "Running nmap on $domain..."
    nmap --script http-* --script ssl-* -sV "$domain" -oA "$domain" 
    xsltproc "$domain.xml" -o "nmapresults.html"
    echo "nmap html report generated"
fi
