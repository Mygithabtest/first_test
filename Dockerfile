FROM mcr.microsoft.com/openjdk/jdk:21-windowsservercore-ltsc2022

WORKDIR /app

# Copy the JAR file
COPY target/*.jar app.jar

# Expose port 8080
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]