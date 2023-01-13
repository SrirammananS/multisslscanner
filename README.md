# MultiSSLscanner

Open a terminal in Kali Linux and clone this repository 

Navigate to the directory where you cloned the script file.


````
cd multisslscanner 
````

Make sure the script has execute permissions, if not you can run this command to give execute permissions to the file

````
chmod +x MultiSSL_scanner.sh
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

Happy pentesting
