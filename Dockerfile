FROM maven:3.6.3-jdk-11-slim AS build
RUN mkdir /project
COPY . /project
WORKDIR /project
RUN mvn clean package -DskipTests
CMD "java" "-jar" "target/lab_4-1.0-SNAPSHOT.jar"
