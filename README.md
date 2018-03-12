# URL Status Code Monitoring

## Getting Started
This script helps to monitor the return code status of URLs to ensure that they are operational. It will output URLs that has non-200/301/302/304 response code.

### Environment
This has been tested on:
1. nginx version: nginx/1.10.3 (Ubuntu)
2. PHP 7.0.25-0ubuntu0.16.04.1

## Setting Up
1. Add the urlcheck.sh and pt files on your preferred directory. If you are using different directory from what is defined on the script, please also update the location on the script itself.
- Input your URL/s on pt file.
- pt_output file contains the status of URL.
- pt_result.csv only contains csv formatted output.
2. Place index.php on your nginx document root - usually under /var/www/html. Update the csv file location on index.php if you placed it somewhere else. This converts your csv output file into a table format.

3. Configure nginx setup and place the default-nginx-config under /etc/nginx/sites-enabled directory. Modify the document root if you're using other location. If PHP version is not 7.0, please also update on the config file.

4. Run the urlcheck script.
``` 
$ cd /to/where/you/placed/it
$ chmod u+x urlcheck.sh
$ ./urlcheck.sh
``` 
- You may setup a cron job so it will run every x minutes.

5. Access localhost from your preferred web browser to view output. You will only get an output if there's a URL that has non-200/301/302/304 so you may take appropriate action depending on the current status.
May refer to https://en.wikipedia.org/wiki/List_of_HTTP_status_codes for the list of http return codes.
