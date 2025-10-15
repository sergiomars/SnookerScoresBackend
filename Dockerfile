FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY build/libs/*.jar app.jar
EXPOSE 8080
ENV JAVA_TOOL_OPTIONS="-Xmx128m -Xms64m -XX:MaxMetaspaceSize=32m -Xss512k"
CMD ["java", "-jar", "app.jar"]