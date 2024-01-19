#!/bin/bash

IS_GREEN=$(docker container ls | grep green)

if [ $IS_GREEN ]; then # Current container: green or none

  echo "#### Turn on blue container ####"

  echo "1. Deploy spring as blue container"
  docker compose up -d blue --build

  echo "2. Wait until blue container turn on"
  while [ 1 = 1 ]; do
    sleep 2

    echo "    Health Check for blue container"
    STATUS=$(curl -s http://127.0.0.1:8081/health)
    if [ $STATUS ]; then
      echo "Successfully blue container turned on"
      break;
    fi
  done;

  echo "#### Turn off if there is green Container"
  docker container stop green

else # Current container: blue

  echo "#### Turn on green container ####"

  echo "1.Deploy spring as green container"
  docker compose up -d green --build

  echo "2. Wait until green container turn on"
  while [ 1 = 1 ]; do
    sleep 2

    echo "    Health Check for green container"
    STATUS=$(curl -s http://127.0.0.1:8080/health)
    if [ $STATUS ]; then
      echo "Successfully green container turned on"
      break;
    fi
  done;

  echo "#### Turn off if there is blue Container"
  docker container stop blue
fi