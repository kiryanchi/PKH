FROM openjdk:17-jdk-slim

ARG PROFILE
COPY ./build/libs/app.jar app.jar

ENTRYPOINT java -jar -Dspring.profiles.active=$PROFILE /app.jar