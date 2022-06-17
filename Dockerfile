FROM maven:3.6.3-jdk-11-slim AS build
RUN mkdir /project
COPY . /project
WORKDIR /project
RUN mvn clean package -DskipTests

FROM adoptopenjdk/openjdk11:jre-11.0.9.1_1-alpine
RUN mkdir /app
COPY --from=build /project/target/lab_4-1.0-SNAPSHOT.jar /app/java-app.jar
WORKDIR /app
CMD "java" "-jar" "java-app.jar"
