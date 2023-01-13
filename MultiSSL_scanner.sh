#!/bin/bash

# Check if testssl.sh and sslscan and nmap are installed
if ! which testssl > /dev/null || ! which sslscan > /dev/null || ! which nmap > /dev/null; then
  echo "Error: testssl or sslscan or nmap is not installed."
  echo "Installing testssl, sslscan, nmap"
  # install testssl, sslscan and nmap
  apt-get install -y testssl sslscan nmap
fi

# Get domain and report name from user input
read -p "Enter the domain to scan: " domain
read -p "Enter the report name for sslscan: " sslscan_report_name
read -p "Enter the report name for nmap: " nmap_report_name

# Add fancy signature
echo "Starting the scan with MULTISSL SCANNER by Srirammanan"
echo " __  __       _ _   _  _____ _____ _"   
echo "|  \/  |     | | | (_)/ ____/ ____| |"   
echo "| \  / |_   _| | |_ _| (___| (___ | |"  
echo "| |\/| | | | | | __| |\___ ||___ \| |"
echo "| |  | | |_| | | |_| |____) ____) | |____ "
echo "|_|  |_|\__,_|_|\__|_|_____|_____/|______|"

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
    sslscan "$domain" | sed -e 's/\x1b\[[0-9;]*m//g' | awk '{print "<pre>" $0 "</pre>"}' > "$sslscan_report_name"
    echo "sslscan html report generated in same file path"
fi

# Run nmap on the domain
if [ -x "$(command -v nmap)" ]; then
    echo "Running nmap on $domain..."
    nmap --script http-* --script ssl-* -sV "$domain" -oA "$domain" 
    xsltproc "$nmap_report_name.xml" -o "$nmap_report_name.html"
    echo "nmap html report generated"
fi
