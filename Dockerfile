FROM eclipse-temurin:17-jdk-alpine

RUN addgroup -S spring && adduser -S spring -G spring
USER spring

COPY target/* app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]


