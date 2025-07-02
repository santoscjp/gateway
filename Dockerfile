FROM maven:3.9.6-eclipse-temurin-21 AS build
COPY . .
RUN mvn clean package

FROM openjdk:21
EXPOSE 8080
COPY --from=build /target/gateway-0.0.1-SNAPSHOT.jar app.jar

LABEL authors="Grupo5"

ENTRYPOINT ["java", "-jar", "/app.jar"]