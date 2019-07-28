#!/bin/bash

#Create mysql_data direcotry on a local machine
mkdir mysql_data

#Create app directory
mkdir app
cd app
cat > index.html <<EOF
<html>
<body>
        <h1> WELL DONE </h1>
    <IMG SRC="https://www.electric-skateboard.builders/uploads/db1493/original/3X/d/b/db1e29d562e2ea80ce54fcf2ee439cb507254237.gif">
</body>
</html>
EOF

chmod +x index.html

cd ..

#Create yaml file
cat > docker-stack.yml <<EOF
version: '3'
services:
  web:
    image: php:7.0-apache
    volumes:
      - ./app/:/var/www/html/
    networks:
      - frontend
    ports:
      - 80:80
    deploy:
      replicas: 1
      restart_policy:
        condition: on-failure
  db:
    image: mysql:latest
    volumes:
      - mysql_data:/var/lib/mysql
    environment:
      MYSQL_DATABASE: mydb
      MYSQL_USER: dbuser
      MYSQL_PASSWORD: userpass
      MYSQL_ROOT_PASSWORD: password
    ports:
      - 3306:3306
    networks:
      - backend
    deploy:
      replicas: 1
      restart_policy:
        condition: on-failure
        
networks:
  frontend:
  backend:
volumes:
  mysql_data:
  app:
EOF

#Change mode
chmod +x docker-stack.yml

#Then use yaml file to create application stack
docker stack deploy endava-challenge --compose-file docker-stack.yml
