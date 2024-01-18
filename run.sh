#!/bin/bash

IS_GREEN=$(docker container ls | grep green)

if [ $IS_GREEN ]; then # Current container: green

  echo "#### Green -> Blue ####"

  echo "1. Build Spring"
  ./gradlew bootJar

  echo "2. Deploy spring as blue container"
  docker compose up -d blue --build

  echo "3. Wait until blue container turn on"
  while [ 1 = 1 ]; do
    sleep 2

    echo "    Health Check for blue container"
    STATUS=$(curl -s http://127.0.0.1:8081/health)
    if [ $STATUS ]; then
      echo "    Successfully blue container turned on"
      break;
    fi
  done;

  echo "#### Turn off green Container"
  docker container stop green

else # Current container: blue

  echo "#### Blue -> Green ####"

  echo "1. Build Spring"
  ./gradlew bootJar

  echo "2.Deploy spring as green container"
  docker compose up -d green --build

  echo "3. Wait until green container turn on"
  while [ 1 = 1 ]; do
    sleep 2

    echo "    Health Check for green container"
    STATUS=$(curl -s http://127.0.0.1:8080/health)
    if [ $STATUS ]; then
      echo "    Successfully green container turned on"
      break;
    fi
  done;

  echo "#### Turn off blue Container"
  docker container stop blue
fi