#!/bin/bash

# Check if testssl.sh and sslscan and nmap are installed
if ! which testssl > /dev/null || ! which sslscan > /dev/null || ! which nmap > /dev/null || ! which figlet > /dev/null; then
  echo "Error: testssl or sslscan or nmap is not installed."
  echo "Installing testssl, sslscan, nmap"
  # install testssl, sslscan and nmap
  apt-get install -y testssl sslscan nmap figlet
fi


# Install figlet if not already installed
if ! which figlet > /dev/null; then
  apt-get install -y figlet
fi

# Display signature
tput setaf 3
figlet "MULTISSL SCANNER"
tput setaf 2


echo "MULTISSL SCANNER by Srirammanan"
echo "This script will scan a domain using testssl, sslscan, and nmap"
echo "Please enter the domain name, and options for testssl, sslscan and nmap"


# Get URL from user input
tput sgr0 
read -p "Enter the URL to scan: " url

# Extract domain name from URL
domain=$(echo $url | awk -F/ '{print $3}')
tput setaf 4
echo "The given URL:$url"


# Validate the domain using a regular expression
echo "The given domain: $domain Note: SSLSCAN and NMAP scan will take domain as input"
tput sgr0 
if [[ ! $domain =~ ^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
  echo "Error: Invalid domain name." >&2
  exit 1
fi

read -p "Enter the folder name for Reports: " folder_name
read -p "Enter the options you want to pass to Testssl (Ex: -L) : " testssl_options
read -p "Enter the options you want to pass to sslscan (Ex: --ssl2) : " sslscan_options
read -p "Enter the options you want to pass to nmap (Ex: --script ssl-* ) :" nmap_options
mkdir $folder_name
tput sgr0 

# testssl  
if [ -x "$(command -v testssl)" ]; then
    tput setaf 3
    echo ""
    echo "Running testssl on $url..."
    tput sgr0 
    testssl --htmlfile $folder_name/testsslReport.html $testssl_options $url
    echo ""
    echo "testssl html report generated with name testsslReport"
fi


#   sslscan  
if [ -x "$(command -v sslscan)" ]; then
tput setaf 3
    echo "Running sslscan on $domain..."
    tput sgr0 
    sslscan_output=$(sslscan $sslscan_options $domain)
    echo "$sslscan_output"
    echo ""
    echo "Converting the report to html"
    # Using sed command to convert sslscan report to html
    echo "$sslscan_output" | sed -e 's/\x1b\[[0-9;]*m//g' | awk '{print "<pre>" $0 "</pre>"}' > "$folder_name/SSLscanReport.html"
    echo ""
    echo "sslscan html report generated with name SSLscanReport"
    
     
fi

#   nmap  
if [ -x "$(command -v nmap)" ]; then
tput setaf 3
    echo "Running nmap on $domain..."
    tput sgr0 
    nmap -sV $nmap_options "$domain" -oX "$folder_name/nmapReport.xml"
    xsltproc "$folder_name/nmapReport.xml" -o "$folder_name/nmapReport.html"
    	if [ -f "$folder_name/nmapReport.xml" ]; then
    		rm "$folder_name/nmapReport.xml"
	fi

    echo ""
    echo "nmap html report generated with name nmapreport"
    echo ""
fi


