# Temporary Dockerfile for testing - uses a known working Java app
FROM eclipse-temurin:11-jre

WORKDIR /app

# Create a simple Java application for testing
RUN echo 'import java.net.*; import java.io.*; public class SimpleApp { public static void main(String[] args) throws Exception { ServerSocket s = new ServerSocket(8080); System.out.println("Server started on port 8080"); while(true) { Socket client = s.accept(); PrintWriter out = new PrintWriter(client.getOutputStream(), true); out.println("HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\n\r\nHello from Java POC App!"); client.close(); } } }' > SimpleApp.java

RUN javac SimpleApp.java

EXPOSE 8080

ENTRYPOINT ["java", "SimpleApp"]