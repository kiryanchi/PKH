#!/bin/bash

# $1: on_container $2: port $3: off_container
run() {
  echo "#### Turn on $1 container"

  echo "1. Deploy $1 container"
  sudo docker compose up -d $1 --build

  echo "2. Wait until $1 turn on"
  while [ 1 = 1 ]; do
    sleep 3

    echo "    Health check for $1 container"
    STATUS=$(curl -s http://127.0.0.1:$2/health)
    if [ $STATUS ]; then
      echo "Successfully $1 turned on"
      break;
    fi
  done;

  echo "3. Apply $1 nginx config"
  sudo cp ./nginx/nginx.$1.conf /etc/nginx/nginx.conf
  sudo nginx -s reload

  echo "#### Turn off if there is $3 container"
  sudo docker container stop $3
}

IS_GREEN=$(sudo docker container ls | grep green)

if [ $IS_GREEN ]; then
  run blue 8081 green
else
  run green 8080 blue
fi
