# MultiSSLscanner

MULTISSL SCANNER is a bash script that automates the process of scanning a domain using testssl, sslscan, and nmap. The script will check if testssl, sslscan and nmap are installed on the system and install them if they are not found.

**Features**
* Scan SSL/TLS configurations of a website using testssl, sslscan, and nmap tools.
* Extracts domain name from the given URL.
* Generates reports in the form of HTML file.
* Validates the domain using a regular expression.
* Creates a folder to store the report files.
* Ability to choose which scans to run.
* Ability to pass options to the tools.
* Ability to compress the report files.

**Prerequisites**
* testssl
* sslscan
* nmap

**Installation**

To install the script, simply clone or download the repository.


````
git clone https://github.com/SrirammananS/multisslscanner.git

````
**Usage**

To run the script, make it executable and run it.

Make sure the script has execute permissions, if not you can run this command to give execute permissions to the file

````
cd multisslscanner 
chmod +x MultiSSL_Scanner 
./Multissl_Scanner

````
The script will prompt for the URL to scan and options for testssl, sslscan and nmap. The script will then extract the domain from the URL and validate it using a regular expression. The script will then run testssl, sslscan and nmap on the domain and generate HTML reports for each tool. The HTML reports will be saved in the folder name given by user.

**Note**

* Reports will be stored in the folder name given by user
* Make sure to have xsltproc installed in your system.
* This script is intended for educational and testing purposes only.
* You should not use this script on any website without the explicit consent of the website owner.
* The author of this script is not responsible for any damage caused by the use of this script.
* Always check the legality of using this script in your country before using it.

**Author**

Srirammanan

**License**

This project is licensed under the MIT License 
