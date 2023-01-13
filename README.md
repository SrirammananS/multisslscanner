# MultiSSLscanner

MULTISSL SCANNER is a bash script that automates the process of scanning a domain using testssl, sslscan, and nmap. The script will check if testssl, sslscan and nmap are installed on the system and install them if they are not found.

Prerequisites
* testssl
* sslscan
* nmap

**Installation**

To install the script, simply clone or download the repository.


````
git clone https://github.com/srirammanan/multissl-scanner.git

````
**Usage**

To run the script, make it executable and run it.

Make sure the script has execute permissions, if not you can run this command to give execute permissions to the file

````
chmod +x multissl-scanner.sh
./multissl-scanner.sh

````
The script will prompt for the URL to scan and options for testssl, sslscan and nmap. The script will then extract the domain from the URL and validate it using a regular expression. The script will then run testssl, sslscan and nmap on the domain and generate HTML reports for each tool. The HTML reports will be saved in the folder name given by user.

**Note**

Reports will be stored in the folder name given by user
Make sure to have xsltproc installed in your system.

**License**

This project is licensed under the MIT License 
