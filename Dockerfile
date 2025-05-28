FROM eclipse-temurin:11-jre-alpine

WORKDIR /app

# Copy the JAR file
COPY target/*.jar app.jar

# Expose port 8080
EXPOSE 8080

# Create a non-root user
RUN addgroup -g 1001 -S appgroup && \
    adduser -u 1001 -S appuser -G appgroup

USER appuser

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]