# --- GIAI ĐOẠN 1: BUILD ---
FROM maven:3.9.11-eclipse-temurin-25 AS builder
WORKDIR /app
COPY . .
# Biên dịch code thành file .jar (bỏ qua chạy thử test để build nhanh)
RUN mvn package -DskipTests

# --- GIAI ĐOẠN 2: CHẠY ỨNG DỤNG ---
FROM eclipse-temurin:25-jre
WORKDIR /app

# Copy jar đã build từ stage builder
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

# Chạy ứng dụng Spring Boot
ENTRYPOINT ["java", "-jar", "/app/app.jar"]