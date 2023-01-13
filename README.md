# MultiSSLscanner
Create a new file with the extension .sh (e.g. "MultiSSL_scanner.sh") and paste the code into the file.

Open a terminal in Kali Linux and navigate to the directory where you saved the script file.

Make sure the script has execute permissions, if not you can run this command to give execute permissions to the file

````
chmod +x ssl_scan.sh
````


Run the following script and press enter.

```
./MultiSSL_scanner.sh
```


The script will prompt the user for a domain name, enter the domain name to scan.

The script will check if testssl.sh, sslscan, nmap are installed in the system and run the corresponding command.

The script will provide the user with the results of each scan.

You can also run the script by specifying the path of the script file

Note: depending on your specific Kali Linux installation, you may need to use "sudo" to execute the script as a superuser.
