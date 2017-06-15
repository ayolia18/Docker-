#!/bin/bash

sudo docker run --name mysql -e MYSQL_ROOT_PASSWORD=0000 -d mysql:latest > container_id_mysql.txt
container_id_mysql="$(cut -c1-12 container_id_mysql.txt)"


sudo docker build -f dockerServer -t apache .
echo ${container_id_mysql} "fsdfsdfsffgfdhdfhgfhdf"
sudo docker run --name apache --link ${container_id_mysql} -p 4000:80 -d apache > container_id_apache.txt
container_id_apache="$(cut -c1-12 container_id_apache.txt)"
sudo docker exec -it ${container_id_apache} bash

sudo apt-get install mysql-client curl sudo git
