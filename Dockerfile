FROM eclipse-temurin:11-jre

WORKDIR /app

# Copy the JAR file
COPY target/*.jar app.jar

# List what we copied for debugging
RUN ls -la /app/

# Check if it's a valid JAR
RUN file /app/app.jar

# Expose port 8080
EXPOSE 8080

# Run with more verbose logging
ENTRYPOINT ["sh", "-c", "echo 'Starting Java application...' && echo 'Java version:' && java -version && echo 'Starting JAR:' && java -jar app.jar"]