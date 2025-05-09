





# Etap 1: Budowanie aplikacji
FROM maven:3.9.6-eclipse-temurin-21 AS builder
WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests

# Etap 2: Obraz końcowy
FROM eclipse-temurin:17-jdk-alpine
COPY --from=builder /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]


# RUN addgroup -S spring && adduser -S spring -G spring
# USER spring
