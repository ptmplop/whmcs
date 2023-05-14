#!/bin/sh

# Set database password
SQLPASSWD="whmcs"

# Set the wwwdir - there should be no need to change this.
export WEB_ROOT='/usr/local/apache2/htdocs'

# Start the containers (Use -d to backgroud the task)
#docker-compose up -d
docker-compose up
